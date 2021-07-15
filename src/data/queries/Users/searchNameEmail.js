// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
} from "graphql";
import sequelize from "../../sequelize";
import { User, UserProfile, UserLogin, Payout } from "../../models";

import WholeAccountListType from "../../types/WholeAccountListType";

const searchNameEmail = {
  type: WholeAccountListType,
  args: {
    keyword: { type: StringType },
  },
  async resolve({ request, response }, { keyword }) {
    let currentToken, where;

    try {
      if (request.user) {
        //Collect from Logged-in User
        let userId = request.user.id;
        currentToken = request.headers.auth;
        where = {
          userId: request.user.id,
          key: currentToken,
        };

        const checkLogin = await UserLogin.findOne({
          attributes: ["id"],
          where,
        });

        if (!checkLogin)
          return {
            errorMessage: "You haven't authorized for this action.",
            status: 500,
          };

        //find friend with phonenumber
        const users = await User.findAll({
          where: {
            $or: [
              {
                email: { $like: "%" + keyword + "%" },
              },
              {
                "$profile.firstName$": {
                  $like: "%" + keyword + "%",
                },
              },
              {
                "$profile.lastName$": {
                  $like: "%" + keyword + "%",
                },
              },
            ],
            deletedAt: null,
          },
          order: [[`createdAt`, `DESC`]],
          include: [
            {
              model: UserProfile,
              as: "profile",
              required: true,
            },
          ],
        });

        //Success Result
        return {
          result: users,
          status: 200,
        };
      } else {
        return {
          status: 500,
          errorMessage: "You must login to get your profile information.",
        };
      }
    } catch (error) {
      return {
        errorMessage: "Something went wrong" + error,
        status: 400,
      };
    }
  },
};

export default searchNameEmail;

/*
query ($phonenumber: String!) {
  searchPhoneNumber(phonenumber: $phonenumber) {
    result {
      userId
      email
      firstName
      lastName
      phoneNumber
      phoneDialCode
      phoneCountryCode
      picture
      state
      city
      zipcode
      country
      isBan
      isActive
    }
    status
    errorMessage
  }
}

{
  "phonenumber": "555"
}
*/

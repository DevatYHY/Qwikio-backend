import CommonType from "../../types/CommonType";
import { User, UserLogin, UserProfile } from "../../models";
import WholeAccountType from "../../types/WholeAccountType";
import {
  GraphQLFloat as FloatType,
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
  GraphQLString as StringType,
} from "graphql";

const sendMoney = {
  type: WholeAccountType,

  args: {
    amount: { type: new NonNull(FloatType) },
    receiverId: { type: StringType },
  },

  async resolve({ request }, { amount, receiverId }) {
    let currentToken, where;

    try {
      if (request.user) {
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

        if (checkLogin) {
          const profile = await UserProfile.findOne({ where: { userId } });
          let walletBalance = profile.walletBalance;

          if (walletBalance >= amount) {
            const receiverProfile = await UserProfile.findOne({
              where: { userId: receiverId },
            });
            let receiverWalletBalance = receiverProfile.walletBalance;

            walletBalance -= amount;
            receiverWalletBalance += amount;

            await UserProfile.update(
              { walletBalance: walletBalance },
              { where: { userId } }
            );
            await UserProfile.update(
              { walletBalance: receiverWalletBalance },
              { where: { userId: receiverId } }
            );
            
            return {
              result: { walletBalance: walletBalance },
              status: 200,
            };
          } else {
            return {
              errorMessage: "You have not enough balance.",
              status: 400,
            };
          }
        } else {
          return {
            errorMessage: "You haven't authorized for this action.",
            status: 500,
          };
        }
      } else {
        return {
          errorMessage: "Please login for this action.",
          status: 500,
        };
      }
    } catch (error) {
      return {
        errorMessage: "Something went wrong " + error,
        status: 400,
      };
    }
  },
};

export default sendMoney;

/**
mutation updateDriverLocation($lat: Float!, $lng: Float!) {
  updateDriverLocation(lat: $lat, lng: $lng) {
    status
    errorMessage
  }
}
 */

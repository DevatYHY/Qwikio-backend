// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import { User, UserProfile, UserLogin, Payout } from '../../models';

import WholeAccountType from '../../types/WholeAccountType';

const searchPhoneNumber = {

  type: WholeAccountType,
  args: {
    phonenumber: { type: StringType }
  },
  async resolve({ request, response }, {
    phonenumber
  }) {

    let currentToken, where;

    try {
      if (request.user) {

        //Collect from Logged-in User
        let userId = request.user.id;
        currentToken = request.headers.auth;
        where = {
          userId: request.user.id,
          key: currentToken
        };

        const checkLogin = await UserLogin.findOne({
          attributes: ['id'],
          where
        });

        if (!checkLogin)
          return {
            errorMessage: "You haven't authorized for this action.",
            status: 500
          };

        //find friend with phonenumber
        const user = await User.findOne({
          where: {
            phonenumber: phonenumber,
            deletedAt: null
          },
          order: [[`createdAt`, `DESC`]],
          raw: true
        });

        if (!user)
          return {
            status: 500,
            errorMessage: 'Can not find such phone number.'
          }

        // Get All Friend's Profile Data
        const userProfile = await UserProfile.findOne({
          attributes: [
            'profileId',
            'firstName',
            'lastName',
            'picture',
            'lat',
            'lng',
            'state',
            'city',
            'zipcode',
            'country',
            'preferredCurrency',
            'preferredLanguage',
            'preferredPaymentMethod',
            'paymentCustomerId',
            'licenceFront',
            'licenceBack',
            'cardLastFour',
            'cardToken',
            'sourceId',
            'walletBalance',
            'walletUsed'
          ],
          where: { userId: user.id },
          raw: true
        });

        if (!userProfile)
          return {
            status: 500,
            errorMessage: 'Something went wrong with his profile.'
          }

        //Success Result  
        return {
          result: {
            userId: user.id,
            email: user.email,
            firstName: userProfile.firstName,
            lastName: userProfile.lastName,
            picture: userProfile.picture,
            state: userProfile.state,
            city: userProfile.city,
            zipcode: userProfile.zipcode,
            country: userProfile.country,
            isBan: user.isBan,
            isActive: user.isActive,
            phoneNumber: user.phoneNumber,
            phoneDialCode: user.phoneDialCode,
            phoneCountryCode: user.phoneCountryCode,
          },
          status: 200
        }
      } else {
        return {
          status: 500,
          errorMessage: 'You must login to get your profile information.'
        }
      }

    } catch (error) {
      return {
        errorMessage: 'Something went wrong' + error,
        status: 400
      };
    }
  }
};

export default searchPhoneNumber;

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

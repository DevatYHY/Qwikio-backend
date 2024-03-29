import UserAccountType from '../../types/userAccountType';
import CommonType from '../../types/CommonType';
import stripePackage from 'stripe';
import { UserProfile } from '../../models';

import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
} from 'graphql';

import { payment } from '../../../config';

import { getCustomerId } from '../../../libs/payment/stripe/helpers/getCustomerId';

const stripe = stripePackage(payment.stripe.secretKey);

const addCardDetails = {

  type: CommonType,

  args: {
    cardToken: { type: new NonNull(StringType) },
    paymentMethod: { type: new NonNull(StringType) },
    cardLastFour: { type: new NonNull(StringType) },
  },

  async resolve({ request }, { cardToken, paymentMethod, cardLastFour }) {

    if (request.user) {

      let userId = request.user.id, email = request.user.email, customerId, createCustomer;
      let status = 200, errorMessage, updateUserProfile;
      let paymentIntentId, requireAdditionalAction = false, paymentIntentSecret = null;

      try {
        customerId = await getCustomerId(userId);

        // If new, create new customer
        if (!customerId) {
          createCustomer = await stripe.customers.create(
            { email: email }
          );
          if (!(createCustomer && createCustomer.id)) return { status: 400, errorMessage: 'Oops, something went wrong! Unable to connect your card' };

          customerId = createCustomer.id;
          await UserProfile.update({ paymentCustomerId: customerId }, { where: { userId } });
        }

        //Attach PaymentMethod to customer
        let pm = await stripe.paymentMethods.attach(
          paymentMethod,
          { customer: customerId }
        );        

        //update Profile - paymentmethod, cardlastfour
        updateUserProfile = await UserProfile.update({
          paymentCustomerId: customerId,
          cardLastFour,
          preferredPaymentMethod: 2,
          paymentMethodId: pm.id,
          cardToken
        }, {
          where: {
            userId
          }
        });

        return { status: 200 };

      } catch (error) {

        return { status: 400, errorMessage: 'Oops, something went wrong!' + error };

      }



      // try {
      //   if (status == 200) {
      //     let paymentIntent = await stripe.setupIntents.create({
      //       payment_method: paymentMethod,
      //       payment_method_types: ['card'],
      //       confirm: true,
      //       customer: customerId,
      //       usage: 'off_session'
      //     });

      //     if (paymentIntent && paymentIntent.status === 'requires_action' && paymentIntent.next_action
      //       && paymentIntent.next_action.type == 'use_stripe_sdk') {
      //       // Authentication requires for the 3D secure cards
      //       requireAdditionalAction = true;
      //       paymentIntentSecret = paymentIntent.client_secret;
      //       paymentIntentId = paymentIntent.id;
      //       status = 200;
      //     } else if (paymentIntent && paymentIntent.status === 'succeeded') {
      //       // No need authentication for the non 3D secure cards
      //       status = 200;
      //       const attachCardToCustomer = await stripe.paymentMethods.attach(
      //         paymentIntent.payment_method, {
      //         customer: customerId,
      //       }
      //       );
      //     } else {
      //       status = 400;
      //       errorMessage = 'Oops, something went wrong! Please try again.'
      //     }
      //   } else {
      //     status = 400;
      //     errorMessage = 'Oops, something went wrong!, We are unable to connect your card.';
      //   }
      // } catch (error) {
      //   errorMessage = 'Oops, something went wrong!' + error;
      //   status = 400;
      // }

      // if (status == 200 && !requireAdditionalAction) {
      //   updateUserProfile = await UserProfile.update({
      //     paymentCustomerId: customerId,
      //     cardLastFour,
      //     preferredPaymentMethod: 2,
      //     paymentMethodId: paymentMethod
      //   },
      //     {
      //       where: {
      //         userId
      //       }
      //     });
      // }

      // return await {
      //   status,
      //   errorMessage,
      //   requireAdditionalAction,
      //   paymentIntentSecret,
      //   paymentIntentId,
      // }
    } else {
      return {
        status: 500,
        errorMessage: 'You are not LoggedIn'
      }
    }
  },
};

export default addCardDetails;

/**
mutation addCardDetails($cardLastFour: String!, $actionType: String!, $paymentMethod: String!) {
  addCardDetails(cardLastFour: $cardLastFour, actionType: $actionType, paymentMethod: $paymentMethod) {
    status
    errorMessage
    requireAdditionalAction
    paymentIntentSecret
    paymentIntentId
  }
}

 */

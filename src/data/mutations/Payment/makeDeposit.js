import CommonType from "../../types/CommonType";
import { User, UserLogin, UserProfile } from "../../models";
import WholeAccountType from "../../types/WholeAccountType";
import stripePackage from "stripe";
import { payment } from "../../../config";
import {
  GraphQLFloat as FloatType,
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
  GraphQLString as StringType,
} from "graphql";

const stripe = stripePackage(payment.stripe.secretKey);

const makeDeposit = {
  type: WholeAccountType,

  args: {
    amount: { type: new NonNull(FloatType) },
    currency: { type: StringType },
  },

  async resolve({ request }, { amount, currency }) {
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

          const paymentIntent = await stripe.paymentIntents.create({
            amount: amount * 100,
            currency: currency,
            payment_method_types: ["card"],
            confirm: true,
            payment_method: profile.paymentMethodId,
            customer: profile.paymentCustomerId,
          });
          if (
            paymentIntent &&
            paymentIntent.id &&
            paymentIntent.status == "succeeded"
          ) {
            let walletBalance = profile.walletBalance + amount;
            await UserProfile.update(
              { walletBalance: walletBalance },
              { where: { userId } }
            );
            return {
              result: { walletBalance: walletBalance },
              status: 200,
            };
          } else {
            return {
              errorMessage: "Unable to process deposit.",
              status: 500,
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

export default makeDeposit;

/**
mutation makeDeposit($amount: Float!, $currency: String) {
  makeDeposit(amount: $amount, currency: $currency) {
    result {
      walletBalance
    }
    status
    errorMessage
  }
}

{
	"amount": 12,
	"currency": "usd"
}
 */

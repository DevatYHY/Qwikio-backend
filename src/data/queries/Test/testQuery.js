// GrpahQL
import {
  GraphQLString as StringType,
  GraphQLNonNull as NonNull,
  GraphQLInt as IntType,
} from "graphql";

// Models
import { User, Vehicles } from "../../models";

// Types
import CommonType from "../../types/CommonType";

import { getCustomerId } from "../../../libs/payment/stripe/helpers/getCustomerId";
import stripePackage from "stripe";
import { payment } from "../../../config";
const stripe = stripePackage(payment.stripe.secretKey);

const testQuery = {
  type: CommonType,

  args: {
    data: { type: StringType },
  },

  async resolve({ request, response }, { data }) {
    try {
      if (request.user) {
        let userId = request.user.id;
        // const userData = await User.findOne({ where: { id: userId } });

        // stripe.balance.retrieve(function (err, balance) {
        //     console.log(balance);
        // });

        // const token = await stripe.tokens.create({
        //     card: {
        //         number: '4242424242424242',
        //         exp_month: 6,
        //         exp_year: 2022,
        //         cvc: '111',
        //     },
        // });
        // console.log(token);

        // const token = await stripe.tokens.retrieve(
        //     'tok_1J2cS8BgfVkHvPrJe454CL3x'
        // );
        // console.log(token);

        // const paymentMethod = await stripe.paymentMethods.create({
        //     type: 'card',
        //     card: {
        //         number: '4111111111111111',
        //         exp_month: 6,
        //         exp_year: 2022,
        //         cvc: '111',
        //     },
        // });
        // console.log(paymentMethod);

        // const paymentMethod = await stripe.paymentMethods.retrieve(
        //     'pm_1J2cS8BgfVkHvPrJYiAifnE2'
        // );
        // console.log(paymentMethod);

        // let createCustomer = await stripe.customers.create(
        //     {
        //         email: 'rider@test.com',
        //         payment_method: 'pm_1J2fevBgfVkHvPrJd8QKVj2F',
        //     }
        // );
        // console.log(createCustomer);

        // const charge = await stripe.charges.create({
        //     amount: 3000,
        //     currency: 'usd',
        //     source: 'tok_1J2cS8BgfVkHvPrJe454CL3x',
        //     description: 'Charge from mobile',
        // });
        // console.log(charge);

        const paymentIntent = await stripe.paymentIntents.create({
          amount: 5500,
          currency: "usd",
          payment_method_types: ["card"],
          confirm: true,
          payment_method: "pm_1J2zp6BgfVkHvPrJswl1L3g0",
          customer: "cus_JgMLk12NGmxwU5",
        });
        console.log(paymentIntent);

        // const card = await stripe.customers.createSource("cus_JgMLk12NGmxwU5", {
        //   source: "tok_1J3HahBgfVkHvPrJH1IVodYr",
        // });
        // console.log(card);

        // const account = await stripe.accounts.create({
        //   type: "custom",
        //   country: "US",
        //   email: "jenny.rosen@example.com",
        //   capabilities: {
        //     card_payments: { requested: true },
        //     transfers: { requested: true },
        //   },
        // });
        // console.log(account);

        // const card = await stripe.accounts.createExternalAccount(
        //   "acct_1J3Hm3PYVdjCqOW7",
        //   { external_account: "tok_mastercard_debit" }
        // );
        // console.log(card);

        // const payout = await stripe.payouts.create({
        //   amount: 100,
        //   currency: "usd",
        //   destination: "acct_1IJY3ePZVrY4GTtI",
        // });
        // console.log(payout);

        return {
          errorMessage: "Hi",
          status: 200,
        };
      } else {
        return {
          errorMessage: "Please login for this action.",
          status: 500,
        };
      }
    } catch (error) {
      return {
        errorMessage: "Something went wrong. " + error,
        status: 400,
      };
    }
  },
};

export default testQuery;

/*

mutation (
    $vehicleName: String,
    $vehicleNumber: String,
    $availableSeats: Int,
    $vehicleType: Int,
    $vehicleRC: String,
    $vehicleInsurance: String
) {
    updateVehicle(
        vehicleName: $vehicleName,
        vehicleNumber: $vehicleNumber,
        availableSeats: $availableSeats,
        vehicleType: $vehicleType,
        vehicleRC: $vehicleRC,
        vehicleInsurance: $vehicleInsurance) {
    status
    errorMessage
  }
}


{
  "vehicleName": "good car",
  "vehicleNumber": "23456",
  "availableSeats": 12,
  "vehicleType": 2,
  "vehicleRC": "x",
  "vehicleInsurance": "y"
}
*/

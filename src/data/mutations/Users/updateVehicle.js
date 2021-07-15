// GrpahQL
import {
    GraphQLString as StringType,
    GraphQLNonNull as NonNull,
    GraphQLInt as IntType,
} from 'graphql';

// Models
import { User, Vehicles } from '../../models';

// Types
import CommonType from '../../types/CommonType';

const updateVehicle = {

    type: CommonType,

    args: {
        vehicleName: { type: StringType },
        vehicleNumber: { type: StringType },
        availableSeats: { type: IntType },
        vehicleType: { type: IntType },
        vehicleRC: { type: StringType },
        vehicleInsurance: { type: StringType },
    },

    async resolve({ request, response }, {
        vehicleName,
        vehicleNumber,
        availableSeats,
        vehicleType,
        vehicleRC,
        vehicleInsurance,
    }) {
        try {
            if (request.user) {
                let userId = request.user.id;
                const userData = await User.findOne({ where: { id: userId } });
                if (userData.userType != 2) return { status: 400, errorMessage: "You are not driver!" };

                const vehicleData = await Vehicles.update(
                    {
                        vehicleName: vehicleName,
                        vehicleNumber: vehicleNumber,
                        availableSeats: availableSeats,
                        vehicleType: vehicleType,
                        vehicleRC: vehicleRC,
                        vehicleInsurance: vehicleInsurance,
                    },
                    { where: { userId: userId } });

                return { status: 200 };

            } else {
                return {
                    errorMessage: "Please login for this action.",
                    status: 500
                };
            }
        } catch (error) {
            return {
                errorMessage: 'Something went wrong. ' + error,
                status: 400
            }
        }
    }
};

export default updateVehicle;

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
import { User, SavedLocations } from "../../models";

import SavedLocationsCommonType from "../../types/SavedLocationsCommonType";
import {
  GraphQLString as StringType,
  GraphQLInt as IntType,
  GraphQLNonNull as NonNull,
  GraphQLFloat as FloatType,
} from "graphql";

const getAllSavedLocations = {
  type: SavedLocationsCommonType,
  args: {
    locationType: { type: StringType },
  },

  async resolve({ request }, { locationType }) {
    try {
      if (request.user) {
        let userId = request.user.id;

        const checkUserBan = await User.findOne({
          where: {
            id: userId,
            isBan: true,
          },
        });

        if (checkUserBan) {
          return await {
            status: 500,
            errorMessage:
              "Oops! it looks like your account has been blocked. Please contact support.",
          };
        } else {
          if (locationType) {
            let result = await SavedLocations.findAll({
              where: {
                userId,
                locationType,
              },
            });
            return await {
              result,
              status: 200,
            };
          } else {
            let result = await SavedLocations.findAll({
              where: {
                userId,
              },
            });
            return await {
              result,
              status: 200,
            };
          }
        }
      } else {
        return await {
          status: 500,
          errorMessage:
            "Oops! it looks like you are not logged in with your account. Please login and continue.",
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

export default getAllSavedLocations;

/**
query {
  getAllSavedLocations {
    result {
        id
        userId
        location
        lat
        lng
        locationType
        locationName
    }
    status
    errorMessage
  }
}

 */

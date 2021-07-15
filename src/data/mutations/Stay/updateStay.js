import GetStayType from '../../types/GetStayType';
import { Stay } from '../../models';

import { GraphQLInt, GraphQLBoolean, GraphQLNonNulll, GraphQLFloat, GraphQLString } from 'graphql';

const updateStay = {

    type: GetStayType,

    args: {
        id: { type: GraphQLInt },
        name: { type: GraphQLString },
        description: { type: GraphQLString },
        capacity: { type: GraphQLInt }
    },

    async resolve({ request }, { id, name, description, capacity }) {
        try {

            if (request.user) {
                let userId = request.user.id;

                const updateStatus = await Stay.update({ name, description, capacity, }, { where: { id: id } });

                if (updateStatus) {
                    const $record = await Stay.findOne({
                        attributes: ['id', 'name', 'description', 'capacity'],
                        where: { id: id }
                    });
                    return {
                        results: [$record],
                        status: 200
                    };
                } else {
                    return {
                        status: 400,
                        errorMessage: "Unable to update the status."
                    };
                }

            } else {
                return {
                    status: 500,
                    errorMessage: "Please login for this action.",
                };
            }

        } catch (error) {
            return {
                status: 400,
                errorMessage: 'Something went wrong ' + error,
            };
        }

    },
};

export default updateStay;

/**
mutation ($id: Int, $name: String, $description: String, $capacity: Int) {
  updateStay(id: $id, name: $name, description: $description, capacity: $capacity) {
    results {
      id
      name
      description
      capacity
    }
    status
    errorMessage
  }
}
{
	"id": 5,
	"name": "Wowupdate",
	"description": "xxx",
	"capacity": 9
}
 */

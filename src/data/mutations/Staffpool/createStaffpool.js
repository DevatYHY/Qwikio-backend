import GetStaffpoolType from '../../types/GetStaffpoolType';
import { Staffpool } from '../../models';

import { GraphQLInt, GraphQLBoolean, GraphQLNonNulll, GraphQLFloat, GraphQLString } from 'graphql';
import { try } from 'bluebird';

const createStaffpool = {

    type: GetStaffpoolType,

    args: {
        company: { type: GraphQLString },
    },

    async resolve({ request }, { company }) {
        try {

            if (request.user) {
                let userId = request.user.id;

                try {
                    const newStaffpool = await newStaffpool.create({
                        name, description, capacity
                    });
                } catch (error) {
                    
                }


                const newStaffpool = await Stay.update({ name, description, capacity, }, { where: { id: id } });

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

export default createStaffpool;

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

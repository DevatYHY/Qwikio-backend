import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import StaffpoolType from './StaffpoolType';

const StaffpoolData = new ObjectType({
    name: 'Staffpools',
    fields: {
        results: {
            type: new List(StaffpoolType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default StaffpoolData;

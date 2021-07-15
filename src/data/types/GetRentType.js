import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import RentType from './RentType';

const RentData = new ObjectType({
    name: 'Rents',
    fields: {
        results: {
            type: new List(RentType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default RentData;

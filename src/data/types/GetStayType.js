import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import StayType from './StayType';

const StayData = new ObjectType({
    name: 'Stays',
    fields: {
        results: {
            type: new List(StayType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default StayData;

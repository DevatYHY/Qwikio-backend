import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import FlyType from './FlyType';

const FlyData = new ObjectType({
    name: 'Flies',
    fields: {
        results: {
            type: new List(FlyType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default FlyData;

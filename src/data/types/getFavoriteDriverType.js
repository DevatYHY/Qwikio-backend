import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import FavoriteDriverType from './FavoriteDriverType';

const FavoriteDriverData = new ObjectType({
    name: 'FavoriteDrivers',
    fields: {
        results: {
            type: new List(FavoriteDriverType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default FavoriteDriverData;

import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import PlaceType from './PlaceType';

const PlaceData = new ObjectType({
    name: 'Places',
    fields: {
        results: {
            type: new List(PlaceType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default PlaceData;

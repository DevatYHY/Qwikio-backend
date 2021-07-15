import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import EventType from './EventType';

const EventData = new ObjectType({
    name: 'Events',
    fields: {
        results: {
            type: new List(EventType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default EventData;

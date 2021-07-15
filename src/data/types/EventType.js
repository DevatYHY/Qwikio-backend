import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen
} from 'graphql';


const EventType = new ObjectType({
    name: 'EventType',
    fields: {
        id: {
            type: IntType
        },
        name: {
            type: StringType
        },
        description: {
            type: StringType
        },
        date: {
            type: StringType
        },
        code: {
            type: StringType
        },       
    }
});

export default EventType;
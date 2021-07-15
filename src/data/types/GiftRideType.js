import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen
} from 'graphql';


const GiftRideType = new ObjectType({
    name: 'GiftRideType',
    fields: {
        id: {
            type: IntType
        },
        sender_id: {
            type: StringType
        },
        receiver_id: {
            type: StringType
        },
        status: {
            type: IntType
        },
    }
});

export default GiftRideType;
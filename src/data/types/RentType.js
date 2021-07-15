import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen,
    GraphQLFloat as FloatType,
} from 'graphql';


const RentType = new ObjectType({
    name: 'RentType',
    fields: {
        id: {
            type: IntType
        },
        type: {
            type: StringType
        },
        name: {
            type: StringType
        },
        price: {
            type: FloatType
        },
        speed: {
            type: FloatType
        },
    }
});

export default RentType;
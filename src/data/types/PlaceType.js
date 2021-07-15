import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen,
    GraphQLFloat as FloatType,
} from 'graphql';


const PlaceType = new ObjectType({
    name: 'PlaceType',
    fields: {
        id: {
            type: IntType
        },
        name: {
            type: StringType
        },
        price: {
            type: FloatType
        },       
    }
});

export default PlaceType;
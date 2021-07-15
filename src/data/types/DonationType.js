import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen,
    GraphQLFloat as FloatType,
} from 'graphql';


const DonationType = new ObjectType({
    name: 'DonationType',
    fields: {
        id: {
            type: IntType
        },
        donator: {
            type: StringType
        },
        amount: {
            type: FloatType
        },       
        status: {
            type: IntType
        },
    }
});

export default DonationType;
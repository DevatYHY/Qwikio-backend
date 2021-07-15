import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen
} from 'graphql';


const StaffpoolType = new ObjectType({
    name: 'StaffpoolType',
    fields: {
        id: {
            type: IntType
        },
        company: {
            type: StringType
        },
        code: {
            type: StringType
        },       
        status: {
            type: IntType
        },
    }
});

export default StaffpoolType;
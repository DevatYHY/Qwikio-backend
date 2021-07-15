import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanType
} from 'graphql';


const StayType = new ObjectType({
    name: 'StayType',
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
        capacity: {
            type: IntType
        },
    }
});

export default StayType;
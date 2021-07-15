import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen
} from 'graphql';


const FlyType = new ObjectType({
    name: 'FlyType',
    fields: {
        id: {
            type: IntType
        },
        depature_from: {
            type: StringType
        },
        arrival_at: {
            type: StringType
        },
        depature_date: {
            type: StringType
        },
        passengers: {
            type: StringType
        },
        class: {
            type: IntType
        },
    }
});

export default FlyType;
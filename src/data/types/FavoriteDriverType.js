import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanType
} from 'graphql';


const FavoriteDriverType = new ObjectType({
    name: 'FavoriteDriverType',   
    fields: {
        id: {
            type: IntType
        },
        userId: {
            type: StringType
        },
        driverId: {
            type: StringType
        },
        driverName: { 
            type: StringType
        }      
    }
});

export default FavoriteDriverType;
import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen,
    GraphQLFloat as FloatType,
} from 'graphql';


const VehicleStatusType = new ObjectType({
    name: 'VehicleStatusType',
    fields: {
        id: {
            type: IntType
        },
        vehicle_id: {
            type: StringType
        },
        running_distance: {
            type: FloatType
        },
        running_hours: {
            type: FloatType
        },
        breaks: {
            type: FloatType
        },
        fuel: {
            type: FloatType
        },
        battery: {
            type: StringType
        },
    }
});

export default VehicleStatusType;
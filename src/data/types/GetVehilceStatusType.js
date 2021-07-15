import {
    GraphQLObjectType as ObjectType,
    GraphQLID as ID,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLNonNull as NonNull,
    GraphQLBoolean as BooleanTypen,
    GraphQLFloat as FloatType,
} from 'graphql';
import VehicleStatusType from './VehicleStatusType';

const GetVehilceStatusType = new ObjectType({
    name: 'GetVehilceStatusType',
    fields: {
        result: {
            type: VehicleStatusType
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default GetVehilceStatusType;

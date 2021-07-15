import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import DonationType from './DonationType';

const DonationData = new ObjectType({
    name: 'Donations',
    fields: {
        results: {
            type: new List(DonationType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default DonationData;

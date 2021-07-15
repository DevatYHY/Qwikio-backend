import {
    GraphQLObjectType as ObjectType,
    GraphQLString as StringType,
    GraphQLInt as IntType,
    GraphQLList as List,
} from 'graphql';

import UserAccountType from './userAccountType';

const WholeAccountListType = new ObjectType({
    name: 'Users',
    fields: {
        result: {
            type: new List(UserAccountType)
        },
        status: {
            type: IntType
        },
        errorMessage: {
            type: StringType
        }
    },
});

export default WholeAccountListType;

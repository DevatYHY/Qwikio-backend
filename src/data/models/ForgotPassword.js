import DataType from 'sequelize';
import Model from '../sequelize';

const ForgotPassword = Model.define('ForgotPassword', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  userId: {
    type: DataType.STRING,
    allowNull: true,
  },

  email: {
    type: DataType.STRING,
    allowNull: true,
  },

  token: {
    type: DataType.STRING,
    allowNull: true,
  },
});

export default ForgotPassword;
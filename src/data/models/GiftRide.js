import DataType from 'sequelize';
import Model from '../sequelize';

const GiftRide = Model.define('GiftRide', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  sender_id: {
    type: DataType.STRING,
    allowNull: true,
  },

  receiver_id: {
    type: DataType.STRING,
    allowNull: true,
  },

  status: {
    type: DataType.INTEGER,
    allowNull: true,
  },
});

export default GiftRide;
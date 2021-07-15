import DataType from 'sequelize';
import Model from '../sequelize';

const Rent = Model.define('Rent', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  type: {
    type: DataType.STRING,
    allowNull: true,
  },

  name: {
    type: DataType.STRING,
    allowNull: true,
  },

  price: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  speed: {
    type: DataType.FLOAT,
    allowNull: true,
  },
});

export default Rent;
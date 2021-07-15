import DataType from 'sequelize';
import Model from '../sequelize';

const Place = Model.define('Place', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  name: {
    type: DataType.STRING,
    allowNull: true,
  },

  price: {
    type: DataType.FLOAT,
    allowNull: true,
  }, 
});

export default Place;
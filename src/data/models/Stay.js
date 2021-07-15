import DataType from 'sequelize';
import Model from '../sequelize';

const Stay = Model.define('Stay', {

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

  description: {
    type: DataType.STRING,
    allowNull: true,
  },

  capacity: {
    type: DataType.INTEGER,
    allowNull: true,  
  },
});

export default Stay;
import DataType from 'sequelize';
import Model from '../sequelize';

const Fly = Model.define('Fly', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  depature_from: {
    type: DataType.STRING,
    allowNull: true,
  },

  arrival_at: {
    type: DataType.STRING,
    allowNull: true,
  },

  depature_date: {
    type: DataType.DATE,
    allowNull: true,
  },

  passengers: {
    type: DataType.STRING,
    allowNull: true,
  },

  class: {
    type: DataType.INTEGER,
    allowNull: true,  
  },
});

export default Fly;
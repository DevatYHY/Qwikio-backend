import DataType from 'sequelize';
import Model from '../sequelize';

const VehicleStatus = Model.define('VehicleStatus', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  vehicle_id: {
    type: DataType.STRING,
    allowNull: true,
  },

  running_distance: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  running_hours: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  breaks: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  fuel: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  battery: {
    type: DataType.STRING,
    allowNull: true,
  },

});

export default VehicleStatus;
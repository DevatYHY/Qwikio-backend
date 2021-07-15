import DataType from 'sequelize';
import Model from '../sequelize';

const Event = Model.define('Event', {

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

  date: {
    type: DataType.DATE,
    allowNull: true,
  },

  code: {
    type: DataType.STRING,
    allowNull: true,
  },
});

export default Event;
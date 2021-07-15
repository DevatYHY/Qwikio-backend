import DataType from 'sequelize';
import Model from '../sequelize';

const Staffpool = Model.define('Staffpool', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  company: {
    type: DataType.STRING,
    allowNull: true,
  },

  code: {
    type: DataType.STRING,
    allowNull: true,
  },

  status: {
    type: DataType.INTEGER,
    allowNull: true,  
  },
});

export default Staffpool;
import DataType from 'sequelize';
import Model from '../sequelize';

const Donation = Model.define('Donation', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  donator: {
    type: DataType.STRING,
    allowNull: true,
  },

  amount: {
    type: DataType.FLOAT,
    allowNull: true,
  },

  used: {
    type: DataType.INTEGER,
    allowNull: true,  
  },
});

export default Donation;
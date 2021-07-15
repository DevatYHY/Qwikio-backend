import DataType from 'sequelize';
import Model from '../sequelize';

const FavoriteDriver = Model.define('FavoriteDriver', {

  id: {
    type: DataType.INTEGER,
    allowNull: false,
    primaryKey: true,
    autoIncrement: true
  },

  userId: {
    type: DataType.STRING,
    allowNull: false,
  },

  driverId: {
    type: DataType.STRING,
    allowNull: false,
  },
});

export default FavoriteDriver;
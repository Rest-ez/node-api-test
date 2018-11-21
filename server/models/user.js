module.exports = (sequelize, DataTypes) => {
  const User = sequelize.define('User', {
    fullname: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    ssn: {
        type: DataTypes.STRING,
        allowNull: false,
      }
  });

  User.associate = (models) => {
    User.hasMany(models.ccnum, {
      foreignKey: 'userId',
      as: 'ccnum',
    });
  };

  return User;
};
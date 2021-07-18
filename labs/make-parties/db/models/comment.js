'use strict';
module.exports = (sequelize, DataTypes) => {
  const Comment = sequelize.define('Comment', {
    body: DataTypes.STRING
  }, {});

  Comment.associate = function(models) {
    Comment.belongsTo(models.Event); // EventId
  };
  return Comment;
};

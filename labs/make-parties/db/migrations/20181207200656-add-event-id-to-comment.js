'use strict';

module.exports = {
  up: (queryInterface, Sequelize) => {
    return queryInterface.addColumn('Comments', 'EventId', Sequelize.INTEGER).then(() => {
      return queryInterface.addConstraint('Comments', ['EventId'], {
        type: 'foreign key',
        name: 'event_comments',
        references: { //Required field
          table: 'Events',
          field: 'id'
        },
        onDelete: 'CASCADE',
        onUpdate: 'CASCADE'
      });
    });
  },

  down: (queryInterface, Sequelize) => {
    return queryInterface.removeColumn('Comments', 'EventId');
  }
};

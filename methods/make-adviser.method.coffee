'use strict'

Meteor.methods
  makeAdviser: () ->
    if Meteor.isServer
      Roles.addUsersToRoles Meteor.userId(), ['adviser']
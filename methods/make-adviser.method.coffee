'use strict'

Meteor.methods
  makeAdviser: () ->
    if Meteor.isServer
      if Meteor.user()
        if not Meteor.user().roles or (Meteor.user().roles.indexOf('adviser') is -1 or Meteor.user().roles.indexOf('admin') is -1)
          Roles.addUsersToRoles Meteor.userId(), ['adviser']
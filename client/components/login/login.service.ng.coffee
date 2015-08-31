'use strict'

angular.module 'semlepApp'
.factory 'login', ['$location', '$rootScope', ($location, $rootScope) ->
  showLogin = undefined
  inviteId = undefined
  showLogin: showLogin
  inviteId: inviteId
  doLogout: ->
    Meteor.logout ->
      $location.path '/'
  isAdmin: ->
    $rootScope.currentUser and $rootScope.currentUser.roles.indexOf('admin') isnt -1
  isAdviser: ->
    $rootScope.currentUser and $rootScope.currentUser.roles.indexOf('adviser') isnt -1
]
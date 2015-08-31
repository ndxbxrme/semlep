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
  linkWithGithub: ->
    Meteor.linkWithGithub {}
  linkWithTwitter: ->
    Meteor.linkWithTwitter {}
  linkWithFacebook: ->
    Meteor.linkWithFacebook {}
  linkWithGoogle: ->
    Meteor.linkWithGoogle {}
  isAdmin: ->
    $rootScope.currentUser and $rootScope.currentUser.roles and $rootScope.currentUser.roles.indexOf('admin') isnt -1
  isAdviser: ->
    $rootScope.currentUser and $rootScope.currentUser.roles and $rootScope.currentUser.roles.indexOf('adviser') isnt -1

]
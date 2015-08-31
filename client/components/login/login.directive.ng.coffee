'use strict'

angular.module 'semlepApp'
.directive 'login', ['login', '$meteor', '$location', (login, $meteor, $location) ->
  restrict: 'EA'
  templateUrl: 'client/components/login/login.view.html'
  replace: true
  link: (scope, elem, attrs) ->
    scope.login = login
    scope.doRegister = ->
      Accounts.createUser scope.loginUser, (err, createdUser) ->
        if err
          scope.loginError = err.reason
        else
          Meteor.call 'makeAdviser'
          login.showLogin = undefined
          $location.path '/dashboard'
        return
    scope.doLogin = ->
      Meteor.loginWithPassword scope.loginUser.email, scope.loginUser.password, (err) ->
        if err
          scope.loginError = err.reason
        else
          login.showLogin = undefined
          $location.path '/dashboard'
        return
    scope.loginWithGithub = ->
      Meteor.loginWithGithub {}, (err) ->
        if not err
          Meteor.call 'makeAdviser'
          login.showLogin = undefined
          $location.path '/dashboard'
        return
    scope.loginWithTwitter = ->
      Meteor.loginWithTwitter {}, (err) ->
        if not err
          Meteor.call 'makeAdviser'
          login.showLogin = undefined
          $location.path '/dashboard'
        return
    scope.loginWithFacebook = ->
      Meteor.loginWithFacebook {}, (err) ->
        if not err
          Meteor.call 'makeAdviser'
          login.showLogin = undefined
          $location.path '/dashboard'
        return
    scope.loginWithGoogle = ->
      Meteor.loginWithGoogle {}, (err) ->
        if not err
          Meteor.call 'makeAdviser'
          login.showLogin = undefined
          $location.path '/dashboard'
        return
]
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
          $location.path '/profiles/new'
        return
    scope.doLogin = ->
      Meteor.loginWithPassword scope.loginUser.email, scope.loginUser.password, (err) ->
        if err
          scope.loginError = err.reason
        else
          login.showLogin = undefined
          $location.path '/dashboard'
        return
        
]
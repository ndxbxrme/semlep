'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'users-list',
    url: '/users'
    templateUrl: 'client/users/users-list.view.html'
    controller: 'UsersListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'user-detail',
    url: '/users/:userId'
    templateUrl: 'client/users/user-detail.view.html'
    controller: 'UserDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
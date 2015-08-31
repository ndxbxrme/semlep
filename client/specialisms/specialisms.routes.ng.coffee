'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'specialisms-list',
    url: '/specialisms'
    templateUrl: 'client/specialisms/specialisms-list.view.html'
    controller: 'SpecialismsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'specialism-detail',
    url: '/specialisms/:specialismId'
    templateUrl: 'client/specialisms/specialism-detail.view.html'
    controller: 'SpecialismDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
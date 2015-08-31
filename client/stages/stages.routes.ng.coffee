'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'stages-list',
    url: '/stages'
    templateUrl: 'client/stages/stages-list.view.html'
    controller: 'StagesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'stage-detail',
    url: '/stages/:stageId'
    templateUrl: 'client/stages/stage-detail.view.html'
    controller: 'StageDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'businessStats-list',
    url: '/business-stats'
    templateUrl: 'client/business-stats/business-stats-list.view.html'
    controller: 'BusinessStatsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'businessStat-detail',
    url: '/business-stats/:businessStatId'
    templateUrl: 'client/business-stats/business-stat-detail.view.html'
    controller: 'BusinessStatDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
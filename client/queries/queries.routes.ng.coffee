'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'queries-list',
    url: '/queries'
    templateUrl: 'client/queries/queries-list.view.html'
    controller: 'QueriesListCtrl'
  .state 'query-detail',
    url: '/queries/:queryId'
    templateUrl: 'client/queries/query-detail.view.html'
    controller: 'QueryDetailCtrl'
]
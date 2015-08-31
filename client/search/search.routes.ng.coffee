'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'search',
    url: '/search'
    templateUrl: 'client/search/search.view.html'
    controller: 'SearchCtrl'
  .state 'search-adviser',
    url: '/search/:specialismSlug/:faqSlug/:adviserId'
    templateUrl: 'client/search/search.view.html'
    controller: 'SearchCtrl'
  .state 'search-results',
    url: '/search/:queryId'
    templateUrl: 'client/search/search-results.view.html'
    controller: 'SearchResultsCtrl'
]
'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'query-sent',
    url: '/query-sent'
    templateUrl: 'client/query-sent/query-sent.view.html'
    controller: 'QuerySentCtrl'
]
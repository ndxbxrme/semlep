'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'terms',
    url: '/terms'
    templateUrl: 'client/terms/terms.view.html'
    controller: 'TermsCtrl'
]
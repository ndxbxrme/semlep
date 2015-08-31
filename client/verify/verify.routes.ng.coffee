'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'verify',
    url: '/verify'
    templateUrl: 'client/verify/verify.view.html'
    controller: 'VerifyCtrl'
]
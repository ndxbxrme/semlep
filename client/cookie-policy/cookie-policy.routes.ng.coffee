'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'cookiePolicy',
    url: '/cookie-policy'
    templateUrl: 'client/cookie-policy/cookie-policy.view.html'
    controller: 'CookiePolicyCtrl'
]
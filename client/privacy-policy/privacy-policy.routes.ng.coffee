'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'privacyPolicy',
    url: '/privacy-policy'
    templateUrl: 'client/privacy-policy/privacy-policy.view.html'
    controller: 'PrivacyPolicyCtrl'
]
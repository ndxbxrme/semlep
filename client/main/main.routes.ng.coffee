'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'main',
    url: '/'
    templateUrl: 'client/main/main.view.html'
    controller: 'MainCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
]
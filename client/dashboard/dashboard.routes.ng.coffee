'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'dashboard',
    url: '/dashboard'
    templateUrl: 'client/dashboard/dashboard.view.html'
    controller: 'DashboardCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]
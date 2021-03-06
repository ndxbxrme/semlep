'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'settings',
    url: '/settings'
    templateUrl: 'client/settings/settings.view.html'
    controller: 'SettingsCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]
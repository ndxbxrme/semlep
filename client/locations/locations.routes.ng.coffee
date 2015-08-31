'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'locations-list',
    url: '/locations'
    templateUrl: 'client/locations/locations-list.view.html'
    controller: 'LocationsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
  .state 'location-detail',
    url: '/locations/:locationId'
    templateUrl: 'client/locations/location-detail.view.html'
    controller: 'LocationDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireUser()
      ]
]
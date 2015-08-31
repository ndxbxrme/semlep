'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'sectors-list',
    url: '/sectors'
    templateUrl: 'client/sectors/sectors-list.view.html'
    controller: 'SectorsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'sector-detail',
    url: '/sectors/:sectorId'
    templateUrl: 'client/sectors/sector-detail.view.html'
    controller: 'SectorDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
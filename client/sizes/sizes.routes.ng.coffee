'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'sizes-list',
    url: '/sizes'
    templateUrl: 'client/sizes/sizes-list.view.html'
    controller: 'SizesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
  .state 'size-detail',
    url: '/sizes/:sizeId'
    templateUrl: 'client/sizes/size-detail.view.html'
    controller: 'SizeDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.requireValidUser (user) ->
          user.roles.indexOf('admin') isnt -1
      ]
]
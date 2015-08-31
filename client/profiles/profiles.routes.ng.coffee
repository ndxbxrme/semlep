'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'profiles-list',
    url: '/profiles'
    templateUrl: 'client/profiles/profiles-list.view.html'
    controller: 'ProfilesListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
  .state 'profile-detail',
    url: '/profiles/:profileSlug/:specialismSlug/:faqSlug'
    templateUrl: 'client/profiles/profile-detail.view.html'
    controller: 'ProfileDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
  .state 'profile-searched',
    url: '/profiles-searched/:profileSlug/:queryId'
    templateUrl: 'client/profiles/profile-detail.view.html'
    controller: 'ProfileDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
  .state 'profile-user',
    url: '/profile'
    templateUrl: 'client/profiles/profile-detail.view.html'
    controller: 'ProfileDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
]
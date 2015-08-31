'use strict'

angular.module 'semlepApp'

.config ['$urlRouterProvider', '$locationProvider', ($urlRouterProvider, $locationProvider) ->
  $locationProvider.html5Mode true
  $urlRouterProvider.otherwise '/'
]
.run ['$rootScope', '$state', 'login', ($rootScope, $state, login) ->
  $rootScope.login = login
  $rootScope.$on '$stateChangeError', (event, toState, toParams, fromState, fromParams, error) ->
    switch error
      when 'AUTH_REQUIRED', 'FORBIDDEN', 'UNAUTHORIZED'
        $state.go 'main'
]
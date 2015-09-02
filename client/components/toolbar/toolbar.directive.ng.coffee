'use strict'

angular.module 'semlepApp'
.directive 'toolbar', ['login', (login) ->
  {
    restrict: 'AE'
    templateUrl: 'client/components/toolbar/toolbar.view.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.login = login
      scope.clearSearch = ->
        scope.profileSearch = undefined
        $('.is-dirty', elem[0]).removeClass 'is-dirty'
        return
  }
]
'use strict'

angular.module 'semlepApp'
.directive 'dashboardAdviser', ['$meteor', ($meteor) ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/dashboardAdviser/dashboard-adviser.view.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.queries = scope.$meteorCollection Queries
      scope.$meteorSubscribe 'queries', null, null, scope.currentUser._id
  }
]
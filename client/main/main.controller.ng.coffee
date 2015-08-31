'use strict'

angular.module 'semlepApp'
.controller 'MainCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.$meteorSubscribe 'businessStats'
  .then ->
    $scope.businessStats = $scope.$meteorCollection BusinessStats
]
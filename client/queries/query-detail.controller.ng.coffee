'use strict'

angular.module 'semlepApp'
.controller 'QueryDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.query = $scope.$meteorObject Queries, $stateParams.queryId
  $scope.$meteorSubscribe 'queries'
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.query.save()
        
  $scope.reset = () ->
    $scope.query.reset()
]
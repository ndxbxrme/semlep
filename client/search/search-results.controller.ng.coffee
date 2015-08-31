'use strict'

angular.module 'semlepApp'
.controller 'SearchResultsCtrl', ['$scope', '$meteor', '$stateParams', ($scope, $meteor, $stateParams) ->
  $scope.$meteorSubscribe 'queries'
  .then ->
    $scope.query = Queries.findOne
      _id: $stateParams.queryId
    $scope.profiles = $scope.$meteorCollection Profiles
    $scope.$meteorSubscribe 'profiles', null, null, null, $scope.query
]
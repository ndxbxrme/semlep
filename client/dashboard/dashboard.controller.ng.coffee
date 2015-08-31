'use strict'

angular.module 'semlepApp'
.controller 'DashboardCtrl', ['$scope', '$location', ($scope, $location) ->
  $scope.$meteorSubscribe 'profiles'
  .then ->
    $scope.profile = Profiles.findOne
      userId: $scope.currentUser._id
    if not $scope.profile and $scope.currentUser.roles.indexOf('admin') is -1
      $location.path 'profiles/new'
  $scope.viewName = 'Dashboard'
]
'use strict'

angular.module 'semlepApp'
.controller 'UserDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.user = $scope.$meteorObject Meteor.users, $stateParams.userId, false
  $scope.$meteorSubscribe 'allusers'
  $scope.$meteorSubscribe 'profiles'
  .then ->
    $scope.profile = Profiles.findOne
      userId: $stateParams.userId
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.user.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.user.reset()
]
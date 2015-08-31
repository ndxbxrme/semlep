'use strict'

angular.module 'semlepApp'
.controller 'UsersListCtrl', ['$scope', '$meteor', ($scope, $meteor) ->
  $scope.page = 1
  $scope.perPage = 30
  $scope.sort = name_sort : 1
  $scope.orderProperty = '1'
  
  $scope.users = $scope.$meteorCollection () ->
    Meteor.users.find {}, {sort:$scope.getReactively('sort')}
  $meteor.autorun $scope, () ->
    $scope.$meteorSubscribe('allusers', {
      limit: parseInt($scope.getReactively('perPage'))
      skip: parseInt(($scope.getReactively('page') - 1) * $scope.getReactively('perPage'))
      sort: $scope.getReactively('sort')
    }, $scope.getReactively('search')).then () ->
      $scope.usersCount = $scope.$meteorObject Counts, 'numberOfAllUsers', false

  $meteor.session 'usersCounter'
  .bind $scope, 'page'
    
  $scope.save = () ->
    if $scope.form.$valid
      $scope.users.save $scope.newUser
      $scope.newUser = undefined
      
  $scope.remove = (user) ->
    $scope.users.remove user
    
  $scope.pageChanged = (newPage) ->
    $scope.page = newPage
    
  $scope.$watch 'orderProperty', () ->
    if $scope.orderProperty
      $scope.sort = name_sort: parseInt($scope.orderProperty)
      
  $scope.$meteorSubscribe 'profiles'
  $scope.getProfile = (user) ->
    Profiles.findOne
      userId: user._id
]
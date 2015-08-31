'use strict'

angular.module 'semlepApp'
.controller 'ProfileDetailCtrl', ['$scope', '$stateParams', '$meteor', '$location', ($scope, $stateParams, $meteor, $location) ->
  $scope.profile = if $stateParams.profileSlug isnt 'new' then $scope.$meteorObject(Profiles, {slug:$stateParams.profileSlug}, false) else {}
  if not $stateParams.profileSlug
    $scope.profile = $scope.$meteorObject Profiles, {userId:$scope.currentUser._id}, false
  $scope.$meteorSubscribe('profiles')
  $scope.locations = $scope.$meteorCollection Locations
  $scope.$meteorSubscribe 'locations'
  $scope.specialisms = $scope.$meteorCollection Specialisms
  $scope.$meteorSubscribe 'specialisms'
  $scope.sectors = $scope.$meteorCollection Sectors
  $scope.$meteorSubscribe 'sectors'
  $scope.stages = $scope.$meteorCollection Stages
  $scope.$meteorSubscribe 'stages'
  $scope.sizes = $scope.$meteorCollection Sizes
  $scope.$meteorSubscribe 'sizes'
  
  $scope.faqSlug = $stateParams.faqSlug
  $scope.specialismSlug = $stateParams.specialismSlug
  $scope.queryId = $stateParams.queryId
  if $scope.queryId
    $scope.query = $scope.$meteorObject Queries, $stateParams.queryId, false
    $scope.$meteorSubscribe 'queries'
    
  $scope.submitQuery = ->
    $scope.query.adviserId = $scope.profile._id
    $scope.query.save()
    .then ->
      $location.path '/'
  
  $scope.isOwner = ->
    $scope.profile.userId is $scope.currentUser?._id
  
  $scope.save = () ->
    $scope.submitted = true
    if $scope.form.$valid
      if $stateParams.profileSlug is 'new'
        Profiles.insert $scope.profile
        toastr.success 'Profile created', 'Profile'
      else
        $scope.profile.save()
        toastr.success 'Profile updated', 'Profile'
      $location.path '/dashboard'
        
  $scope.reset = () ->
    $scope.profile.reset()
]
'use strict'

angular.module 'semlepApp'
.controller 'SearchCtrl', ['$scope', '$location', '$timeout', '$stateParams', ($scope, $location, $timeout, $stateParams) ->
  $scope.locations = $scope.$meteorCollection Locations
  $scope.$meteorSubscribe 'locations'
  $scope.specialisms = $scope.$meteorCollection Specialisms
  
  $scope.sectors = $scope.$meteorCollection Sectors
  $scope.$meteorSubscribe 'sectors'
  $scope.stages = $scope.$meteorCollection Stages
  $scope.$meteorSubscribe 'stages'
  $scope.sizes = $scope.$meteorCollection Sizes
  $scope.$meteorSubscribe 'sizes'
  
  $scope.$meteorSubscribe 'specialisms'
  .then ->
    if $stateParams.specialismSlug
      specialism = Specialisms.findOne
        slug: $stateParams.specialismSlug
      $scope.query =
        specialisms: [specialism._id]
        adviserId: $stateParams.adviserId
  
  $scope.doQuery = ->
    $scope.submitted = true
    if $scope.form.$valid
      Queries.insert $scope.query, (err, queryId) ->
        console.log 'inserted', err, queryId
        $timeout ->
          if $stateParams.adviserId
            $location.path '/'
          else
            $location.path '/search/' + queryId
]
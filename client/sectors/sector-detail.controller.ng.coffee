'use strict'

angular.module 'semlepApp'
.controller 'SectorDetailCtrl', ['$scope', '$stateParams', '$meteor', ($scope, $stateParams, $meteor) ->
  $scope.sector = $scope.$meteorObject Sectors, $stateParams.sectorId
  $scope.$meteorSubscribe('sectors')
  
  $scope.save = () ->
    if $scope.form.$valid
      $scope.sector.save().then(
        (numberOfDocs) ->
          console.log 'save successful, docs affected ', numberOfDocs
        (error) ->
          console.log 'save error ', error
      )
        
  $scope.reset = () ->
    $scope.sector.reset()
]
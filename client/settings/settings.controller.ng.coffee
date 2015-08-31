'use strict'

angular.module 'semlepApp'
.controller 'SettingsCtrl', ['$scope', ($scope) ->
  $scope.$meteorSubscribe 'allusers'
]
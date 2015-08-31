'use strict'

angular.module 'semlepApp'
.controller 'ContactDetailCtrl', ['$scope', '$stateParams', '$meteor', '$state', ($scope, $stateParams, $meteor, $state) ->
  $scope.contact = if $stateParams.contactId isnt 'new' then $scope.$meteorObject Contacts, $stateParams.contactId else {}
  $scope.$meteorSubscribe('contacts')
  $scope.save = () ->
    if $scope.form.$valid
      $scope.submitted = true
      if $stateParams.contactId is 'new'
        Contacts.insert $scope.contact
      else
        $scope.contact.save()
      toastr.success 'Watch your emails', 'Contact submitted'
      $state.go 'main'
        
  $scope.reset = () ->
    $scope.contact.reset()
]
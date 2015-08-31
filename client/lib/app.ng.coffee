angular.module 'semlepApp', [
  'angular-meteor'
  'ui.router'
  'ui.bootstrap'
  'angularUtils.directives.dirPagination'
  'multi-check'
]

onReady = () ->
  angular.bootstrap document, ['semlepApp']
  
if Meteor.isCordova
  angular.element(document).on 'deviceready', onReady
else
  angular.element(document).ready onReady
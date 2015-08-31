'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'contacts-list',
    url: '/contacts'
    templateUrl: 'client/contacts/contacts-list.view.html'
    controller: 'ContactsListCtrl'
  .state 'contact-detail',
    url: '/contacts/:contactId'
    templateUrl: 'client/contacts/contact-detail.view.html'
    controller: 'ContactDetailCtrl'
]
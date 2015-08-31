'use strict'

angular.module 'semlepApp'
.config ['$stateProvider', ($stateProvider) ->
  $stateProvider
  .state 'faqs-index',
    url: '/faqs'
    templateUrl: 'client/faqs/faqs-list.view.html'
    controller: 'FaqsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
  .state 'faqs-list',
    url: '/faqs/:specialismSlug'
    templateUrl: 'client/faqs/faqs-list.view.html'
    controller: 'FaqsListCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
  .state 'faq-detail',
    url: '/faqs/:specialismSlug/:faqSlug'
    templateUrl: 'client/faqs/faq-detail.view.html'
    controller: 'FaqDetailCtrl'
    resolve:
      currentUser: ['$meteor', ($meteor) ->
        $meteor.waitForUser()
      ]
]
'use strict'

angular.module 'semlepApp'
.directive 'dashboardAdmin', [() ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/dashboardAdmin/dashboard-admin.view.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.$meteorSubscribe 'locations'
      .then ->
        scope.locationsCount = scope.$meteorObject Counts, 'numberOfLocations', false
      scope.$meteorSubscribe 'specialisms'
      .then ->
        scope.specialismsCount = scope.$meteorObject Counts, 'numberOfSpecialisms', false
      scope.$meteorSubscribe 'sectors'
      .then ->
        scope.sectorsCount = scope.$meteorObject Counts, 'numberOfSectors', false
      scope.$meteorSubscribe 'stages'
      .then ->
        scope.stagesCount = scope.$meteorObject Counts, 'numberOfStages', false
      scope.$meteorSubscribe 'sizes'
      .then ->
        scope.sizesCount = scope.$meteorObject Counts, 'numberOfSizes', false
      scope.$meteorSubscribe 'faqs'
      .then ->
        scope.faqsCount = scope.$meteorObject Counts, 'numberOfFaqs', false
      scope.$meteorSubscribe 'profiles'
      .then ->
        scope.profilesCount = scope.$meteorObject Counts, 'numberOfProfiles', false
      scope.$meteorSubscribe 'allusers'
      .then ->
        scope.usersCount = scope.$meteorObject Counts, 'numberOfAllUsers', false
      scope.$meteorSubscribe 'businessStats'
      .then ->
        scope.businessStatsCount = scope.$meteorObject Counts, 'numberOfBusinessStats', false
      scope.$meteorSubscribe 'contacts'
      .then ->
        scope.contacts = scope.$meteorCollection Contacts
  }
]
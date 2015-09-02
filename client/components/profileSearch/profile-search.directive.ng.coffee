'use strict'

angular.module 'semlepApp'
.directive 'profileSearch', ['$meteor', ($meteor) ->
  {
    restrict: 'EA'
    templateUrl: 'client/components/profileSearch/profile-search.view.html'
    replace: true
    link: (scope, elem, attrs) ->
      scope.searchResults = scope.$meteorCollection ->
        Profiles.find {
          'name':
            '$regex': '.*' + scope.getReactively('profileSearch') + '.*'
            '$options': 'i'
        }, {sort:{name:1}}
      .subscribe 'profiles', {}, scope.getReactively('profileSearch')
  }
]
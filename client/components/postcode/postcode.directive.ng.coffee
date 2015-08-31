'use strict'

angular.module 'semlepApp'
.directive 'postcode', [() ->
  {
    restrict: 'EA'
    require: 'ngModel'
    link: (scope, elem, attrs, ngModel) ->
      ngModel.$parsers.unshift (val) ->
        if val
          m = val.match(/^(([gG][iI][rR] {0,}0[aA]{2})|((([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y]?[0-9][0-9]?)|(([a-pr-uwyzA-PR-UWYZ][0-9][a-hjkstuwA-HJKSTUW])|([a-pr-uwyzA-PR-UWYZ][a-hk-yA-HK-Y][0-9][abehmnprv-yABEHMNPRV-Y]))) {0,}[0-9][abd-hjlnp-uw-zABD-HJLNP-UW-Z]{2}))$/gi)
          ngModel.$setValidity 'postcode', m?.length > 0
        val
  }
]
'use strict'

Meteor.publish 'locations', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfLocations', Locations.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Locations.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
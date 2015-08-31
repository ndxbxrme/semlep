'use strict'

Meteor.publish 'sectors', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfSectors', Sectors.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Sectors.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
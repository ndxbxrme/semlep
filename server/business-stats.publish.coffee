'use strict'

Meteor.publish 'businessStats', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfBusinessStats', BusinessStats.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  BusinessStats.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
'use strict'

Meteor.publish 'sizes', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfSizes', Sizes.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Sizes.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
'use strict'

Meteor.publish 'stages', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfStages', Stages.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Stages.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
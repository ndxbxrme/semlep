'use strict'

Meteor.publish 'specialisms', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfSpecialisms', Specialisms.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Specialisms.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, {sort:{name:1}}
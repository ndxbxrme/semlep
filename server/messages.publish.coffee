'use strict'

Meteor.publish 'messages', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfMessages', Messages.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Messages.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
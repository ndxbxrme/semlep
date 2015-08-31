'use strict'

Meteor.publish 'contacts', (options, searchString) ->
  if !searchString
    searchString = ''
  Counts.publish this, 'numberOfContacts', Contacts.find(
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  ), noReady: true
  Contacts.find {
    'name':
      '$regex': '.*' + searchString or '' + '.*'
      '$options': 'i'
  }, options
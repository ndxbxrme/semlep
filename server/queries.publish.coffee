'use strict'

Meteor.publish 'queries', (options, searchString, adviserId) ->
  console.log adviserId
  where =
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  if adviserId then where.adviserId = adviserId
  Counts.publish this, 'numberOfQueries', Queries.find(where), noReady: true
  if options
    Queries.find where, options
  else
    Queries.find where
'use strict'

Meteor.publish 'profiles', (options, searchString, faqId, query) ->
  where = 
    'name':
      '$regex': '.*' + (searchString or '') + '.*'
      '$options': 'i'
  if faqId then where.faqIds = faqId
  if query
    if query.specialisms.length then where.specialisms =
      '$in': query.specialisms
    if query.stages.length then where.stages =
      '$in': query.stages
    if query.sectors.length then where.sectors =
      '$in': query.sectors
    if query.sizes.length then where.sizes =
      '$in': query.sizes
  Counts.publish this, 'numberOfProfiles', Profiles.find(where), noReady: true
  if options
    Profiles.find where, options
  else
    Profiles.find where
@Profiles = new Mongo.Collection('profiles')
Profiles.ndxModified()
Profiles.friendlySlugs()

Profiles.allow
  insert: (userId, profile) ->
    console.log 'inserting', userId, profile
    if not profile.userId
      profile.userId = userId
    true
  update: (userId, profile, fields, modifier) ->
    profile.userId is userId or Meteor.user().roles.indexOf('admin') isnt -1
  remove: (userId, profile) ->
    profile.userId is userId or Meteor.user().roles.indexOf('admin') isnt -1

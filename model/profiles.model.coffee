@Profiles = new Mongo.Collection('profiles')
Profiles.ndxModified()
Profiles.friendlySlugs()

Profiles.allow
  insert: (userId, profile) ->
    if not profile.userId
      profile.userId = userId
    true
  update: (userId, profile, fields, modifier) ->
    profile.userId is userId
  remove: (userId, profile) ->
    profile.userId is userId

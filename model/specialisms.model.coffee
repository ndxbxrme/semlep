@Specialisms = new Mongo.Collection('specialisms')
Specialisms.friendlySlugs()
Specialisms.ndxModified()
Specialisms.allow
  insert: (userId, specialism) ->
    userId
  update: (userId, specialism, fields, modifier) ->
    userId
  remove: (userId, specialism) ->
    userId

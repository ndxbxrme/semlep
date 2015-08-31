@Contacts = new Mongo.Collection('contacts')
Contacts.ndxModified()
Contacts.allow
  insert: (userId, contact) ->
    true
  update: (userId, contact, fields, modifier) ->
    true
  remove: (userId, contact) ->
    true

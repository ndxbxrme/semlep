@Queries = new Mongo.Collection('queries')
Queries.ndxModified()

Queries.allow
  insert: (userId, query) ->
    true
  update: (userId, query, fields, modifier) ->
    true
  remove: (userId, query) ->
    true

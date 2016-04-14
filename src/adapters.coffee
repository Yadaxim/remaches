#ADAPTERS

shout = (obj,keypath) ->
  console.log " ---- ERROR: The value \"#{ keypath }\" of the following object is not defined OR \"#{ keypath }\" has not been called/bound by rivets ---- "
  console.log obj

  throw "TypeError: Cannot read property '_rv' of undefined"

rivets.adapters['.'].get = (obj,keypath) ->
  shout(obj,keypath) if typeof obj[keypath] is 'undefined'
  return obj[keypath]

# one way adapter
rivets.adapters[':'] =
  observe: (obj,keypath,callback)->
    rivets.adapters['.'].observe(obj, keypath, callback)

  unobserve: (obj,keypath,callback)->
    rivets.adapters['.'].unobserve(obj, keypath, callback)
  
  get: (obj,keypath,callback)->
    rivets.adapters['.'].get(obj, keypath, callback)

  set: (obj,keypath,callback)->  # empty

rivets.adapters['=']  =
  observe:   (obj,keypath,callback) ->
  unobserve: (obj,keypath,callback) ->
  get:       (obj,keypath) ->
    shout(obj,keypath) if typeof obj is 'undefined'
    return obj is keypath

  set: (obj,keypath,callback)->  # empty


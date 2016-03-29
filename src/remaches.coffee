rivets.configure
  templateDelimiters: ["{{", "}}"]

#LOGICAL

rivets.formatters.not = (value)->
  not value

rivets.formatters.or = (value, arg)-> 
  value or arg

rivets.formatters.and = (value, arg)-> 
  value and arg

rivet.fomrmatters.eq = 
  rivets.formatters.is = (value, arg)-> 
    value is arg

rivets.formatters.neq = 
  rivets.formatters.isnt = (value, arg)-> 
    value isnt arg  

rivets.formatters.gt = (value, arg)-> value > arg

rivets.formatters.lt = (value, arg)-> value < arg

rivets.formatters['?'] = 
  rivets.formatters.ternary = (cond, exp1, exp2)->if cond then exp1 else exp2

# Collections
rivets.formatters.length = (c) -> c.length

#Array

rivets.formatters.first = (array)-> array.first()

rivets.formatters.index = (array, index) -> array[index]
rivets.formatters.key   = (obj, index) ->   obj[index]


rivets.formatters.pluck = (array, key)-> array.map( (x)-> x[key] )

rivets.formatters.oneOf = (value, args...) -> value in args

rivets.formatters.in = (value, arg) -> value in arg

rivets.formatters.join = (array , separator)->
  array.join( separator || "\n")

#String
rivets.formatters.charAt = (string,index)-> string.charAt(index)

rivets.formatters.endsWith = (string,sub)-> string.endsWith(sub)

rivets.formatters.startsWith = (string,sub)-> string.startsWith(sub)

rivets.formatters.includes = (string, args...) -> args.some (e)-> string.includes(e)

rivets.formatters.capitalise = (string) -> string.capitalise()

rivets.formatters.upcase = (string) -> string.toUpperCase()

rivets.formatters.lowcase = (string) -> string.toLowerCase()

rivets.formatters.trim = (string) -> string.trim()

rivets.formatters.dic = (id, dic, attr) ->
  if (x = eval('session.' + dic).findFirstByFn(id, ((x) -> x['id']) ))
    x[attr]
  else
    ""

# Numerical (+ can still be used to append strings and so)

rivets.formatters['+'] = (value, args)->value + args
rivets.formatters['-'] = (value, args)->value - args
rivets.formatters['*'] = (value, args)->value * args
rivets.formatters['/'] = (value, args)->value / args

shout = (obj,keypath) ->
  console.log " ---- ERROR: The value \"#{ keypath }\" of the following object is not defined OR \"#{ keypath }\" has not been called/bound by rivets ---- "
  console.log obj

  throw "TypeError: Cannot read property '_rv' of undefined"


# one way adapter
rivets.adapters[':'] =
  observe: (obj,keypath,callback)->
    shout(obj,keypath) if typeof obj[keypath] is 'undefined'
    rivets.adapters['.'].observe(obj, keypath, callback)

  unobserve: (obj,keypath,callback)->
    rivets.adapters['.'].unobserve(obj, keypath, callback)


  get: (obj,keypath,callback)->
    rivets.adapters['.'].get(obj, keypath, callback)

  set: (obj,keypath,callback)->  # empty


rivets.binders['text-color'] = (el,value) ->
  $(el).css "color": value
# formatters

rivets.formatters.not = (value)-> not value

rivets.formatters.or = (value, arg)->  value or arg

rivets.formatters.and = (value, arg)-> value and arg

rivets.formatters.eq = 
  rivets.formatters.is = (value, arg)-> 
    value is arg

rivets.formatters.neq = 
  rivets.formatters.isnt = (value, arg)-> 
    value isnt arg  

rivets.formatters.gt = (value, arg)-> value > arg

rivets.formatters.lt = (value, arg)-> value < arg

rivets.formatters['?'] = 
  rivets.formatters.ternary = (cond, exp1, exp2)->
    if cond then exp1 else exp2

# Collections
rivets.formatters.length = (c) -> c.length

# Obj

rivets.formatters.keys   = (obj) -> k for k,v of obj

rivets.formatters.values = (obj) -> v for k,v of obj

rivets.formatters.get =
  rivets.formatters.key =  (obj, key) -> obj[key]

#Array

rivets.formatters.index = (array, index) -> array[parseInt(index)]

rivets.formatters.first = (array)-> array[0]

rivets.formatters.last = (array)-> array[array.length-1]

rivets.formatters.pluck = (array, key)-> array.map( (x)-> x[key] )

rivets.formatters.oneOf = (value, args...) -> value in args

rivets.formatters.in = (e,a)-> e in a

rivets.formatters.has = (a,e)-> e in a 

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

rivets.formatters.brize = (string)->  string.replace(/\n/g,"<br/>")

rivets.formatters.truncate = (string, l) -> if string  and (string.length > eval(l)) then string[0..eval(l)] + "..." else string

rivets.formatters.split = (string, separator) -> string.split(separator)

# Numerical (+ can still be used to append strings and so)

rivets.formatters['+'] = (value, args)->value + args
rivets.formatters['-'] = (value, args)->value - args
rivets.formatters['*'] = (value, args)->value * args
rivets.formatters['/'] = (value, args)->value / args


# more specific

rivets.formatters.dic = (id, dic, attr) ->
  throw "ERROR: Dictionary  session.{dic} is not bound. "  unless (d = session[dic])

  if (x = d.find( ((x) -> x['id'] is id) ))
    x[attr]
  else
    ""

rivets.formatters.format = (value, args...) ->
  if value
    return args.join(" ").format(Array(value.toString()))
  else
    return args.join(" ").format(Array('NULL'))

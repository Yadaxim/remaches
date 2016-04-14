require 'flour'

task 'bake', 'Build projects coffees into dist js', ->
  bundle  'src/*', 'dist/remaches.min.js', ->
    bundle  [
        'node_modules/rivets/dist/rivets.bundled.min.js'
        'dist/remaches.min.js'
    ], 'dist/remaches.bundled.min.js', ->

        printCake('OK!')


printCake = (abc)->
  console.log ''
  console.log '            _|||||_      '
  console.log '           {~*~*~*~}     '
  console.log "         __{*~#{abc}~*}__   " 
  console.log '        `-------------`  '




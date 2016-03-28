require 'flour'

src = 'src/remaches'
dist = 'dist/'

task 'build', 'Brew projects coffees into dist js', ->
  compile 'src/remaches.coffee', 'dist/remaches.js', ->
    minify 'dist/remaches.js', 'dist/remaches.min.js', ->
      bundle [
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




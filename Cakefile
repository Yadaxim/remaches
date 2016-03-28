require 'flour'

src = 'src/remaches'
dist = 'dist/'

task 'build', 'Brew projects coffees into dist js', ->
  compile 'src/remaches.coffee', 'dist/remaches.js', ->
    minify 'dist/remaches.js', 'dist/remaches.min.js', ->

      printCake('OK!')


printCake = (text)->
  console.log ''
  console.log '            _|||||_      '
  console.log '           {~*~*~*~}     '
  console.log "         __{*~#{text}~*}__   " 
  console.log '        `-------------`  '




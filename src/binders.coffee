## BINDERS

rivets.binders['color'] = (el,value) ->
  $(el).css "background-color": value

rivets.binders['text-color'] = (el,value) ->
  $(el).css "color": value

rivets.binders['fa'] = (el,icon) ->
  $(el).addClass("fa fa-#{icon}")

rivets.binders['glyph'] = (el,icon) ->
  $(el).addClass("glyphicon glyphicon-#{icon}")
'use strict';

# random
window.getRandomInt = (min, max) ->
  Math.floor(Math.random() * (max - min + 1)) + min

on_load = ->
  return if !window.HTMLCanvasElement

  word_count = 50
  canvas_width = 800
  canvas_height = 800
  background_color = '#24344a'
  font_color = '#506787'
  font_family = 'serif'
  font_size = [8, 16]

  inRad = (num) ->
    num * Math.PI / 180;

  canvas = document.createElement('canvas')
  canvas.width = canvas_width
  canvas.height = canvas_height

  ctx = canvas.getContext '2d'

  ctx.fillStyle = background_color
  ctx.fillRect( 0, 0, canvas.width, canvas.height )

  ctx.fillStyle = font_color

  words = [ 'а', 'б', 'в', 'г', 'д', 'е', 'ё',
            'ж', 'з', 'и', 'й', 'к', 'л', 'м',
            'н', 'о', 'п', 'р', 'с', 'т', 'у',
            'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ',
            'ы', 'ь', 'э', 'ю', 'я' ]

  count = 0

  while count < word_count
    ++count
    current_font_size = getRandomInt font_size[0], font_size[1]

    posX = getRandomInt 0, canvas.width
    posY = getRandomInt 0, canvas.height

    ctx.save()
    ctx.font = current_font_size + 'px ' + font_family
    ctx.translate posX, posY
    ctx.rotate inRad getRandomInt( 0, 360 )
    ctx.textBaseline = 'top'
    ctx.fillText( words[getRandomInt(0, words.length-1)], - current_font_size/2, - current_font_size/2)
    ctx.restore()

  document.getElementsByTagName('body')[0].style.backgroundImage = 'url(' + canvas.toDataURL() + ')'

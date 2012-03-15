# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on('click', '.slideshow .forward, .slideshow .backward', (e) ->
  forward    = $(e.target).is('.forward')
  thumbs     = $('.thumbnails img')
  active     = null
  active_idx = null

  thumbs.each((idx, image) ->
    image = $(image)
    if image.is('img.active')
      active     = image
      active_idx = idx
  )
  if forward
    next_idx = if thumbs.size() <= (active_idx + 1) then 0 else (active_idx + 1)
  else
    next_idx = if (active_idx - 1) < 0 then (thumbs.size() - 1) else (active_idx - 1)
  next = thumbs.eq(next_idx)

  if (active.data('id') != next.data('id'))
    active.removeClass('active')
    next.addClass('active')
    $.get(next.data('path'), {}, (data) ->
      $('.holder').replaceWith(data);
    )
)

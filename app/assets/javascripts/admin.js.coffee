# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#$(document).ready ->
  #setInterval(tiker('.clock', '/admin/clock'), 1000)

$(document).ready ->
  setInterval(tiker('.clock', 'clock.html #admin'), 1000)
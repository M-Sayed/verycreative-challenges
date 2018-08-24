# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = () ->
  balls_list = document.getElementById 'ballsList'
  if balls_list.getElementsByTagName("li").length == 0
    balls_list.innerHTML = '<li class="circle"></li>'

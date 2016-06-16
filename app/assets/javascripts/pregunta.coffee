# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    $('.x-send-msg').on 'click' , ->
        $.post '/maestro/siguiente'

    timer = new Date new Date().getTime() + 1000 * 10 #1000 Milliseconds 10 seconds
    $('#clock').countdown timer
      .on 'update.countdown', (event) ->
        $(this).html event.strftime '%D days %H:%M:%S'
        console.log event.strftime '%D days %H:%M:%S'
      .on 'finish.countdown', (event)->
        $(this).html event.strftime '%D days %H:%M:%S'
        console.log 'finish count'

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
    pusher = new Pusher('75159ef1c6a366266edb')
    channel = pusher.subscribe 'channel'
    channel.bind 'event' , (data)->
        console.log "Mensaje Profesor"
        console.log data
    
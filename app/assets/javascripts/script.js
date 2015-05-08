

// This is all the standard jquery stuff
$(function(){
  jQuery.noConflict();

  $("#group_submit").on("click", function(e){
    e.preventDefault();
    $("#group_form").trigger("submit");
    $("#event_form").trigger("submit");
  })

$('.event_invite').on('click', function(e){
    e.preventDefault()

    userId = $(this).attr('uid')
    groupId = $(this).attr('id');
    eventId = $(this).attr('data');
    console.log("Group id", groupId)
    console.log("Event id", eventId)
    $('.group_event_send_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events/'+eventId)

  });

$('.group_event_send_form').on('submit', function(e){
  e.preventDefault();
  userId = $('.event_invite').attr('uid')
  groupId = $('.event_invite').attr('id');
  eventId = $('.event_invite').attr('data');
  formData = $(this).serialize();
  $.ajax({
    method: "put",
    url: '/users/'+userId+'/groups/'+groupId+'/events/'+eventId,
    data: formData
  }).done(function(data){
    console.log(data)
    $('#event_invite').modal('hide');
    $('.group_event_send_form')[0].reset();
  })

})

$('.event_add').on('click', function(e){
    e.preventDefault()
    userId = $(this).attr('uid')
    groupId = $(this).attr('id');
    $('.group_event_add_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events')


  });

});
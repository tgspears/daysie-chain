

// This is all the standard jquery stuff
$(function(){

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
    console.log(groupId)
    $('.group_event_send_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events/'+eventId)

    $('.event_invite').modal('show');

  });

$('.event_add').on('click', function(e){
    e.preventDefault()
    userId = $(this).attr('uid')
    groupId = $(this).attr('id');
    $('.group_event_add_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events')


  });

});
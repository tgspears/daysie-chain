$(function(){
  $("#group_submit").on("click", function(e){
    e.preventDefault();
    $("#group_form").trigger("submit");
    $("#event_form").trigger("submit");
  })

$('.event_invite').on('click', function(e){
    e.preventDefault();
    console.log('this works')
    $('#event_invite').modal('show')
  });

$('.group_event_send_form').on('submit', function(e){
  e.preventDefault();
  var eventmodal = $(this).parent()
  formData = $(this).serialize();
  var action = $(this).attr('action')
  url = action.substring(0, action.length-4)
  console.log('this is the url', action)
  $.ajax({
    method: "put",
    url: url,
    data: formData,
    async: true
  }).done(function(data){
     jQuery.noConflict();
    $("#close_btn").trigger("click");
    $('.group_event_send_form')[0].reset();
  }).error(function(err){

  })

})

$('.event_add').on('click', function(e){
    e.preventDefault()
    userId = $(this).attr('uid')
    groupId = $(this).attr('id');
    $('.group_event_add_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events')


  });

$('.group_user_add').on('click', function(e){
    e.preventDefault();
    var userId = $(this).attr('uid');
    var groupId = $(this).attr('data');
    var eventId = $(this).attr('id');
    console.log('group id', groupId);
    console.log('event id', eventId)
    $('.group_event_send_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events/'+eventId)
    $('.event-modal').attr('id', eventId)

  });

});
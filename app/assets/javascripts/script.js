$(function(){

  $('#event_invite').on('hidden.bs.modal', function() {
    $(this).removeData('bs.modal');
  });

  $('#group_users_show').on('hidden.bs.modal', function() {
    $(this).removeData('bs.modal');
  });

  $('#create_event').on('hidden.bs.modal', function() {
    $(this).removeData('bs.modal');
  });

  $("#group_submit").on("click", function(e){
      e.preventDefault();
      $("#group_form").trigger("submit");
      $("#event_form").trigger("submit");
    });

  $('.event_invite').on('click', function(e){
      e.preventDefault();
    });

  $('.group_event_send_form').on('submit', function(e){
    e.preventDefault();
    var formData = $(this).serialize();
    var action = $(this).attr('action')
    url = action.substring(0, action.length-4)
    console.log('this is the url', action)
    $.ajax({
      method: "put",
      url: url,
      data: formData
    }).done(function(data){
      $("#close_btn").trigger("click");
      $('.group_event_send_form')[0].reset();
    }).error(function(err){
    });
  });

  $('.event_add').on('click', function(e){
      e.preventDefault()
    });

  $('.group_event_add_form').on('submit', function(e){
    e.preventDefault();
    alert('this works')
    var formData = $(this).serialize();
    var action = $(this).attr('action')
    url = action.substring(0, action.length-3)
    console.log('this is the url', action)
    $.ajax({
      method: "post",
      url: url,
      data: formData
    }).done(function(data){
      console.log(data)
      $("#other_close_btn").trigger("click");
      $('.group_event_send_form')[0].reset();
    }).error(function(err){
    });
  });


  var group_id;
  $('.group_user_add').on('click', function(e){
   group_id = $(this).attr('id');
  });

  $("#add_user").on('click', function(e){
      $("#group_id_field").attr("value", group_id )
  });




// $.datepicker.setDefaults({
//         dateFormat: 'dd.mm.yy'
//     });

// $("#datepicker").datepicker();

// $('.group_user_add').on('click', function(e){
//     e.preventDefault();
//     var userId = $(this).attr('uid');
//     var groupId = $(this).attr('data');
//     var eventId = $(this).attr('id');
//     console.log('group id', groupId);
//     console.log('event id', eventId)
//     $('.group_event_send_form').attr('action', '/users/'+userId+'/groups/'+groupId+'/events/'+eventId)
//     $('.event-modal').attr('id', eventId)

//   });
});


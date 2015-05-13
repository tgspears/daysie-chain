$(function(){

  var buttons = document.querySelectorAll(".radmenu a");

  for (var i=0, b=buttons.length; i<b; i++) {
    var button = buttons[i];
    button.onclick = setSelected;
  }

  function setSelected(e) {
    if (this.classList.contains("not")){
      return false;
    }
    else {
      if (this.classList.contains("selected")) {
        this.classList.remove("selected");
        $(this).removeClass('.sneaky');
        if (!this.parentNode.classList.contains("radmenu")) {
          this.parentNode.parentNode.parentNode.querySelector("a").classList.add("selected")
        } else {
          this.classList.add("show");
          this.style.visibility = 'hidden'
        }
      } else {
        this.classList.add("selected");
        $(this).addClass('sneaky');
        if (!this.parentNode.classList.contains("radmenu")) {
          this.parentNode.parentNode.parentNode.querySelector("a").classList.remove("selected")
        } else {
          this.classList.remove("show");
          this.style.visibility = 'visible'
        }
      }
      return false;
    }
  }

  var buttonlistener = document.querySelector('#buttoncontainer');
  buttonlistener.addEventListener('click', radialClick, false);

  function radialClick(e){
    if (e.target !== e.currentTarget) {
      console.log(e.target.closest('.radial_button').id);
      var clickedItem = e.target.closest(".radial_button").id;
      $('#menu'+clickedItem).click();
    }
    e.stopPropagation();
  }

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


  $('#scene').parallax({
    calibrateX: false,
    calibrateY: false,
    invertX: true,
    invertY: false,
    limitX: false,
    limitY: false,
    scalarX: 6,
    scalarY: 6,
    frictionX: 1,
    frictionY: 0.2,
    originX: 0.0,
    originY: 0.5
  });
})





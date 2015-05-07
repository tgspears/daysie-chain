
// This is necessary for the datepicker calendar
window.onload = function() {
        Calendar.setup({
           dateField     : 'date',
          parentElement : 'calendar'
        })
      }

// This is all the standard jquery stuff
$(function(){

  $("#group_submit").on("click", function(e){
    e.preventDefault();
    $("#group_form").trigger("submit");
    $("#event_form").trigger("submit");
  })




});
$(function(){

  $("#group_submit").on("click", function(e){
    e.preventDefault();
    alert('this works!')
    $("#group_form").trigger("submit")
    $("#event_form").trigger("submit")
  })

});
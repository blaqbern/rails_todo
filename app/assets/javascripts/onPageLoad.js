$(function(){
  $(".alert").delay(5000).slideUp(500);
  $("body").on("focus", ".date-picker", function(){
    $(this).datepicker({dateFormat: "yy-mm-dd"});
  });
});

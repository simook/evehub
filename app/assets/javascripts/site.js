$(function(){
  $('#accountTabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  $('.dropdown-toggle').dropdown();
});
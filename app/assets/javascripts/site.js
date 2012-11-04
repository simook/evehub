$(function(){
  $('#accountTabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  $('#characterTabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  $('#characterTabs a:first').tab('show')
  $('.dropdown-toggle').dropdown();
});
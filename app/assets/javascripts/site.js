$(function(){
  $('#accountTabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });
  $('#characterTabs a').click(function (e) {
    e.preventDefault();
    $(this).tab('show');
  });

  $('a[data-toggle="tab"]').on('shown', function(e){
    $.cookie('last_tab', $(e.target).attr('href'));
  });

  var lastTab = $.cookie('last_tab');
  if(lastTab){
    $('a[href='+ lastTab +']').tab('show');
  } else {
    $('a[data-toggle="tab"]:first').tab('show')
  };

  $('.dropdown-toggle').dropdown();
  $('a[rel="tooltip"]').tooltip();
});
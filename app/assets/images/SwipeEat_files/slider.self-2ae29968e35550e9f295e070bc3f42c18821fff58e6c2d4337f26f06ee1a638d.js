 $('#next').click(function() {
  $('.current').removeClass('current').hide()
      .next().show().addClass('current');
  if ($('.current').hasClass('last')) {
      $('#next').attr('disabled', true);
  }
});

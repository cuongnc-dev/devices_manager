$(document).ready(function() {
  if ($('.message-alert').is(':visible')) {
    setTimeout(function() {
      $('.message-alert').slideUp();
    }, 3000);
  }

  $('.device-row').hover(function() {
    $(this).find('.action-hidden').show();
  }, function() {
    $(this).find('.action-hidden').hide();
  })
});

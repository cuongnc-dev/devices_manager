$(document).ready(function() {
  if ($('.message-alert').is(':visible')) {
    setTimeout(function() {
      $('.message-alert').slideUp();
    }, 3000);
  }

  $(document).on('mouseover', '.device-row', function() {
    $(this).find('.action-hidden').show();
  });

  $(document).on('mouseout', '.device-row', function() {
    $(this).find('.action-hidden').hide();
  })
});

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

  var login_height = $('.panel-login').height();
  var document_height = $(document).height();

  if (document_height > login_height) {
    var margin_top = (document_height - login_height) / 2;
    $('.panel-login').css({'margin-top': margin_top});
  }
});

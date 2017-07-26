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

  var url_search = $('#search-form').attr('action');

  $('.export-exel').click(function(e) {
    e.preventDefault();
    var url_xls = $(this).attr('href');
    $('#search-form').attr('action', url_xls);
    $('#search-form').submit();
    $('#search-form').attr('action', url_search);
  });

  $('#edit-modal').on('hidden.bs.modal', function() {
    $('#edit-modal modal-body').html('');
  });

  $('.collapse-table').click(function() {
    $(this).parents('.panel').find('.panel-body').slideToggle('fast');
    $(this).toggleClass('rotate-90');
  })
});

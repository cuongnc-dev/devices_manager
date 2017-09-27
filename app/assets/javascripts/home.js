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

  $(document).on('click', '.export-exel-full', function(e) {
    e.preventDefault();
    var url_xls = $(this).attr('href');
    $('#search-form').attr('action', url_xls);
    var find_by = $('#find_by').val();
    var name = $('#name').val();
    var url = $('#search-form').attr('action'),
    var data = {find_by: find_by, name: name, format: 'xlsx'}
    $.get(url, data, null, null);
    $('#search-form').attr('action', url_search);
  });

  $(document).on('click', '.export-exel-collapse', function(e) {
    e.preventDefault();
    var url_xls = $(this).attr('href');
    $('#search-form').attr('action', url_xls);
    var find_by = $('.search-select').val();
    var name = $('.search-text').val();
    var url = $('#search-form').attr('action'),
    var data = {find_by: find_by, name: name, format: 'xlsx', type: 'collapse'}
    $.get(url, data, null, null);
    $('#search-form').attr('action', url_search);
  });

  $('#edit-modal').on('hidden.bs.modal', function() {
    $('#edit-modal modal-body').html('');
  });

  collapse_table = $(document).find('.collapse-table');
  $(collapse_table).click(function() {
    $(this).parents('.panel').find('.panel-body').slideToggle('fast');
    $(this).toggleClass('rotate-90');
  });
});

// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$(document).ready(function() {
  $('input[type=submit]').attr('disabled', true)
  $('input, textarea').change(function(e) {
    if (!$(this).val().isEmpty) {
      $('input[type=submit]').attr('disabled', false)
    }
  })
})

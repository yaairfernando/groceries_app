import $ from "jquery";


$(() => {
  if ($('.notification').length) {
    setInterval(() => {
      $('.notification').attr('style', 'display: none');
    }, 5000)
  }

  if ($('span.error').length) {
    setInterval(() => {
      $('span.error').attr('style', 'display: none');
    }, 5000)
  }
})
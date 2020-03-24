import $ from "jquery";


$(() => {
  if ($('.notification').length) {
    setInterval(() => {
      $('.notification').attr('style', 'display: none');
    }, 5000)
  }
})
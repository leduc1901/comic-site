import {owlCarousel} from 'owl.carousel'

$(document).ready(function(){
  console.log(123)
  $('.owl-carousel').owlCarousel({
    loop: true,
    items: 5,
    margin: 0
  });
});
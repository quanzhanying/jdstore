$(document).ready(function() {

  /*** Code for 'back to top' button**/

  //hides back to top button
  $('.backtop').hide();

  //button fade in fade out
  $(document).scroll(function() {

    if ($(this).scrollTop() > 800) {
      $('.backtop').fadeIn(800);
    } else {
      $('.backtop').fadeOut(200);
    }
  });

  //animate scroll to top
  $('.backtop').on('click', function() {
    $('body,html').animate({
      scrollTop: 0
    }, 800)
  });
})

/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
$(
  function () {
    $('#responsive-navbar').click(function(){
      console.log("1111");
      var x = $('#myTopnav')
      console.log(x);
      if (x.hasClass('topnav')) {
          x.addClass('responsive')
          console.log("111");
      } else {
          x.addClass('topnav');
      }
    })
  }
)


// function myFunction() {
//     var x = document.getElementById("myTopnav");
//     if (x.className === "topnav") {
//         x.className += " responsive";
//     } else {
//         x.className = "topnav";
//     }
// }

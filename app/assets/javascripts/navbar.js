/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */
$(
  function () {
    $('#responsive-navbar').click(function(){
          var x = document.getElementById("myTopnav");
          if (x.className === "topnav") {
              x.className += " responsive";
          } else {
              x.className = "topnav";
          }
    })
  }
)

$(
  function () {
    $('.account-link a').click(function () {
      console.log("111");
      $('.account-dropdown').toggleClass('content-toggle')
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

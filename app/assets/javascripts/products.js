
$(document).on('click.product.show.menu', '[data-toggle="tab"]',function(e){
  //得到被点击的元素，并取出它的option，看是“商品详情”还是“商品评论”
  var $this = $(this);
  var option = $this.attr('data-option');

  var i, tabcontent, tablinks;
  //先将所有tabcontent隐藏
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
  }

  // Get all elements with class="tablinks" and remove the class "active"
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
  }

  // Show the current tab, and add an "active" class to the button that opened the tab
  document.getElementById(option).style.display = "block";
  e.currentTarget.className += " active";

})

// Get the element with id="defaultOpen" and click on it
$(function(){
  document.getElementById("defaultOpen").click();
});

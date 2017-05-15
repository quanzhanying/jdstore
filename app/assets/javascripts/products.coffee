# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


<textarea id="some-textarea" class='wysihtml5' placeholder="Enter text ..."></textarea>

  $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5({
        toolbar: {
          "color": true,
          "size": 'sm'
        },
        "locale" : 'zh-CN',
      });
    });

  <script type="text/javascript">
    $(document).ready(function(){

      $('.wysihtml5').each(function(i, elem) {
        $(elem).wysihtml5();
      });

    })
  </script>


  $('.wysihtml5').wysihtml5({'toolbar': {'blockquote': false, 'html': true, 'smallmodals': true }})




  function ReImgSize(){
    for (j=0;j<document.images.length;j++)
    {
      document.images[j].width=(document.images[j].width>420)?"420":document.images[j].width;
    }
  }

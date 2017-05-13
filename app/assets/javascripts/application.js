// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require bootstrap-sprockets
//= require bootstrap/collapse
//= require bootstrap-wysihtml5
//= require bootstrap-wysihtml5/locales/zh-CN
//= require_tree .


// 以下部分是文本编辑器所需的支持代码块↓↓↓
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

// 以下部分，可以对文本编辑器进行相关功能的开关设置↓↓↓
  $('.wysihtml5').wysihtml5({'toolbar': {'blockquote': true, 'html': true}})
  // toolbar: {
  //     'font-styles': true,
  //     'color': false,
  //     'emphasis': {
  //       'small': true
  //     },
  //     'blockquote': true,
  //     'lists': true,
  //     'html': false,
  //     'link': true,
  //     'image': true,
  //     'smallmodals': false
  //   }

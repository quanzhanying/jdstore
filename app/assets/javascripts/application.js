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

//= require bootstrap/alert
//= require bootstrap/dropdown
//= require jquery.raty

//= require_tree .


  $('.star-value').raty({
        path: '/assets/',
            readOnly: true,
            score: function() {
          return $(this).attr('data-score');
        }
  });
  $('.star-risk').raty({
        path: '/assets/',
            readOnly: true,
            score: function() {
          return $(this).attr('data-score');
        }
  });
  $('.star-furtue').raty({
        path: '/assets/',
            readOnly: true,
            score: function() {
          return $(this).attr('data-score');
        }
  });

  $('#star-value').raty({
  path: '/assets/',
  scoreName: 'review[value]'
  });

  $('#star-risk').raty({
  path: '/assets/',
  scoreName: 'review[risk]'
  });

  $('#star-furtue').raty({
      path: '/assets/',
      scoreName: 'review[furtue]'
  });

  $('#star-value img').eq(0).trigger('click')
  $('#star-risk img').eq(0).trigger('click')
  $('#star-furtue img').eq(0).trigger('click')

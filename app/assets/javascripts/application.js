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
//= require_tree .
$('.star-freshness').raty({
      path: '/images/ratyrate/',
          readOnly: true,
          score: function() {
        return $(this).attr('data-score');
      }
});
$('.star-look').raty({
      path: '/images/ratyrate/',
          readOnly: true,
          score: function() {
        return $(this).attr('data-score');
      }
});
$('.star-price').raty({
      path: '/images/ratyrate/',
          readOnly: true,
          score: function() {
        return $(this).attr('data-score');
      }
});

$('#star-freshness').raty({
path: '/images/ratyrate/',
scoreName: 'review[freshness]'
});

$('#star-look').raty({
path: '/images/ratyrate/',
scoreName: 'review[look]'
});

$('#star-price').raty({
    path: '/images/ratyrate/',
    scoreName: 'review[price]'
});

$('#star-taste img').eq(0).trigger('click')
$('#star-look img').eq(0).trigger('click')
$('#star-price img').eq(0).trigger('click')

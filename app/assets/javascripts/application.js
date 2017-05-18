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

//-------float button(qq & go top)--------
$(function() {
    $("#usr_rmenu").each(function() {
        $(this).find(".btn-top").click(function() {
            $("html, body").animate({
                "scroll-top": 0
            }, 800)
        })
    });
    var lastRmenuStatus = false;
    $(window).scroll(function() {
        var _top = $(window).scrollTop();
        if (_top > 200) {
            $("#usr_rmenu").data("expanded", true)
        } else {
            $("#usr_rmenu").data("expanded", false)
        }
        if ($("#usr_rmenu").data("expanded") != lastRmenuStatus) {
            lastRmenuStatus = $("#usr_rmenu").data("expanded");
            if (lastRmenuStatus) {
                $("#usr_rmenu .btn-top").slideDown()
            } else {
                $("#usr_rmenu .btn-top").slideUp()
            }
        }
    })
});
//-------float button(qq & go top) end--------

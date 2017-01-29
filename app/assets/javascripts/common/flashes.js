$(document).ready(function() {
    setTimeout(function() {
        $('#notice_wrapper').fadeOut(1500, function() {
            $(this).remove();
        });
    }, 3000);
});

$(document).ready(function() {
    $.ajaxSetup({
        'beforeSend': function(xhr) {
            xhr.setRequestHeader("Accept", "text/javascript")
        }
    });

    $.fn.submitWithAjax = function() {
        this.submit(function() {
            $.post(this.action, $(this).serialize(), null, "script");
            return false;
        });
        return this;
    };

$('#create_list_link').click(function(){
    $('#new_list').css('display', 'block');
    $('#create_list_link').hide();
});


$('#cancel_create_list').click(function(){
    $('#new_list').css('display', 'none');
    $('#create_list_link').show();
});

//    $('#new_list').submit(function() {
//        $('#new_list').submitWithAjax();
//    });
});



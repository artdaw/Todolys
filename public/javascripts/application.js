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

    $('.submittable').live('click change', function() {
        $(this).parents('form:first').submit();
        return false;
    });

    $('.editable_todo').live('click', function(event) {
        $(this).siblings('.edit_area').show();
        $(this).hide();
        return false;
    });

    $('.cancelable').click(function() {
        $(this).parent('.edit_area').parents('form:first')[0].reset();
        $(this).parent('.edit_area').hide();
        $(this).parent('.edit_area').siblings('.editable_todo').show();
        return false;
    });

});



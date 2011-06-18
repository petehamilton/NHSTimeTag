
var notifications_last_polled = new Date().getTime() / 1000;

$(document).ready(function() {
    setInterval(function() {
        update_notifications();
        }, 10000); //5 Minutes

        $('.handle').click(function() {
            expand_delay_editor(this);
        });
        $('.update-box .button').click(function() {
            update_delay(this);
        });
        $('.handle').addClass('expand');
    });

function expand_delay_editor(handle_ref){
    $(handle_ref).parent().parent().animate({
        'marginRight':0,
        }, 500);

        $(handle_ref).unbind('click');
        $(handle_ref).click(function() {
            contract_delay_editor(handle_ref);
        });
        $(handle_ref).addClass('contract').removeClass('expand');
}

function contract_delay_editor(handle_ref){
    $(handle_ref).parent().parent().animate({
        'marginRight':-120,
        }, 500);

        $(handle_ref).unbind('click');
        $(handle_ref).click(function() {
            expand_delay_editor(handle_ref);
        });
        $(handle_ref).addClass('expand').removeClass('contract');
}

function get_appointments(doctor_id){
    $.ajax({
        url: "/doctors/"+doctor_id+"/get_appointments",
        success: function(appointments) {
            // Replace the appointments in the appointmens container
            $('#appointments').replaceWith(appointments);
        },
    });
}

function update_notifications(){
    $.ajax({
        url: "/doctors/get_cancellations",
        data: "last_polled=" + (notifications_last_polled),
        success: function(new_notifications) {
            if(new_notifications != ""){
                // Add the new notifications to the notifications container
                $('#notifications .placeholder').remove();
                $('#notifications').prepend(new_notifications);
                $('.notification').css('opacity',0.5);
                $('.notification.new').fadeIn(500);
                $('.notification.new').effect("pulsate", { times:3 }, 500);
                $('.notification.new').click(function (){
                    $(this).fadeOut(500).remove();
                });
                $('.notification.new').removeClass('new');
            }
        },
    });

    // notifications_last_polled = new Date().getTime() / 1000;
}

function update_delay(button_ref){
    var doctor_id = $(button_ref).parent().parent().parent().attr('id');
    var delay = $(button_ref).parent().find('.delay').val();
    status = $.getJSON("/doctors/" + doctor_id + "/update_delay/" + delay, function(json) {
        // alert("Set class to " + json.status_class + " and status message to " + json.status_message);
        $(button_ref).parent().parent().parent().find('.status').removeClass('not-delayed delayed severely-delayed').addClass(json.status_class).text(json.status_message);
     });
    
    $(button_ref).parent().find('.handle').click();
    
    update_doctor_status(doctor_id, delay)
}

function update_doctor_status(doctor_id, delay){
    
    // Code to change the class & text of the doctor's status
}

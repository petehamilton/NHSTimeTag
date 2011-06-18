
var notifications_last_polled = new Date().getTime() / 1000;

$(document).ready(function() {
    setInterval(function() {
        update_notifications();
        }, 5000);

        $('.handle').click(function() {
            expand_delay_editor(this);
        });
        $('.handle').addClass('expand');
    });

function expand_delay_editor(handle_ref){
    $(handle_ref).parent().animate({
        'marginRight':0,
        }, 500);

        $(handle_ref).unbind('click');
        $(handle_ref).click(function() {
            contract_delay_editor(handle_ref);
        });
        $(handle_ref).addClass('contract').removeClass('expand');
}

function contract_delay_editor(handle_ref){
    $(handle_ref).parent().animate({
        'marginRight':-160,
        }, 500);

        $(handle_ref).unbind('click');
        $(handle_ref).click(function() {
            expand_delay_editor(handle_ref);
        });
        $(handle_ref).addClass('expand').removeClass('contract');
}

function update_notifications(){
    $.ajax({
        url: "/doctors/get_cancellations",
        data: "last_polled=" + (notifications_last_polled),
        success: function(new_notifications) {
            // Add the new notifications to the notifications container
            $('#notifications').prepend(new_notifications);
        },
    });

    notifications_last_polled = new Date().getTime() / 1000;
}


function update_delay(doctor_id, delay){
    $.ajax({
        url: "/doctors/" + doctor_id + "/update_delay/" + delay,
        success: function(new_notifications) {
            alert("saved");
        },
    });
    
    update_doctor_status(doctor_id, delay)
}

function update_doctor_status(doctor_id, delay){
    
    // Code to change the class & text of the doctor's status
}
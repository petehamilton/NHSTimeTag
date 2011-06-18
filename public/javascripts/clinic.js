
var notifications_last_polled = new Date().getTime() / 1000;

$(document).ready( function () {
  $(".doctor").click(function () {
    get_appointments($(this).attr('id'));
  });
});

setInterval(function() {
    update_notifications();
}, 5000); //5 seconds

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
            // Add the new notifications to the notifications container
            $('#notifications').prepend(new_notifications);
        },
    });
    
    notifications_last_polled = new Date().getTime() / 1000;
}

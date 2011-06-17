
var notifications_last_polled = new Date().getTime() / 1000;

setInterval(function() {
    update_notifications();
}, 5000); //5 seconds

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

function get_notifications(){
    var last_polled = new Date().getTime() / 1000;
    $.getJSON("/doctors/get_cancellations?last_polled=" + last_polled, function(json){
        $.each(json, function(i, cancellation){
            addNotification(title, message);2
        });
    });
}

function addNotification(title, message){
    var notification =
    notification.appendTo($('#notifications'));
}

/*
$.ajax({
url: "/doctors/get_cancellations",
data: "last_polled=1308342640",// + (new Date().getTime() / 1000),
success: function(data) {
var things = jQuery.parseJSON(data);
for(key in things) {
alert("TEST");
var value = things[key];
alert(value);
}
},
});

setInterval(function() {
$.ajax({
url: "/doctors/get_cancellations",
success: function(data) {
//alert(data);
},
error: function(data) {
var things = jQuery.parseJSON(data);
//alert(data);
}
});
}, 5000); //5 seconds
*/
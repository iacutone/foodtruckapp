// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var mapOptions = {
      center: { lat: -34.397, lng: 150.644},
      zoom: 8
    };
    //var map = new google.maps.Map(document.getElementById('map-canvas'),
       // mapOptions);

  
  var source = new EventSource('/locations_stream');
    source.addEventListener('message', function(e) {
        console.log("Received "+e.data);
        updateItemsPage(e.data);
    }, false);
// need to insert marker instead of <li> and add conditional that places new markers based on
// a new truck_id data point, and or replaces coordinates for an existing one
  function updateItemsPage(event) {
    var item = $('<li>').text(event);
    $('#map-canvas').prepend(item);
  }
})
    
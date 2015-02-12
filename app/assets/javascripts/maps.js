// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// All this logic will automatically be available in application.js.
$(document).ready(function(){
  var allMarkers = [];
  var mapOptions = {
      center: { lat: 37.333, lng: -122.031},
      zoom: 8,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
  
  var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  var source = new EventSource('/locations_stream');
    source.addEventListener('message', function(e) {
        resolveMarker(e.data);
    }, false);

  function resolveMarker(event) {
    data = JSON.parse(event);
    // see if allMarkers has marker via truck_id
    if (checkMarkers(data) == null)
    {
      // if marker is not on map, call setMarker
      setMarker(data);
    }
    else
    {
      // if marker is on map call updateMarker
      updateMarker(marker);
    }
  }

  function setMarker(data) {
    var truck_name = data.truck_name;
    var truck_id = data.truck_id;
    var markerPosition = new google.maps.LatLng(data.location.latitude,data.location.longitude);

    console.log(data);
    var marker = new google.maps.Marker({
      position: markerPosition,
      name: truck_name,
      id: truck_id
    });
    marker.setMap(map);
    allMarkers.push(marker);
  }

  function updateMarker(event) {
    // update location of marker
  }

  function checkMarkers(event) {
    var id = event.truck_id;
    for(var i = 0; i < allMarkers.length; i++)
    {
      if(allMarkers[i].truck_id == id)
      {
        return allMarkers[i];
      }
      else
      {
        return null;
      }
    }
  }
})
    
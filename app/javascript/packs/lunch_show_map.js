import GMaps from 'gmaps/gmaps.js';




const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const origin = JSON.parse(mapElement.dataset.origin)
  const destination = JSON.parse(mapElement.dataset.destination)
  const map = new GMaps({ el: '#map', lat: origin.lat, lng: origin.lng })
  const markers = [origin, destination];
  map.addMarkers(markers);
  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(markers[0].lat, markers[0].lng);
    map.setZoom(14);
  } else {
    map.fitLatLngBounds(markers);
  }
  console.log(origin, destination)
  map.travelRoute({
    origin: [origin.lat, origin.lng],
    destination: [destination.lat, destination.lng],
    travelMode: 'walking',
    strokeColor: '#131540',
    strokeOpacity: 0.6,
    strokeWeight: 6,

    step: (e) => {
      console.log(e.instructions);
        map.drawPolyline({
          path: e.path,
          strokeColor: '#131540',
          strokeOpacity: 0.6,
          strokeWeight: 6
        });
    }


    // step: setTimeout( function(e) {
    //   map.drawPolyline({
    //   path: e.path,
    //   strokeColor: '#131540',
    //   strokeOpacity: 0.6,
    //   strokeWeight: 6
    //   });
    // }, 500)



    // step: function(e) {
    //   console.log(e.instructions);
    //   setTimeout( function () {
        // map.drawPolyline({
        //   path: e.path,
        //   strokeColor: '#131540',
        //   strokeOpacity: 0.6,
        //   strokeWeight: 6
        // });
    //   }, 500);

    //   $('#instructions').append('<li>'+e.instructions+'</li>');
    //   $('#instructions li:eq(' + e.step_number + ')').delay(450 * e.step_number).fadeIn(200, function() {
    //     map.drawPolyline({
    //       path: e.path,
    //       strokeColor: '#131540',
    //       strokeOpacity: 0.6,
    //       strokeWeight: 6
    //     });
    //   });
    // }
  });


}
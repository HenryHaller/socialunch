import GMaps from 'gmaps/gmaps.js';



if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition  ( function (position) {
    console.log(position.coords);
    const lat = position.coords.latitude;
    const lng = position.coords.longitude;

    const mapElement = document.getElementById('map');
    if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: lat, lng: lng });
    map.setZoom(14)
    map.addMarker({
      lat: lat,
      lng: lng,
      title: "Your Location"
    })
    // const markers = JSON.parse(mapElement.dataset.markers);
    // map.addMarkers(markers);
    // if (markers.length === 0) {
    //   map.setZoom(2);
    // } else if (markers.length === 1) {
    //   map.setCenter(markers[0].lat, markers[0].lng);
    //   map.setZoom(14);
    // } else {
    //   map.fitLatLngBounds(markers);
    // }
  }
  });
}
else {
  console.log("Geolocation unavailable")
}

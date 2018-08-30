import GMaps from 'gmaps/gmaps.js';
const styles = [ {
        "featureType": "poi",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#747474"
            },
            {
                "lightness": "23"
            }
        ]
    },
    {
        "featureType": "poi.attraction",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#f38eb0"
            }
        ]
    },
    {
        "featureType": "poi.government",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ced7db"
            }
        ]
    },
    {
        "featureType": "poi.medical",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffa5a8"
            }
        ]
    },
    {
        "featureType": "poi.park",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c7e5c8"
            }
        ]
    },
    {
        "featureType": "poi.place_of_worship",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#d6cbc7"
            }
        ]
    },
    {
        "featureType": "poi.school",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#c4c9e8"
            }
        ]
    },
    {
        "featureType": "poi.sports_complex",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#b1eaf1"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "geometry",
        "stylers": [
            {
                "lightness": "100"
            }
        ]
    },
    {
        "featureType": "road",
        "elementType": "labels",
        "stylers": [
            {
                "visibility": "off"
            },
            {
                "lightness": "100"
            }
        ]
    },
    {
        "featureType": "road.highway",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffd4a5"
            }
        ]
    },
    {
        "featureType": "road.arterial",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "color": "#ffe9d2"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "all",
        "stylers": [
            {
                "visibility": "simplified"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.fill",
        "stylers": [
            {
                "weight": "3.00"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "geometry.stroke",
        "stylers": [
            {
                "weight": "0.30"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "labels.text",
        "stylers": [
            {
                "visibility": "on"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "labels.text.fill",
        "stylers": [
            {
                "color": "#747474"
            },
            {
                "lightness": "36"
            }
        ]
    },
    {
        "featureType": "road.local",
        "elementType": "labels.text.stroke",
        "stylers": [
            {
                "color": "#e9e5dc"
            },
            {
                "lightness": "30"
            }
        ]
    },
    {
        "featureType": "transit.line",
        "elementType": "geometry",
        "stylers": [
            {
                "visibility": "on"
            },
            {
                "lightness": "100"
            }
        ]
    },
    {
        "featureType": "water",
        "elementType": "all",
        "stylers": [
            {
                "color": "#d2e7f7"
            }
        ]
    }
];


if ("geolocation" in navigator) {
  navigator.geolocation.getCurrentPosition  ( function (position) {
    console.log(position.coords);
    const lat = position.coords.latitude;
    const lng = position.coords.longitude;

    const latElement = document.querySelector('#lat');
    const lngElement = document.querySelector('#lng');
    latElement.value = lat;
    lngElement.value = lng;

    const mapElement = document.getElementById('map');
    if (mapElement) { // don't try to build a map if there's no div#map to inject in
    const map = new GMaps({ el: '#map', lat: lat, lng: lng });
    map.setZoom(14)
    map.addMarker({
      lat: lat,
      lng: lng,
      title: "Your Location"
    })
    map.addStyle({
      styles: styles,
      mapTypeId: 'map_style'
    });
    map.setStyle('map_style');
    map.setZoom(17);
    const mySubmit = document.querySelector("#mySubmit");
    console.log(mySubmit);
    mySubmit.value = "Ready to Eat!";
    mySubmit.disabled = false;
    mySubmit.classList.remove("lunch_request_btn_unready");
    mySubmit.classList.add("lunch_request_btn");
    // if (markers.length === 0) {
    //   map.setZoom(2);
    // } else if (markers.length === 1) {
    //   map.setCenter(markers[0].lat, markers[0].lng);
    //   map.setZoom(14);
    // } else {
    //   map.fitLatLngBounds(markers);
    // }
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

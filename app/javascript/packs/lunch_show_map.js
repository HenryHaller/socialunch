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


const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
  // const directionsList = document.querySelector("#directions")
  const origin = JSON.parse(mapElement.dataset.origin)
  const destination = JSON.parse(mapElement.dataset.destination)
  const map = new GMaps({ el: '#map', lat: origin.lat, lng: origin.lng })
  const markers = [origin, destination];
  map.addMarkers(markers);
  map.fitLatLngBounds(markers);
  map.addStyle({
    styles: styles,
    mapTypeId: 'map_style'
  });
  map.setStyle('map_style');
  const lineSymbol = {
    path: google.maps.SymbolPath.FORWARD_CLOSED_ARROW
  };

  console.log(origin, destination)
  map.travelRoute({
    origin: [origin.lat, origin.lng],
    destination: [destination.lat, destination.lng],
    travelMode: 'walking',
    strokeColor: '#131540',
    strokeOpacity: 0.6,
    strokeWeight: 6,

    step: (e) => {
      console.log(e)
      directions.insertAdjacentHTML("beforeend", `<li><span class="step">${e.step_number+1}.</span><span class="distance">${e.distance.text}</span> ${e.instructions} </li>`)
      map.drawPolyline({
        path: e.path,
        strokeColor: '#FD6A02',
        strokeOpacity: 0.8,
        strokeWeight: 6,
        icons: [{
          icon: lineSymbol,
          offset: '100%'
        }],

      });
    }
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

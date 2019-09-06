import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
if (mapElement) { // don't try to build a map if there's no div#map to inject in
const markers = JSON.parse(mapElement.dataset.markers);
console.log(markers.lng);
  const map = new GMaps({ el: '#map', lat: markers.lat, lng: markers.lng });
  const location = map.addMarkers([  
    {  
      "lat": markers.lat,  
      "lng": markers.lng,  
      "picture": {  
        "width":  32,  
        "height": 32  
      },  
    }  
  ]);
}

if (mapElement) { // don't try to build a map if there's no div#map to inject in
const markers = JSON.parse(mapElement.dataset.markers);
console.log(markers.lng);
  const map = new GMaps({ el: '#map', lat: markers.lat, lng: markers.lng });
  const location = map.addMarkers([  
    {  
      "lat": markers.lat,  
      "lng": markers.lng,  
      "picture": {  
        "width":  32,  
        "height": 32  
      },  
    }  
  ]);
}
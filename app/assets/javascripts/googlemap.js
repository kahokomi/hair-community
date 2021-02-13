/*global gon*/
/*global google*/

function initMap(){
  var pin = {lat: gon.lat, lng: gon.lng};
  var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 15,
            center: pin
            });
  var transitLayer = new google.maps.TransitLayer();
  transitLayer.setMap(map);

  var contentString = '住所: gon.concat_address';
  var infowindow = new google.maps.InfoWindow({
    content: contentString
  });

  var marker = new google.maps.Marker({
                position: pin,
                map: map,
                title: contentString
               });

   marker.addListener('click', function() {
     infowindow.open(map, marker);
   });
}
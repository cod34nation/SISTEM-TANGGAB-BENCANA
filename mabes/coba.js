function updateMarkerPosition(latLng) {
        document.getElementById('lat').value = [latLng.lat()];
        document.getElementById('lng').value = [latLng.lng()];
    }

    	var map = new google.maps.Map(document.getElementById('map'),{
    		center: {
              lat:-6.159204,
              lng:112.040500
    		},  
    		zoom:5,

    	});

        var marker = new google.maps.Marker({
            position : {
                lat:-6.206853, 
              lng:106.842939
          },
          map:map,
          draggable:true
        });

        var searchBox = new google.maps.places.SearchBox(document.getElementById('mapsearch'));

        google.maps.event.addListener(searchBox, 'places_changed',function () {
            // body...
            var places = searchBox.getPlaces();

            var bounds = new google.maps.LatLngBounds();
            var i , place;

            for(i=0; place=places[i];i++){
                
                // console.log(place.geometry.location);

                bounds.extend(place.geometry.location);
                marker.setPosition(place.geometry.location);
                
            }

            map.fitBounds(bounds);
            map.setZoom(12);
        });

        google.maps.event.addListener(marker, 'drag', function() {
        updateMarkerPosition(marker.getPosition());
    });
  

<?php
$rate = 1;
$urgent = 1.2;
//}
?>
<html>
<head>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyD9tCRG-KAV35C25bvJ527azwCvuQlu6ZA&libraries=places" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
      var map = null;
      var directionDisplay;
      var directionsService = new google.maps.DirectionsService();

      function initialize() {
        directionsDisplay = new google.maps.DirectionsRenderer();

        var UK = new google.maps.LatLng(55.7591402,-4.1883331);

        var mapOptions = {
                    center              : UK,
                    zoom                : 4,
                    minZoom             : 3,
                    streetViewControl   : false,
                    mapTypeId           : google.maps.MapTypeId.ROADMAP,
                    zoomControlOptions  : {style:google.maps.ZoomControlStyle.MEDIUM}
                };


        map = new google.maps.Map(document.getElementById('map_canvas'),
            mapOptions);

         //Find From location
    var fromText = document.getElementById('start');
    var fromAuto = new google.maps.places.Autocomplete(fromText);
    fromAuto.bindTo('bounds', map);
    //Find To location
    var toText = document.getElementById('end');
    var toAuto = new google.maps.places.Autocomplete(toText);
    toAuto.bindTo('bounds', map);
    //
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('directions-panel'));

        /*var control = document.getElementById('control');
        control.style.display = 'block';
        map.controls[google.maps.ControlPosition.TOP].push(control);*/
      }

      function calcRoute() {
        var start = document.getElementById('start').value;
        var end = document.getElementById('end').value;
        var request = {
          origin: start,
          destination: end,
          travelMode: google.maps.DirectionsTravelMode.DRIVING
        };
        directionsService.route(request, function(response, status) {
          if (status == google.maps.DirectionsStatus.OK) {
            directionsDisplay.setDirections(response);
            computeTotalDistance(response);
          }
        });
      }
      function computeTotalDistance(result) {
      var rate = 500;
    var urgent = 1.2;
    var total = 0;
    var cost;
    var myroute = result.routes[0];
    for (i = 0; i < myroute.legs.length; i++) {
        total += myroute.legs[i].distance.value;
    }
    total = total / 1000;
    /*Start Calculating Distance Fair*/
    if (document.getElementById('sameday').checked == true) {
        cost = total * rate;
    } else if (document.getElementById('samedayurgent').checked == true) {
        cost = total * urgent;
    }
    cost = Math.round(cost * 100) / 100;
    /*Distance Fair Calculation Ends*/
    document.getElementById("total").innerHTML = "Total Distance = " + total + " km and Rupiah = Rp. " + cost;
      }

    function auto() {
    var input = document.getElementById[('start'), ('end')];
    var types
    var options = {
       types: [],
       componentRestrictions: {country: ["UK"]}
        };
        var autocomplete = new google.maps.places.Autocomplete(input, options);
     }

      google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body onLoad="initialize()">
<table width="380px" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr>
    <td style="padding:5px;">
    <table width="375px" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><div id="map_canvas" style="width: 374px; height: 300px; border: solid 1px #336699"></div></td>
        </tr>
        <tr>
          <td><div id="form" style="width:374px; text-align:center; border: solid 1px #336699; background:#d1e1e4;">
          <input type="radio" name="post-type" id='sameday' checked> Same Day
            <br>
            <input type="radio" name="post-type" id='samedayurgent'> Same Day Urgent
                        <br>
              From:
                <input type="text" id="start" size="60px" name="start" placeholder="Enter Location From">
                <br />
                To:
                <input size="60px" type="text" id="end" name="end" placeholder="Enter Destination ">
                <input type="button" value="Calculate" onClick="calcRoute();">
             <div id="total"></div>
             </div></td>
        </tr>
      </table>
      </td>
  </tr>
</table>
</body>
</html>

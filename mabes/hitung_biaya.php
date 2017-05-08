<?php
// session_start();
// include 'koneksi.php';
$rate = 1;
$urgent = 1.2;

// if (empty($_SESSION['nomor_pers'])){
//     header("location:../akses");
// }
// error_reporting(E_ALL & ~E_NOTICE);
// ob_start();
// $page=htmlentities($_GET['page']);

$idmember=$_SESSION['nomor_pers'];
$bencana = mysqli_query($koneksi, "SELECT * FROM operasi,user WHERE user.nomor_pers=operasi.nomor_pers AND operasi.nomor_pers=$idmember");

?>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- <script type="text/javascript" src="jquery.min.js"></script>
  <script type="text/javascript" src="script.js"></script> -->
<script src="http://maps.google.com/maps/api/js?key=AIzaSyD9tCRG-KAV35C25bvJ527azwCvuQlu6ZA&libraries=places" type="text/javascript"></script>
  <script type="text/javascript">
  //<![CDATA[

  var customIcons = {
    bencana: {
      icon: 'mapping/kuning.png'
    },
    ancaman: {
      icon: 'mapping/merah.png'
    },
    penyerangan: {
      icon: 'mapping/biru.png'
    },
    pelanggaran :{
      icon: 'mapping/hijau.png'
    }


  };

      //<![CDATA[
        var map = null;
        var directionDisplay;
        var directionsService = new google.maps.DirectionsService();

        function initialize() {
          directionsDisplay = new google.maps.DirectionsRenderer();

          var UK = new google.maps.LatLng(-0.360715,117.752418);

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
        var rate = 1000000;
      var urgent = 10000000;
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
      document.getElementById("total").innerHTML = "Jarak yang ditempuh = " + total + " km and Rupiah = Rp. " + cost;
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
    <!-- <link href="css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap-responsive.css" rel="stylesheet"> -->
    <meta charset="utf-8">
    <title>Regional</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">


    <!--link rel="stylesheet/less" href="less/bootstrap.less" type="text/css" /-->
    <!--link rel="stylesheet/less" href="less/responsive.less" type="text/css" /-->
    <!--script src="js/less-1.3.3.min.js"></script-->
    <!--append �#!watch� to the browser URL, then refresh the page. -->

    <!--  <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet"> -->

    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <![endif]-->

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="img/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="img/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="img/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="img/favicon.png">

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
  </head>

  <body onLoad="initialize()">
    <div id="map_canvas" style="width: 1000px; height: 300px; border: solid 1px #336699"></div>
        <div  style="width:1000px; text-align:center; border: solid 1px; background:black;">
            <input type="radio" name="post-type" id='sameday' checked> Truk
              <br>
              <input type="radio" name="post-type" id='samedayurgent'> Kerata Barang
                          <br>
                Dari

                  <select id="start">
                    <option value="jakarta">MABES</option>
                    <option value="bandung">KODAM</option>
                    <option value="surabaya">BlitarO</option>

                  </select>
                  <br />
                  Menuju Lokasi Bencana :
                     <select id="end">
                       <?php
                               while ($data = mysqli_fetch_array($bencana)) {

                                  $lat =$data['lat'];
                                  $lng = $data['lng'];
                                  $nama_bencana =$data['nama_bencana'];
                               ?>

                     <option value="<?php echo $lat.",".$lng ;?>"><?php echo $nama_bencana; ?></option>

                    <?php } ?>
                   </select>

                    <input type="button" value="Calculate" onClick="calcRoute();">
               <div id="total"></div>
               </div>

  </body>
  <script>
  $(function(){
    $(document).on('click','.edit-record',function(e){
      e.preventDefault();
      $("#myModal").modal('show');
      $.post('donasikan.php',
      {id:$(this).attr('data-id'),us:$(this).attr('data-us')},
      function(html){
        $(".modal-body").html(html);
      }
    );
  });
});
</script>
</html>

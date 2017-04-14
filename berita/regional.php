 <?php

$cobareg = mysqli_query($koneksi, "SELECT * FROM user,provinsi WHERE user.id_prov=provinsi.id_prov AND nomor_pers = '$idmember'");
$rowreg = mysqli_fetch_array($cobareg);
  ?>
 <!DOCTYPE html>
<html lang="en">
<head>
<!-- <script type="text/javascript" src="jquery.min.js"></script>
  <script type="text/javascript" src="script.js"></script> -->
  <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyD9tCRG-KAV35C25bvJ527azwCvuQlu6ZA"></script>
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

    function load() {
      var map = new google.maps.Map(document.getElementById("map"), {
        center: new google.maps.LatLng("<?php echo $rowreg['lat']; ?>", "<?php echo $rowreg['lng']; ?>"),
        zoom: 9,
        mapTypeId: 'roadmap'
      });
      var infoWindow = new google.maps.InfoWindow;

      // Change this depending on the name of your PHP file
      downloadUrl("phpsqlajax_genxmlreg.php", function(data) {
        var xml = data.responseXML;
        var markers = xml.documentElement.getElementsByTagName("marker");
        for (var i = 0; i < markers.length; i++) {
          var kategori = markers[i].getAttribute("nama_kategori");
          var nama_bencana = markers[i].getAttribute("nama_bencana");
          var tgl_input = markers[i].getAttribute("tgl_input");
          var keterangan = markers[i].getAttribute("keterangan");
          var nomor_pers = markers[i].getAttribute("nomor_pers");
          var id_bencana = markers[i].getAttribute("id_bencana");
          var status = markers[i].getAttribute("status");
          var point = new google.maps.LatLng(
              parseFloat(markers[i].getAttribute("lat")),
              parseFloat(markers[i].getAttribute("lng")));
          var html = "<b>" + kategori + "</b> <br/>" + nama_bencana+ "</b> <br/>" + tgl_input
          + "</b> <br/>" + "<a href='#' class='edit-record' data-id="+id_bencana+" data-us="+nomor_pers+" > <button type='button' class='btn btn-primary btn-sm'>DETAIL</button></a>";
          var icon = customIcons[kategori] || {};
          var marker = new google.maps.Marker({
            map: map,
            position: point,
            icon: icon.icon
          });
          bindInfoWindow(marker, map, infoWindow, html);
        }
      });
    }

    function bindInfoWindow(marker, map, infoWindow, html) {
      google.maps.event.addListener(marker, 'click', function() {
        infoWindow.setContent(html);
        infoWindow.open(map, marker);
      });
    }

    function downloadUrl(url, callback) {
      var request = window.ActiveXObject ?
          new ActiveXObject('Microsoft.XMLHTTP') :
          new XMLHttpRequest;

      request.onreadystatechange = function() {
        if (request.readyState == 4) {
          request.onreadystatechange = doNothing;
          callback(request, request.status);
        }
      };

      request.open('GET', url, true);
      request.send(null);
    }

    function doNothing() {}

    //]]>

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

<body>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        
                        <h4 class="modal-title" id="myModalLabel">SIGAN Form</h4>
                    </div>
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">
                        
                    </div>
                </div>
            </div>
        </div>
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">
      
    </div>
  </div>
  <br>
  <h1>Peta SIGAP Regional provinsi <?php echo $rowreg['nama_prov']; ?></h1>
  <br>
  <div class="row">
      <body onload="load()">
    <div class="row clearfix">
    <div class="col-md-12 column">
     <div class="x_panel">
                <div class="x_title">
                  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal1">Legenda</button>
<!-- Modal -->
<div id="myModal1" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Modal Header</h4>
      </div>
      <div class="modal-body">
         <ul class="nav navbar-right panel_toolbox">
                      
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <table class="table">
                      <thead>
                        <tr>
                          <th>#</th>
                          <th>Simbol</th>
                          <th>Keterangan</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <th scope="row">1</th>
                          <td><img src="mapping/kuning.png"></td>
                          <td>Bencana</td>
                          
                        </tr>
                        <tr>
                          <th scope="row">2</th>
                          <td><img src="mapping/merah.png"></td>
                          <td>Ancaman</td>
                          
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td><img src="mapping/biru.png"></td>
                          <td>Penyerangan</td>
                         
                        </tr>
                        <tr>
                          <th scope="row">3</th>
                          <td><img src="mapping/hijau.png"></td>
                          <td>Pelanggaran</td>
                         
                        </tr>
                      </tbody>
                    </table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
                   
      </div>
      </div>
    <div id="map" style="width: 1100px; height: 490px" >
        </div>
        <div class="x_panel">
                <div class="x_title">
                  <h2>Recent Activities <small>Sessions</small></h2>
                  <ul class="nav navbar-right panel_toolbox">
                    <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                    </li>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                      <ul class="dropdown-menu" role="menu">
                        <li><a href="#">Settings 1</a>
                        </li>
                        <li><a href="#">Settings 2</a>
                        </li>
                      </ul>
                    </li>
                    <li><a class="close-link"><i class="fa fa-close"></i></a>
                    </li>
                  </ul>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <div class="dashboard-widget-content">

                    <ul class="list-unstyled timeline widget">
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <li>
                        <div class="block">
                          <div class="block_content">
                            <h2 class="title">
                                              <a>Who Needs Sundance When You’ve Got&nbsp;Crowdfunding?</a>
                                          </h2>
                            <div class="byline">
                              <span>13 hours ago</span> by <a>Jane Smith</a>
                            </div>
                            <p class="excerpt">Film festivals used to be do-or-die moments for movie makers. They were where you met the producers that could fund your project, and if the buyers liked your flick, they’d pay to Fast-forward and… <a>Read&nbsp;More</a>
                            </p>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
    </div>
    </div>
    </div>
    </body>
    </div>
  </div>
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

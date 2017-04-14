  <?php 
  $id=$_GET['id'];

  $cobareg = mysqli_query($koneksi, "SELECT * FROM user,provinsi WHERE user.id_prov=provinsi.id_prov AND nomor_pers = '$idmember'");
  $rowreg = mysqli_fetch_array($cobareg);

  $cobareg2 = mysqli_query($koneksi, "SELECT * FROM operasi,kategori WHERE operasi.id_kategori = kategori.id_kategori AND id_bencana = '$id'");
  $rowreg2 = mysqli_fetch_array($cobareg2);

  ?>  
    <body>
    <div class="container">
    <div class="row clearfix">
      <div class="col-md-12 column">
        
      </div>
    </div>
    <br>

    <br>
    <div class="row">
    <center>
      <div id="map" style="width: 1100px; height: 490px"></div></center>
       <?php
        $cobareg4 = mysqli_query($koneksi, "SELECT * FROM kebutuhan,operasi WHERE kebutuhan.id_bencana=operasi.id_bencana AND operasi.id_bencana='$id'");
                     
         ?>
           </br>
        <h4>Permintaan Bantuan</h4>
        <ul class="list-unstyled user_data">
                          <?php
                              while ($rowreg4 = mysqli_fetch_array($cobareg4)) {
                                 # code...
                              ?>
                            <li>
                              <p>Jenis Kebutuhan : <?php echo $rowreg4['jenis_kebutuhan']; ?></p>
                              <p>Detail Kebutuhan : <?php echo $rowreg4['nama_kebutuhan']; ?></p>
                              <?php
                              $req = $rowreg4['jumlah']; 
                              $trim = $rowreg4['jumlah_diterima'];
                              $totalpersen= $req-$trim;
                              echo "Baru di terima sejumlah ".$trim." ".$rowreg4['nama_kebutuhan']." dari ".$req." ".$rowreg4['nama_kebutuhan']." yang dibutuhkan";
                              ?>
                              <div class="progress progress_sm">
                                <div class="progress-bar bg-green" role="progressbar" data-transitiongoal="<?php echo $trim; ?>"></div>
                              </div>
                            </li>
                           
                          </ul>
                          <?php 
                           } 
                          ?>
      <div class="x_title">
      <br>
                    <h2>Detail kejadian <?php echo $rowreg2['nama_bencana'];?>, Pada Tanggal : <?php echo $rowreg2['tgl_input']; ?></h2>
                    <?php
                      $cobareg3 = mysqli_query($koneksi, "SELECT * FROM berita,operasi WHERE berita.id_bencana=operasi.id_bencana AND operasi.id_bencana='$id'");
                     
                     ?>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <ul class="list-unstyled timeline">
                    <?php
                            while ($rowreg3 = mysqli_fetch_array($cobareg3)) {
                               # code...
                            ?>
                      <li>
                        <div class="block">
                          <div class="tags">
                            <a href="" class="tag">
                              <span><?php echo $rowreg3['tag']; ?></span>
                            </a>
                          </div>
                          <div class="block_content">
                            <h2 class="title">
                                            <a><?php echo $rowreg3['judul']; ?> </a>
                                        </h2>
                            <div class="byline">
                              <span><?php echo $rowreg3['tanggal_berita']; ?></span> oleh <a><?php echo $row['pangkat']; ?> <?php echo $row['nama_pers']; ?></a>
                            </div>
                            <p class="excerpt"><?php echo $rowreg3['isi_berita']; ?></a>
                            </p>
                          </div>
                        </div>
                      </li>
                      <?php
                       } 
                            ?>
                    </ul>
  <div class="x_title">
                      <h2>Dokumentasi Lokasi Kejadian</h2>
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

                      <div class="row">

                        <p>Media gallery design emelents</p>

                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask">
                                <p>Your Text</p>
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p>Snow and Ice Incoming for the South</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask">
                                <p>Your Text</p>
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p>Snow and Ice Incoming for the South</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask">
                                <p>Your Text</p>
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p>Snow and Ice Incoming for the South</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask">
                                <p>Your Text</p>
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p>Snow and Ice Incoming for the South</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask">
                                <p>Your Text</p>
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p>Snow and Ice Incoming for the South</p>
                            </div>
                          </div>
                        </div>


                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask no-caption">
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p><strong>Image Name</strong>
                              </p>
                              <p>Snow and Ice Incoming</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask no-caption">
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p><strong>Image Name</strong>
                              </p>
                              <p>Snow and Ice Incoming</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask no-caption">
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p><strong>Image Name</strong>
                              </p>
                              <p>Snow and Ice Incoming</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask no-caption">
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p><strong>Image Name</strong>
                              </p>
                              <p>Snow and Ice Incoming</p>
                            </div>
                          </div>
                        </div>
                        <div class="col-md-55">
                          <div class="thumbnail">
                            <div class="image view view-first">
                              <img style="width: 100%; display: block;" src="images/media.jpg" alt="image" />
                              <div class="mask no-caption">
                                <div class="tools tools-bottom">
                                  <a href="#"><i class="fa fa-link"></i></a>
                                  <a href="#"><i class="fa fa-pencil"></i></a>
                                  <a href="#"><i class="fa fa-times"></i></a>
                                </div>
                              </div>
                            </div>
                            <div class="caption">
                              <p><strong>Image Name</strong>
                              </p>
                              <p>Snow and Ice Incoming</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                    </div>
                    </div>
                  </div>
      </div>
      <script>

  function initMap() {
    // var myLatLng = {"<?php echo $rowreg['lat']; ?>", "<?php echo $rowreg['lng']; ?>"};
    // var idLatLng = {"<?php echo $rowreg2['lat']; ?>", "<?php echo $rowreg2['lng']; ?>"};

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 9,
      center:  new google.maps.LatLng("<?php echo $rowreg['lat']; ?>", "<?php echo $rowreg['lng']; ?>")
    });

    var marker = new google.maps.Marker({
      position:  new google.maps.LatLng("<?php echo $rowreg2['lat']; ?>", "<?php echo $rowreg2['lng']; ?>"),
      map: map,
      title: "<?php echo $nama_bencana; ?>"
    });
  }

      </script>
      <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD9tCRG-KAV35C25bvJ527azwCvuQlu6ZA&signed_in=true&callback=initMap"></script>
    </body>

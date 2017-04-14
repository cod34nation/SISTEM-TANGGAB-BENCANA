<?php
$coba11 = mysqli_query($koneksi, "SELECT * FROM operasi,skala,kategori,provinsi,kota WHERE operasi.id_skala=skala.id_skala AND operasi.id_kategori=
kategori.id_kategori AND operasi.id_prov=provinsi.id_prov AND operasi.id_kota=kota.id_kota AND nomor_pers = '$idmember'");
$row11 = mysqli_fetch_array($coba11);

$coba12 = mysqli_query($koneksi, "SELECT * FROM kategori");

$coba13 = mysqli_query($koneksi, "SELECT * FROM provinsi");

$coba14 = mysqli_query($koneksi, "SELECT * FROM kota");

$coba15 = mysqli_query($koneksi, "SELECT * FROM skala");

 ?>
<!DOCTYPE html>
<html lang="en">
  
    <!-- Le styles -->
    <!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
    <link rel="stylesheet" href="css/peta.css">
    <style type="text/css">   body {
        padding-top: 0px;
        padding-bottom: 40px;
        
      }
      /* Custom container */
      .container-narrow {
        margin: 0 auto;
        max-width: 700px;
      }
      .container-narrow > hr {
        margin: 30px 0;
      }
      /* Main marketing message and sign up button */
      .jumbotron {
        margin: 60px 0;
        text-align: center;
      }
      .jumbotron h1 {
        font-size: 72px;
        line-height: 1;
      }
      .jumbotron .btn {
        font-size: 21px;
        padding: 14px 24px;
      }
      /* Supporting marketing content */
      .marketing {
        margin: 60px 0;
      }
      .marketing p + h4 {
        margin-top: 28px;
      }
      #mapsearch{
        margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
   background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 300px;
      }
</style>
 
    <title>Places Searchbox</title>
    <style>
      #target {
        width: 345px;
      }
    </style>
<script src="http://maps.google.com/maps/api/js?key=AIzaSyD9tCRG-KAV35C25bvJ527azwCvuQlu6ZA&libraries=places"
    type="text/javascript"></script>

 
    <div class="container-narrow">
      <hr>
       
               <div class='row'>
  <div class="span8">
  
  <div id="map"></div>
  
</div> <!--end -f span-->
<div class="span8">
<form   method="POST" id="form1" action="lokasi_action.php" class='form-horizontal'>
<br>
<input id="mapsearch" size="50" placeholder="Masukan Nama Kelurahan / Desa / Jalan">
<?php
// KODE UNTUK MENAMPILKAN PESAN STATUS
if(isset($_GET['status'])) {
  if($_GET['status'] == 0) {
    echo " Tambah Lokasi berhasil";
  } else {
    echo "Tambah Lokasi  gagal";
  }
}
?> 


   <div class="control-group">
    
    <label class="control-label" for="nama">No personel</label>
    <div class="controls">
      <input type="text" name='noktp' class='input-xlarge' required="required" value="<?php echo $idmember; ?>">
    </div>
    
    <label class="control-label" for="nama">Nama Operasi</label>
    <div class="controls">
      <input type="text" name='namabencana' class='input-xlarge' required="required">
    </div>
    
    <label class="control-label" for="nama">Keterangan</label>
    <div class="controls">
      <input type="text" name='keterangan' class='input-xlarge' required="required">
    </div>

    <label class="control-label" for="nama">Tanggal</label>
    <div class="controls">
      <input type="text" name='tanggalku' value="<?php echo date('d-m-Y');?>" class='input-xlarge'>
    </div>

    <label class="control-label" for="nama">Status</label>
    <div class="controls">
      <input type="text" name='status' class='input-xlarge' required="required">
    </div>

    <label class="control-label" for="nama">Skala</label>
    <div class="controls">
      <select class='input-xlarge' id="sel1" name="skala">
    <option>Skala</option>
    <?php
    while ($row15 = mysqli_fetch_array($coba15)) {
      # code...
      ?>

    <option value="<?php echo $row15['id_skala']; ?>"><?php echo $row15['nama_skala']; ?></option>
      <?php
    }
     ?>
  </select>
    </div>

    <label class="control-label" for="nama">Provinsi</label>
    <div class="controls">
      <select class='input-xlarge' id="sel1" name="provinsi">
    <option>Provinsi</option>
    <?php
    while ($row13 = mysqli_fetch_array($coba13)) {
      # code...
      ?>

    <option value="<?php echo $row13['id_prov']; ?>"><?php echo $row13['nama_prov']; ?></option>
      <?php
    }
     ?>
  </select>
    </div>

     <label class="control-label" for="nama">Kota</label>
    <div class="controls">
      <select class='input-xlarge' id="sel1" name="kota">
    <option>Kota</option>
    <?php
    while ($row14 = mysqli_fetch_array($coba14)) {
      # code...
      ?>

    <option value="<?php echo $row14['id_kota']; ?>"><?php echo $row14['nama_kota']; ?></option>
      <?php
    }
     ?>
  </select>
    </div>

    <label class="control-label" for="nama">Kategori</label>
    <div class="controls">
     <select class='input-xlarge' id="sel1" name="kategoriku">
    <option>BENCANA</option>
    <?php
    while ($row12 = mysqli_fetch_array($coba12)) {
      # code...
      ?>

    <option value="<?php echo $row12['id_kategori']; ?>"><?php echo $row12['nama_kategori']; ?></option>
      <?php
    }
     ?>
  </select>
    </div>

  </div>


   <div class="control-group">
   
    <div class="controls">
    <input type="hidden" name='lat' id='lat' class='input-xlarge' required="required">
    </div>
  </div>
  <div class="control-group">
    
    <div class="controls">
      <input type="hidden" name='lng' id='lng' class='input-xlarge' required="required">
    </div>
  </div>

  <div class="control-group">
    <div class="controls">
     
      <button type="submit" class="btn btn-success"> SUBMIT</button>
    </div>
  </div>
  </form>
</div>

<script src="coba.js"></script>
      </div>
              </div>
           
              </html>

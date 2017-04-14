 <?php
include ('inc/config.php');
//data dari lokasi

$nokt = $_POST['noktp'];
$namben=$_POST['namabencana'];
$ket=$_POST['keterangan'];
$tggl=$_POST['tanggalku'];
$status=$_POST['status'];
$skala=$_POST['skala'];
$provin=$_POST['provinsi'];
$kota=$_POST['kota'];
$katg=$_POST['kategoriku'];
$lat = $_POST['lat'];
$lng = $_POST['lng'];


// $aksi = $_POST['aksi'];
// $id = $_POST['id'];

// $sql = null;

$sql = "INSERT INTO operasi(id_bencana,id_skala,id_kategori,nomor_pers,nama_bencana,lng,lat,tgl_input,keterangan,gambar,status,id_prov,id_kota)
		VALUES(null,$skala,$katg,$nokt,'$namben','$lng','$lat','$tggl','$ket','','$status',$provin,$kota)";

$result = mysql_query($sql) or die(mysql_error());

//check if query successful
if($result) {
	header('location:index.php?page=lokasi_form&status=0');
} else {
	header('location:index.php?page=lokasi_form&status=0');
}
mysql_close();
?>

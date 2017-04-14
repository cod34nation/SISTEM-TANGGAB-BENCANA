<?php
include 'koneksi.php';
$id=$_GET['id'];
$bencana = mysqli_query($koneksi, "SELECT * FROM operasi  WHERE id_bencana =$id");

$data= mysqli_fetch_array($bencana);
$id_bencana=$data['id_bencana'];
$id_skala=$data['id_skala'];
$id_kategori=$data['id_kategori'];
$nomor_pers=$data['nomor_pers'];
$nama_bencana=$data['nama_bencana'];
$lng=$data['lng'];
$lat=$data['lat'];
$tgl_input=$data['tgl_input'];
$keterangan=$data['keterangan'];
$gambar=$data['gambar'];
$status=$data['status'];
$id_prov=$data['id_prov'];
$id_kota=$data['id_kota'];

$input="INSERT INTO arsip(id_bencana,id_skala,id_kategori,nomor_pers,nama_bencana,lng,lat,tgl_input
,keterangan,gambar,status,id_prov,id_kota) VALUES ('$id_bencana','$id_skala','$id_kategori',
'$nomor_pers','$nama_bencana',
'$lng','$lat','$tgl_input',
'$keterangan','$gambar',
'$status','$id_prov','$id_kota')";


if($koneksi->query($input)===true)
{
  
  $sql="Delete FROM operasi WHERE id_bencana=$id";
  $koneksi->query($sql);
  header('location:index.php');
   // redirects image view page after 5 seconds.
}
else
{
echo "error while inserting....";
}


?>

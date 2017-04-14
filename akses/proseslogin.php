<?php
session_start();
include 'koneksi.php';
$nopers = $_POST['nopers'];
$passm = $_POST['password'];


// query untuk mendapatkan record dari username
$hasil = mysqli_query($koneksi, "SELECT * FROM user WHERE nomor_pers = '$nopers' and password='$passm'");
$data = mysqli_fetch_array($hasil);
// cek kesesuaian password
if ($nopers == $data['nomor_pers'] && $passm==$data['password'])
{
    // menyimpan username dan level ke dalam session
    $_SESSION['nomor_pers'] = $data['nomor_pers'];  
    if ($data['level']==1) {
    	header('location:../mabes/index.php');
    } elseif ($data['level']==2) {
    	header('location:../kodam/index.html');
    } elseif ($data['level']==3) {
    	header('location:../korem/index.html');
    } elseif ($data['level']==4) {
    	header('location:../kodim/index.html');
    } elseif ($data['level']==5) {
    	header('location:../koramil/index.html');
    } else {
    	echo "No pers atau password salah / Tidak tersedia";
    }
}
else
        {
            echo "Gagal Login";
        }

?>
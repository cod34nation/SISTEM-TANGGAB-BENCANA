<?php
include 'koneksi.php';
$satuan = $_GET['satuan'];
if ($satuan==1) {
	# code...
	$kota = mysqli_query($koneksi,"SELECT * FROM kodam order by id_kodam");
	echo "<option>-- Pilih Kodam --</option>";
	while($kod = mysqli_fetch_array($kota)){
    echo "<option value=\"".$kod['id_kodam']."\">".$kod['nama_kodam']."</option>\n";
	}
}elseif ($satuan==2) {
	# code...
	$kota1 = mysqli_query($koneksi,"SELECT * FROM korem order by id_korem");
	echo "<option>-- Pilih Korem --</option>";
	while($kor = mysqli_fetch_array($kota1)){
    echo "<option value=\"".$kor['id_korem']."\">".$kor['nama']."</option>\n";
	}
}elseif ($satuan==3) {
	# code...
	$kota1 = mysqli_query($koneksi,"SELECT * FROM kodim order by id_kodim");
	echo "<option>-- Pilih Korem --</option>";
	while($kor = mysqli_fetch_array($kota1)){
    echo "<option value=\"".$kor['id_kodim']."\">".$kor['nama']."</option>\n";
	}
}
elseif ($satuan==4) {
	# code...
	$kota1 = mysqli_query($koneksi,"SELECT * FROM koramil order by id_koramil");
	echo "<option>-- Pilih Korem --</option>";
	while($kor = mysqli_fetch_array($kota1)){
    echo "<option value=\"".$kor['id_korem']."\">".$kor['nama']."</option>\n";
	}
}
?>

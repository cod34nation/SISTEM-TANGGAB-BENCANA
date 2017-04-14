<?php
require("phpsqlajax_dbinfo.php");

function parseToXML($htmlStr)
{
$xmlStr=str_replace('<','&lt;',$htmlStr);
$xmlStr=str_replace('>','&gt;',$xmlStr);
$xmlStr=str_replace('"','&quot;',$xmlStr);
$xmlStr=str_replace("'",'&#39;',$xmlStr);
$xmlStr=str_replace("&",'&amp;',$xmlStr);
return $xmlStr;
}

// Opens a connection to a MySQL server
$connection=mysql_connect ('localhost', $username, $password);
if (!$connection) {
  die('Not connected : ' . mysql_error());
}

// Set the active MySQL database
$db_selected = mysql_select_db($database, $connection);
if (!$db_selected) {
  die ('Can\'t use db : ' . mysql_error());
}

// Select all the rows in the markers table
$query = "SELECT * FROM operasi,kategori WHERE operasi.id_kategori = kategori.id_kategori";
$result = mysql_query($query);
if (!$result) {
  die('Invalid query: ' . mysql_error());
}

header("Content-type: text/xml");

// Start XML file, echo parent node
echo '<markers>';

// Iterate through the rows, printing XML nodes for each
while ($row = @mysql_fetch_assoc($result)){
  // ADD TO XML DOCUMENT NODE
  echo '<marker ';
  
  echo 'nama_bencana="' . parseToXML($row['nama_bencana']) . '" ';
  echo 'tgl_input="' . parseToXML($row['tgl_input']) . '" ';
  echo 'lat="' . $row['lat'] . '" ';
  echo 'lng="' . $row['lng'] . '" ';
  echo 'keterangan="' . $row['keterangan'] .'" ';
  echo 'nomor_pers="' . $row['nomor_pers'] .'" ';
  echo 'id_bencana="' . $row['id_bencana'] .'" ';
  echo 'status="' . $row['status'] .'" ';
  echo 'nama_kategori="' . $row['nama_kategori'] .'" ';

  echo '/>';
}

// End XML file
echo '</markers>';

?>

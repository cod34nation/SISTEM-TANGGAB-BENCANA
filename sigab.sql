-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jan 10, 2017 at 11:51 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sigab`
--

-- --------------------------------------------------------

--
-- Table structure for table `arsip`
--

CREATE TABLE `arsip` (
  `id_arsip` int(225) NOT NULL,
  `id_bencana` int(225) NOT NULL,
  `id_skala` int(225) NOT NULL,
  `id_kategori` int(225) NOT NULL,
  `nomor_pers` int(225) NOT NULL,
  `nama_bencana` varchar(225) NOT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  `tgl_input` varchar(225) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` text NOT NULL,
  `status` varchar(225) NOT NULL,
  `id_prov` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL,
  `tgl_arsip` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `arsip`
--

INSERT INTO `arsip` (`id_arsip`, `id_bencana`, `id_skala`, `id_kategori`, `nomor_pers`, `nama_bencana`, `lng`, `lat`, `tgl_input`, `keterangan`, `gambar`, `status`, `id_prov`, `id_kota`, `tgl_arsip`) VALUES
(1, 3, 3, 1, 14650018, 'Gunung salak meletus', 106.733, -6.74446, '09-10-2016', 'Gunung Meletus', '', 'belum di evakuasi', 12, 24, ''),
(2, 4, 2, 4, 14650018, 'Pelanggaran Tapal Batas', 115.085, 2.3727, '09-10-2016', 'Pelanggaran Tapal Batas', '', 'Segera di tindak', 21, 54, '');

-- --------------------------------------------------------

--
-- Table structure for table `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(225) NOT NULL,
  `id_bencana` int(225) NOT NULL,
  `judul` varchar(225) NOT NULL,
  `tanggal_berita` varchar(225) NOT NULL,
  `isi_berita` varchar(225) NOT NULL,
  `tag` varchar(225) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `berita`
--

INSERT INTO `berita` (`id_berita`, `id_bencana`, `judul`, `tanggal_berita`, `isi_berita`, `tag`, `foto`) VALUES
(1, 1, 'Pemantauan kawah hari pertama', '10/08/2016', 'Pemantauan kawah gunung merapi hari pertama berlangsung sangat tegang', 'info', '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(225) NOT NULL,
  `nama_kategori` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'bencana'),
(2, 'ancaman'),
(3, 'penyerangan'),
(4, 'pelanggaran');

-- --------------------------------------------------------

--
-- Table structure for table `kebutuhan`
--

CREATE TABLE `kebutuhan` (
  `id_kebutuhan` int(225) NOT NULL,
  `id_bencana` int(225) NOT NULL,
  `jenis_kebutuhan` varchar(225) NOT NULL,
  `nama_kebutuhan` varchar(225) NOT NULL,
  `jumlah` int(225) NOT NULL,
  `jumlah_diterima` int(225) NOT NULL,
  `keterangan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kebutuhan`
--

INSERT INTO `kebutuhan` (`id_kebutuhan`, `id_bencana`, `jenis_kebutuhan`, `nama_kebutuhan`, `jumlah`, `jumlah_diterima`, `keterangan`) VALUES
(1, 1, 'Transportasi', 'Truk TNI AD', 50, 25, 'Untuk evakuasi warga sekita merapi'),
(2, 1, 'Personel', 'Personel TNI dan Tim SAR', 300, 175, 'untuk pencarian korban serta evakuasi');

-- --------------------------------------------------------

--
-- Table structure for table `kodam`
--

CREATE TABLE `kodam` (
  `id_kodam` int(225) NOT NULL,
  `id_prov` int(225) NOT NULL,
  `nama_kodam` varchar(225) NOT NULL,
  `markas` varchar(225) NOT NULL,
  `wilayah _pertahanan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kodam`
--

INSERT INTO `kodam` (`id_kodam`, `id_prov`, `nama_kodam`, `markas`, `wilayah _pertahanan`) VALUES
(1, 1, 'Kodam Iskandar Muda', '', 'Banda Aceh'),
(2, 2, 'Kodam I/Bukit Barisan', '', 'Medan'),
(3, 6, 'Kodam II/Sriwijaya', '', 'Palembang'),
(4, 11, 'Kodam Jaya', '', 'Jakarta'),
(5, 12, 'Kodam III/Siliwangi', '', 'Bandung'),
(6, 13, 'Kodam IV/Diponegoro', '', 'Semarang'),
(7, 15, 'Kodam V/Brawijaya', '', 'Surabaya'),
(8, 20, 'Kodam VI/Mulawarman', '', 'Balikpapan'),
(9, 26, 'Kodam VII/Wirabuana', '', 'Makassar'),
(10, 17, 'Kodam IX/Udayana', '', 'Denpasar'),
(11, 22, 'Kodam XII/Tanjungpura', '', 'Pontianak'),
(12, 24, 'Kodam XIII/Merdeka Tahap Pembangunan', '', 'Manado'),
(13, 30, 'Kodam XVI/Pattimura', '', 'Ambon'),
(14, 33, 'Kodam XVII/Cenderawasih', '', 'Jayapura');

-- --------------------------------------------------------

--
-- Table structure for table `kodim`
--

CREATE TABLE `kodim` (
  `id_kodim` int(225) NOT NULL,
  `id_korem` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `markas` varchar(225) NOT NULL,
  `korem` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kodim`
--

INSERT INTO `kodim` (`id_kodim`, `id_korem`, `id_kota`, `nama`, `markas`, `korem`) VALUES
(1, 1, 1, 'Kodim 0101/Aceh Besar', '', 'Korem 012/Teuku Umar'),
(2, 1, 1, 'Kodim 0102/Pidie', '', 'Korem 011/Lilawangsa'),
(3, 1, 1, 'Kodim 0103/Aceh Utara', '', 'Korem 011/Lilawangsa'),
(4, 1, 1, 'Kodim 0104/Aceh Timur', '', 'Korem 011/Lilawangsa'),
(5, 1, 1, 'Kodim 0105/Aceh Barat', '', 'Korem 012/Teuku Umar'),
(6, 1, 1, 'Kodim 0106/Aceh Tengah', '', 'Korem 011/Lilawangsa'),
(7, 1, 1, 'Kodim 0107/Aceh Selatan', '', 'Korem 012/Teuku Umar'),
(8, 1, 1, 'Kodim 0108/Aceh Tenggara', '', 'Korem 011/Lilawangsa'),
(9, 1, 1, 'Kodim 0109/Aceh Singkil', '', 'Korem 012/Teuku Umar'),
(10, 1, 1, 'Kodim 0110/Aceh Barat Daya', '', 'Korem 012/Teuku Umar'),
(11, 1, 1, 'Kodim 0111/Bireuen', '', 'Korem 011/Lilawangsa'),
(12, 1, 1, 'Kodim 0112/Sabang', '', 'Korem 012/Teuku Umar'),
(13, 1, 1, 'Kodim 0113/Gayo Lues', '', 'Korem 011/Lilawangsa'),
(14, 1, 1, 'Kodim 0114/Aceh Jaya', '', 'Korem 012/Teuku Umar'),
(15, 1, 1, 'Kodim 0201/BS Kota Medan', 'Medan', 'Berdiri Sendiri'),
(16, 1, 1, 'Kodim 0203/Langkat', '', 'Korem 022/Pantai Timur'),
(17, 1, 1, 'Kodim 0204/Deli Serdang', 'Lubuk Pakam', 'Korem 022/Pantai Timur'),
(18, 1, 1, 'Kodim 0205/Tanah Karo', '', 'Korem 023/Kawal Samudera'),
(19, 1, 1, 'Kodim 0206/Dairi', '', 'Korem 023/Kawal Samudera'),
(20, 1, 1, 'Kodim 0207/Simalungun', '', 'Korem 022/Pantai Timur'),
(21, 1, 1, 'Kodim 0208/Asahan', '', 'Korem 022/Pantai Timur'),
(22, 1, 1, 'Kodim 0209/Labuhan Batu', '', 'Korem 022/Pantai Timur'),
(23, 1, 1, 'Kodim 0210/Tapanuli Utara', '', 'Korem 023/Kawal Samudera'),
(24, 1, 1, 'Kodim 0211/Tapanuli Tengah', 'Sibolga', 'Korem 023/Kawal Samudera'),
(25, 1, 1, 'Kodim 0212/Tapanuli Selatan', 'Padang Sidempuan', 'Korem 023/Kawal Samudera'),
(26, 1, 1, 'Kodim 0213/Nias', 'Gunung Stoli', 'Korem 023/Kawal Samudera'),
(27, 1, 1, 'Kodim 0301/Pekanbaru', 'Pekanbaru', 'Korem 031/Wira Bima'),
(28, 1, 1, 'Kodim 0302/Indragiri Hulu', 'Rengat', 'Korem 031/Wira Bima'),
(29, 1, 1, 'Kodim 0303/Bengkalis', 'Bengkalis', 'Korem 031/Wira Bima'),
(30, 1, 1, 'Kodim 0304/Agam', 'Lubuk Basung', 'Korem 032/Wira Braja'),
(31, 1, 1, 'Kodim 0305/Pasaman', 'Lubuk Sikaping', 'Korem 032/Wira Braja'),
(32, 1, 1, 'Kodim 0306/50 Kota', 'Sarilamak', 'Korem 032/Wira Braja'),
(33, 1, 1, 'Kodim 0307/Tanah Datar', 'Batusangkar', 'Korem 031/Wira Bima'),
(34, 1, 1, 'Kodim 0308/Pariaman', 'Pariaman', 'Korem 032/Wira Braja'),
(35, 1, 1, 'Kodim 0309/Solok', 'Arosuka', 'Korem 032/Wira Braja'),
(36, 1, 1, 'Kodim 0310/Sawah Lunto', 'Sawah Lunto', 'Korem 032/Wira Braja'),
(37, 1, 1, 'Kodim 0311/Pesisir Selatan', 'Painan', 'Korem 032/Wira Braja'),
(38, 1, 1, 'Kodim 0312/Padang', 'Padang', 'Korem 032/Wira Braja'),
(39, 1, 1, 'Kodim 0313/Kampar', 'Bangkinang', 'Korem 031/Wira Bima'),
(40, 1, 1, 'Kodim 0314/Indragiri Hilir', 'Tembilahan', 'Korem 031/Wira Bima'),
(41, 1, 1, 'Kodim 0315/Bintan', 'Tanjung Pinang', 'Korem 033/Wira Pratama'),
(42, 1, 1, 'Kodim 0316/Batam', 'Batam', 'Korem 033/Wira Pratama'),
(43, 1, 1, 'Kodim 0317/Tanjung Balai Karimun', 'Tanjung Balai Karimun', 'Korem 033/Wira Pratama'),
(44, 1, 1, 'Kodim 0318/Natuna', 'Ranai', 'Korem 033/Wira Pratama'),
(45, 1, 1, 'Kodim 0319/Mentawai', 'Siberut', 'Korem 032/Wira Braja'),
(46, 1, 1, 'Kodim 0320/Dumai', 'Dumai', 'Korem 031/Wira Bima'),
(47, 1, 1, 'Kodim 0501/Jakarta Pusat', 'Jakarta Pusat', 'Berdiri Sendiri'),
(48, 1, 1, 'Kodim 0502/Jakarta Utara', 'Jakarta Utara', 'Korem 052/Wijayakrama'),
(49, 1, 1, 'Kodim 0503/Jakarta Barat', 'Jakarta Pusat', 'Korem 052/Wijayakrama'),
(50, 1, 1, 'Kodim 0504/Jakarta Selatan', 'Jakarta Selatan', 'Korem 051/Wijayakarta'),
(51, 1, 1, 'Kodim 0505/Jakarta Timur', 'Jakarta Timur', 'Korem 051/Wijayakarta'),
(52, 1, 1, 'Kodim 0506/Tangerang', 'Tangerang', 'Korem 052/Wijayakrama'),
(53, 1, 1, 'Kodim 0507/Bekasi', 'Bekasi', 'Korem 051/Wijayakarta'),
(54, 1, 1, 'Kodim 0508/Depok', 'Depok', 'Korem 051/Wijayakarta'),
(55, 1, 1, 'Kodim 0601/Pandeglang', 'Pandeglang', 'Korem 064/Maulana Yusuf'),
(56, 1, 1, 'Kodim 0602/Serang', 'Serang', 'Korem 064/Maulana Yusuf'),
(57, 1, 1, 'Kodim 0603/Lebak', 'Lebak', 'Korem 064/Maulana Yusuf'),
(58, 1, 1, 'Kodim 0604/Karawang', 'Karawang', 'Korem 063/Sunan Gunung Jati'),
(59, 1, 1, 'Kodim 0605/Subang', 'Subang', 'Korem 063/Sunan Gunung Jati'),
(60, 1, 1, 'Kodim 0606/Kota Bogor', 'Kota Bogor', 'Korem 061/Surya Kencana'),
(61, 1, 1, 'Kodim 0607/Sukabumi', 'Sukabumi', 'Korem 061/Surya Kencana'),
(62, 1, 1, 'Kodim 0608/Cianjur', 'Cianjur', 'Korem 061/Surya Kencana'),
(63, 1, 1, 'Kodim 0609/Kabupaten Bandung', 'Kabupaten Bandung', 'Korem 062/Tarumanegara'),
(64, 1, 1, 'Kodim 0610/Sumedang', 'Sumedang', 'Korem 062/Tarumanegara'),
(65, 1, 1, 'Kodim 0611/Garut', 'Garut', 'Korem 062/Tarumanegara'),
(66, 1, 1, 'Kodim 0612/Tasikmalaya', 'Tasikmalaya', 'Korem 062/Tarumanegara'),
(67, 1, 1, 'Kodim 0613/Ciamis', 'Ciamis', 'Korem 062/Tarumanegara'),
(68, 1, 1, 'Kodim 0614/Kota Cirebon', 'Kota Cirebon', 'Korem 063/Sunan Gunung Jati'),
(69, 1, 1, 'Kodim 0615/Kuningan', 'Kuningan', 'Korem 063/Sunan Gunung Jati'),
(70, 1, 1, 'Kodim 0616/Indramayu', 'Indramayu', 'Korem 063/Sunan Gunung Jati'),
(71, 1, 1, 'Kodim 0617/Majalengka', 'Majalengka', 'Korem 063/Sunan Gunung Jati'),
(72, 1, 1, 'Kodim 0618/Kota Bandung', 'Kota Bandung', 'Berdiri Sendiri'),
(73, 1, 1, 'Kodim 0619/Purwakarta', 'Purwakarta', 'Korem 063/Sunan Gunung Jati'),
(74, 1, 1, 'Kodim 0620/Kabupaten Cirebon', 'Kabupaten Cirebon', 'Korem 063/Sunan Gunung Jati'),
(75, 1, 1, 'Kodim 0621/Kabupaten Bogor', 'Kabupaten Bogor', 'Korem 061/Surya Kencana'),
(76, 1, 1, 'Kodim 0622/Pelabuhan Ratu', '', 'Korem 061/Surya Kencana'),
(77, 1, 1, 'Kodim 0623/Cilegon', 'Cilegon', 'Korem 064/Maulana Yusuf'),
(78, 1, 1, 'Kodim 0701/Banyumas', 'Purwokerto', 'Korem 071/Wijaya Kusuma'),
(79, 1, 1, 'Kodim 0702/Purbalingga', 'Purbalingga', 'Korem 071/Wijaya Kusuma'),
(80, 1, 1, 'Kodim 0703/Cilacap', 'Cilacap', 'Korem 071/Wijaya Kusuma'),
(81, 1, 1, 'Kodim 0704/Banjarnegara', 'Banjarnegara', 'Korem 071/Wijaya Kusuma'),
(82, 1, 1, 'Kodim 0705/Magelang', 'Magelang', 'Korem 072/Pamungkas'),
(83, 1, 1, 'Kodim 0706/Temanggung', 'Temanggung', 'Korem 072/Pamungkas'),
(84, 1, 1, 'Kodim 0707/Wonosobo', 'Wonosobo', 'Korem 072/Pamungkas'),
(85, 1, 1, 'Kodim 0708/Purworejo', 'Purworejo', 'Korem 072/Pamungkas'),
(86, 1, 1, 'Kodim 0709/Kebumen', 'Kebumen', 'Korem 072/Pamungkas'),
(87, 1, 1, 'Kodim 0710/Pekalongan', 'Pekalongan', 'Korem 071/Wijaya Kusuma'),
(88, 1, 1, 'Kodim 0711/Pemalang', 'Pemalang', 'Korem 071/Wijaya Kusuma'),
(89, 1, 1, 'Kodim 0712/Tegal', 'Tegal', 'Korem 071/Wijaya Kusuma'),
(90, 1, 1, 'Kodim 0713/Brebes', 'Brebes', 'Korem 071/Wijaya Kusuma'),
(91, 1, 1, 'Kodim 0714/Salatiga', 'Salatiga', 'Korem 073/Makutarama'),
(92, 1, 1, 'Kodim 0715/Kendal', 'Kendal', 'Korem 073/Makutarama'),
(93, 1, 1, 'Kodim 0716/Demak', 'Demak', 'Korem 073/Makutarama'),
(94, 1, 1, 'Kodim 0717/Purwodadi', 'Grobogan', 'Korem 073/Makutarama'),
(95, 1, 1, 'Kodim 0718/Pati', 'Pati', 'Korem 073/Makutarama'),
(96, 1, 1, 'Kodim 0719/Jepara', 'Jepara', 'Korem 073/Makutarama'),
(97, 1, 1, 'Kodim 0720/Rembang', 'Rembang', 'Korem 073/Makutarama'),
(98, 1, 1, 'Kodim 0721/Blora', 'Blora', 'Korem 073/Makutarama'),
(99, 1, 1, 'Kodim 0722/Kudus', 'Kudus', 'Korem 073/Makutarama'),
(100, 1, 1, 'Kodim 0723/Klaten', 'Klaten', 'Korem 074/Warasastratama'),
(101, 1, 1, 'Kodim 0724/Boyolali', 'Boyolali', 'Korem 074/Warasastratama'),
(102, 1, 1, 'Kodim 0725/Sragen', 'Sragen', 'Korem 074/Warasastratama'),
(103, 1, 1, 'Kodim 0726/Sukoharjo', 'Sukoharjo', 'Korem 074/Warasastratama'),
(104, 1, 1, 'Kodim 0727/Karanganyar', 'Karanganyar', 'Korem 074/Warasastratama'),
(105, 1, 1, 'Kodim 0728/Wonogiri', 'Wonogiri', 'Korem 074/Warasastratama'),
(106, 1, 1, 'Kodim 0729/Bantul', 'Bantul', 'Korem 072/Pamungkas'),
(107, 1, 1, 'Kodim 0730/Gunung Kidul', 'Gunung Kidul', 'Korem 072/Pamungkas'),
(108, 1, 1, 'Kodim 0731/Kulon Progo', 'Kulon Progo', 'Korem 072/Pamungkas'),
(109, 1, 1, 'Kodim 0732/Sleman', 'Sleman', 'Korem 072/Pamungkas'),
(110, 1, 1, 'Kodim 0733/Kota Semarang', 'Kota Semarang', 'Berdiri Sendiri'),
(111, 1, 1, 'Kodim 0734/Yogyakarta', 'Yogyakarta', 'Korem 072/Pamungkas'),
(112, 1, 1, 'Kodim 0735/Surakarta', 'Surakarta', 'Korem 074/Warasastratama'),
(113, 1, 1, 'Kodim 0736/Batang', 'Batang', 'Korem 071/Wijaya Kusuma'),
(114, 1, 1, 'Kodim 0801/Pacitan', 'Pacitan', 'Korem 081/Dhirotsaha Jaya'),
(115, 1, 1, 'Kodim 0802/Ponorogo', 'Ponorogo', 'Korem 081/Dhirotsaha Jaya'),
(116, 1, 1, 'Kodim 0803/Madiun', 'Madiun', 'Korem 081/Dhirotsaha Jaya'),
(117, 1, 1, 'Kodim 0804/Magetan', 'Magetan', 'Korem 081/Dhirotsaha Jaya'),
(118, 1, 1, 'Kodim 0805/Ngawi', 'Ngawi', 'Korem 081/Dhirotsaha Jaya'),
(119, 1, 1, 'Kodim 0806/Trenggalek', 'Trenggalek', 'Korem 081/Dhirotsaha Jaya'),
(120, 1, 1, 'Kodim 0807/Tulungagung', 'Tulungagung', 'Korem 081/Dhirotsaha Jaya'),
(121, 1, 1, 'Kodim 0808/Blitar', 'Blitar', 'Korem 081/Dhirotsaha Jaya'),
(122, 1, 1, 'Kodim 0809/Kediri', 'Kediri', 'Korem 082/Citra Panca Yudha Jaya'),
(123, 1, 1, 'Kodim 0810/Nganjuk', 'Nganjuk', 'Korem 081/Dhirotsaha Jaya'),
(124, 1, 1, 'Kodim 0811/Tuban', 'Tuban', 'Korem 082/Citra Panca Yudha Jaya'),
(125, 1, 1, 'Kodim 0812/Lamongan', 'Lamongan', 'Korem 082/Citra Panca Yudha Jaya'),
(126, 1, 1, 'Kodim 0813/Bojonegoro', 'Bojonegoro', 'Korem 082/Citra Panca Yudha Jaya'),
(127, 1, 1, 'Kodim 0814/Jombang', 'Jombang', 'Korem 082/Citra Panca Yudha Jaya'),
(128, 1, 1, 'Kodim 0815/Mojokerto', 'Mojokerto', 'Korem 082/Citra Panca Yudha Jaya'),
(129, 1, 1, 'Kodim 0816/Sidoarjo', 'Sidoarjo', 'Korem 084 Bhaskara jaya'),
(130, 1, 1, 'Kodim 0817/Gresik', 'Gresik', 'Korem 084 Bhaskara Jaya'),
(131, 1, 1, 'Kodim 0818/Kabupaten Malang', 'Kab. Malang', 'Korem 083/Baladhika Jaya'),
(132, 1, 1, 'Kodim 0819/Pasuruan', 'Pasuruan', 'Korem 083/Baladhika Jaya'),
(133, 1, 1, 'Kodim 0820/Probolinggo', 'Probolinggo', 'Korem 083/Baladhika Jaya'),
(134, 1, 1, 'Kodim 0821/Lumajang', 'Lumajang', 'Korem 083/Baladhika Jaya'),
(135, 1, 1, 'Kodim 0822/Bondowoso', 'Bondowoso', 'Korem 083/Baladhika Jaya'),
(136, 1, 1, 'Kodim 0823/Situbondo', 'Situbondo', 'Korem 083/Baladhika Jaya'),
(137, 1, 1, 'Kodim 0824/Jember', 'Jember', 'Korem 083/Baladhika Jaya'),
(138, 1, 1, 'Kodim 0825/Banyuwangi', 'Banyuwangi', 'Korem 083/Baladhika Jaya'),
(139, 1, 1, 'Kodim 0826/Pamekasan', 'Pamekasan', 'Korem 084/Bhaskara Jaya'),
(140, 1, 1, 'Kodim 0827/Sumenep', 'Sumenep', 'Korem 084/Bhaskara Jaya'),
(141, 1, 1, 'Kodim 0828/Sampang', 'Sampang', 'Korem 084/Bhaskara Jaya'),
(142, 1, 1, 'Kodim 0829/Bangkalan', 'Bangkalan', 'Korem 084/Bhaskara Jaya'),
(143, 1, 1, 'Kodim 0830/Surabaya Utara', 'Surabaya Utara', 'Korem 084/Bhaskara Jaya'),
(144, 1, 1, 'Kodim 0831/Surabaya Timur', 'Surabaya Timur', 'Korem 084/Bhaskara Jaya'),
(145, 1, 1, 'Kodim 0832/Surabaya Selatan', 'Surabaya Selatan', 'Korem 084/Bhaskara Jaya'),
(146, 1, 1, 'Kodim 0833/Kota Malang', 'Kota Malang', 'Korem 083/Baladhika Jaya'),
(147, 1, 1, 'Kodim 0901/Samarinda', '', 'Korem 091/Aji Surya Natakesuma'),
(148, 1, 1, 'Kodim 0902/Tanjung Redep', '', 'Korem 091/Aji Surya Natakesuma'),
(149, 1, 1, 'Kodim 0903/Tanjung Selor', '', 'Korem 091/Aji Surya Natakesuma'),
(150, 1, 1, 'Kodim 0904/Tanah Grogot', '', 'Korem 091/Aji Surya Natakesuma'),
(151, 1, 1, 'Kodim 0905/Balikpapan', '', 'Korem 091/Aji Surya Natakesuma'),
(152, 1, 1, 'Kodim 0906/Tenggarong', '', 'Korem 091/Aji Surya Natakesuma'),
(153, 1, 1, 'Kodim 0907/Tarakan', '', 'Korem 091/Aji Surya Natakesuma'),
(154, 1, 1, 'Kodim 0908/Bontang', '', 'Korem 091/Aji Surya Natakesuma'),
(155, 1, 1, 'Kodim 0909/Sangata', '', 'Korem 091/Aji Surya Natakesuma'),
(156, 1, 1, 'Kodim 0910/Malinau', '', 'Korem 091/Aji Surya Natakesuma'),
(157, 1, 1, 'Kodim 0911/Nunukan', '', 'Korem 091/Aji Surya Natakesuma'),
(158, 1, 1, 'Kodim 1001/Amuntai', 'Amuntai', 'Korem 101/Antasari'),
(159, 1, 1, 'Kodim 1002/Barabai', 'Barabai', 'Korem 101/Antasari'),
(160, 1, 1, 'Kodim 1003/Kandangan', 'Kandangan', 'Korem 101/Antasari'),
(161, 1, 1, 'Kodim 1004/Kotabaru', 'Kotabaru', 'Korem 101/Antasari'),
(162, 1, 1, 'Kodim 1005/Marabahan', 'Marabahan', 'Korem 101/Antasari'),
(163, 1, 1, 'Kodim 1006/Martapura', 'Martapura', 'Korem 101/Antasari'),
(164, 1, 1, 'Kodim 1007/Banjarmasin', 'Banjarmasin', 'Korem 101/Antasari'),
(165, 1, 1, 'Kodim 1008/Tanjung', 'Tanjung', 'Korem 101/Antasari'),
(166, 1, 1, 'Kodim 1009/Pleihari', 'Pleihari', 'Korem 101/Antasari'),
(167, 1, 1, 'Kodim 1010/Rantau', 'Rantau', 'Korem 101/Antasari'),
(168, 1, 1, 'Kodim 1011/Kuala Kapuas', '', 'Korem 102/Panju Panjung'),
(169, 1, 1, 'Kodim 1012/Buntok', '', 'Korem 102/Panju Panjung'),
(170, 1, 1, 'Kodim 1013/Muara Teweh', '', 'Korem 102/Panju Panjung'),
(171, 1, 1, 'Kodim 1014/Pangkalan Bun', '', 'Korem 102/Panju Panjung'),
(172, 1, 1, 'Kodim 1015/Sampit', '', 'Korem 102/Panju Panjung'),
(173, 1, 1, 'Kodim 1016/Palangka Raya', '', 'Korem 102/Panju Panjung'),
(174, 1, 1, 'Kodim 1022/Tanah Bumbu', '', 'Korem 101/Antasari'),
(175, 1, 1, 'Kodim 1201/Mempawah', '', 'Korem 121/Alambhana Wanawai'),
(176, 1, 1, 'Kodim 1202/Sambas', '', 'Korem 121/Alambhana Wanawai'),
(177, 1, 1, 'Kodim 1203/Ketapang', '', 'Korem 121/Alambhana Wanawai'),
(178, 1, 1, 'Kodim 1204/Sanggau', '', 'Korem 121/Alambhana Wanawai'),
(179, 1, 1, 'Kodim 1205/Sintang', '', 'Korem 121/Alambhana Wanawai'),
(180, 1, 1, 'Kodim 1206/Putussibau', '', 'Korem 121/Alambhana Wanawai'),
(181, 1, 1, 'Kodim 1207/Pontianak', '', 'Korem 121/Alambhana Wanawai'),
(182, 1, 1, 'Kodim 1301/Sangihe Talaud', '', 'Korem 131/Santiago'),
(183, 1, 1, 'Kodim 1302/Minahasa', '', 'Korem 131/Santiago'),
(184, 1, 1, 'Kodim 1303/Bolaang Mongondow', '', 'Korem 131/Santiago'),
(185, 1, 1, 'Kodim 1304/Gorontalo', '', 'Korem 131/Santiago'),
(186, 1, 1, 'Kodim 1305/Buol-Tolitoli', 'Tolitoli', 'Korem 132/Tadulako'),
(187, 1, 1, 'Kodim 1306/Donggala', 'Donggala', 'Korem 132/Tadulako'),
(188, 1, 1, 'Kodim 1307/Poso', 'Poso', 'Korem 132/Tadulako'),
(189, 1, 1, 'Kodim 1308/Luwuk Banggai', 'Luwuk', 'Korem 132/Tadulako'),
(190, 1, 1, 'Kodim 1309/Manado', '', 'Korem 131/Santiago'),
(191, 1, 1, 'Kodim 1310/Bitung', '', 'Korem 131/Santiago'),
(192, 1, 1, 'Kodim 1401/Majene', '', 'Korem 142/Taroada Tarogau'),
(193, 1, 1, 'Kodim 1402/Polewali Mandar', '', 'Korem 142/Taroada Tarogau'),
(194, 1, 1, 'Kodim 1403/Sawerigading Palopo', '', 'Korem 142/Taroada Tarogau'),
(195, 1, 1, 'Kodim 1404/Pinrang', '', 'Korem 142/Taroada Tarogau'),
(196, 1, 1, 'Kodim 1405/Pare Pare', '', 'Korem 142/Taroada Tarogau'),
(197, 1, 1, 'Kodim 1406/Wajo', '', 'Korem 141/Toddopuli'),
(198, 1, 1, 'Kodim 1407/Bone', '', 'Korem 141/Toddopuli'),
(199, 1, 1, 'Kodim 1408/BS Makassar', '', 'Berdiri Sendiri'),
(200, 1, 1, 'Kodim 1409/Gowa', '', 'Korem 141/Toddopuli'),
(201, 1, 1, 'Kodim 1410/Bantaeng', '', 'Korem 141/Toddopuli'),
(202, 1, 1, 'Kodim 1411/Bulukumba', '', 'Korem 141/Toddopuli'),
(203, 1, 1, 'Kodim 1412/Kolaka', '', 'Korem 143/Haluoleo'),
(204, 1, 1, 'Kodim 1413/Buton', '', 'Korem 143/Haluoleo'),
(205, 1, 1, 'Kodim 1414/Tanatoraja', '', 'Korem 142/Taroada Tarogau'),
(206, 1, 1, 'Kodim 1415/Selayar', '', 'Korem 141/Toddopuli'),
(207, 1, 1, 'Kodim 1416/Raha', '', 'Korem 143/Haluoleo'),
(208, 1, 1, 'Kodim 1417/Kendari', '', 'Korem 143/Haluoleo'),
(209, 1, 1, 'Kodim 1418/Mamuju', '', 'Korem 142/Taroada Tarogau'),
(210, 1, 1, 'Kodim 1419/Enrekang', '', 'Korem 142/Taroada Tarogau'),
(211, 1, 1, 'Kodim 1420/Sidrap', '', 'Korem 142/Taroada Tarogau'),
(212, 1, 1, 'Kodim 1421/Pangkep', '', 'Korem 142/Taroada Tarogau'),
(213, 1, 1, 'Kodim 1422/Maros', '', 'Korem 141/Toddopuli'),
(214, 1, 1, 'Kodim 1423/Soppeng', '', 'Korem 141/Toddopuli'),
(215, 1, 1, 'Kodim 1424/Sinjai', '', 'Korem 141/Toddopuli'),
(216, 1, 1, 'Kodim 1425/Jeneponto', '', 'Korem 141/Toddopuli'),
(217, 1, 1, 'Kodim 1426/Takalar', '', 'Korem 141/Toddopuli'),
(218, 1, 1, 'Kodim 1501/Ternate', '', 'Korem 152/Baabullah'),
(219, 1, 1, 'Kodim 1502/Masohi', '', 'Korem 151/Binaya'),
(220, 1, 1, 'Kodim 1503/Tual', '', 'Korem 151/Binaya'),
(221, 1, 1, 'Kodim 1504/Ambon', '', 'Korem 151/Binaya'),
(222, 1, 1, 'Kodim 1505/Tidore', '', 'Korem 152/Baabullah'),
(223, 1, 1, 'Kodim 1506/Namlea', '', 'Korem 151/Binaya'),
(224, 1, 1, 'Kodim 1507/Saumlaki', '', 'Korem 151/Binaya'),
(225, 1, 1, 'Kodim 1508/Tobelo', '', 'Korem 152/Baabullah'),
(226, 1, 1, 'Kodim 1509/Labuha', '', 'Korem 152/Baabullah'),
(227, 1, 1, 'Kodim 1601/Sumba Timur', 'Waingapu', 'Korem 161/Wira Sakti'),
(228, 1, 1, 'Kodim 1602/Ende', 'Ende', 'Korem 161/Wira Sakti'),
(229, 1, 1, 'Kodim 1603/Sikka', 'Maumere', 'Korem 161/Wira Sakti'),
(230, 1, 1, 'Kodim 1604/Kupang dan Rotendao', 'Kupang', 'Korem 161/Wira Sakti'),
(231, 1, 1, 'Kodim 1605/Belu', 'Belu', 'Korem 161/Wira Sakti'),
(232, 1, 1, 'Kodim 1606/Lombok Barat', 'Mataram', 'Korem 162/Wira Bhakti'),
(233, 1, 1, 'Kodim 1607/Sumbawa', 'Sumbawa Besar', 'Korem 162/Wira Bhakti'),
(234, 1, 1, 'Kodim 1608/Bima', 'Bima', 'Korem 162/Wira Bhakti'),
(235, 1, 1, 'Kodim 1609/Buleleng', 'Buleleng', 'Korem 163/Wira Satya'),
(236, 1, 1, 'Kodim 1610/Klungkung', 'Klungkung', 'Korem 163/Wira Satya'),
(237, 1, 1, 'Kodim 1611/Badung', 'Badung', 'Korem 163/Wira Satya'),
(238, 1, 1, 'Kodim 1612/Manggarai', 'Ruteng', 'Korem 161/Wira Sakti'),
(239, 1, 1, 'Kodim 1613/Sumba Barat', 'Tambolaka', 'Korem 161/Wira Sakti'),
(240, 1, 1, 'Kodim 1614/Dompu', 'Dompu', 'Korem 162/Wira Bhakti'),
(241, 1, 1, 'Kodim 1615/Lombok Timur', 'Lombok Timur', 'Korem 162/Wira Bhakti'),
(242, 1, 1, 'Kodim 1616/Gianyar', 'Gianyar', 'Korem 163/Wira Satya'),
(243, 1, 1, 'Kodim 1617/Jembrana', 'Negara', 'Korem 163/Wira Satya'),
(244, 1, 1, 'Kodim 1618/Timor Tengah Utara', 'Kefamenanu', 'Korem 161/Wira Sakti'),
(245, 1, 1, 'Kodim 1619/Tabanan', 'Tabanan', 'Korem 163/Wira Satya'),
(246, 1, 1, 'Kodim 1620/Lombok Tengah', 'Praya', 'Korem 162/Wira Bhakti'),
(247, 1, 1, 'Kodim 1621/Timor Tengah Selatan', 'So''e', 'Korem 161/Wira Sakti'),
(248, 1, 1, 'Kodim 1622/Alor', 'Kalabahi', 'Korem 161/Wira Sakti'),
(249, 1, 1, 'Kodim 1623/Karangasem', 'Karengasem', 'Korem 163/Wira Satya'),
(250, 1, 1, 'Kodim 1624/Flores Timur dan Lembata', 'Larantuka', 'Korem 161/Wira Sakti'),
(251, 1, 1, 'Kodim 1625/Ngada', 'Bajawa', 'Korem 161/Wira Sakti'),
(252, 1, 1, 'Kodim 1626/Bangli', 'Bangli', 'Korem 163/Wira Satya'),
(253, 1, 1, 'Kodim 1627/Rote Ndao', 'Ba''a', 'Korem 161/Wira Sakti'),
(254, 1, 1, 'Kodim 1628/Baucau', '', 'ex-Korem 164/Wira Dharma'),
(255, 1, 1, 'Kodim 1629/Los Palos', '', 'ex-Korem 164/Wira Dharma'),
(256, 1, 1, 'Kodim 1630/Viqueque', '', 'ex-Korem 164/Wira Dharma'),
(257, 1, 1, 'Kodim 1631/Manatuto', '', 'ex-Korem 164/Wira Dharma'),
(258, 1, 1, 'Kodim 1632/Aileu', '', 'ex-Korem 164/Wira Dharma'),
(259, 1, 1, 'Kodim 1633/Ainaro', '', 'ex-Korem 164/Wira Dharma'),
(260, 1, 1, 'Kodim 1634/Manufahi', '', 'ex-Korem 164/Wira Dharma'),
(261, 1, 1, 'Kodim 1635/Bobonaro', '', 'ex-Korem 164/Wira Dharma'),
(262, 1, 1, 'Kodim 1636/Maliana', '', 'ex-Korem 164/Wira Dharma'),
(263, 1, 1, 'Kodim 1637/Ermera', '', 'ex-Korem 164/Wira Dharma');

-- --------------------------------------------------------

--
-- Table structure for table `koramil`
--

CREATE TABLE `koramil` (
  `id_koramil` int(225) NOT NULL,
  `id_kodim` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `wilayah_komando` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `koramil`
--

INSERT INTO `koramil` (`id_koramil`, `id_kodim`, `id_kota`, `nama`, `alamat`, `wilayah_komando`) VALUES
(1, 130, 104, 'Koramil Gresik', 'Jl. Proklamasi 62 Gresik', 'Gresik'),
(2, 130, 104, 'Koramil Kebomas', 'Jl. Dr Wahidin Sudirohusodo Gresik', 'Gresik'),
(3, 130, 104, 'Koramil Manyar', 'Jl. Raya Sukomulyo Gresik', 'Gresik'),
(4, 130, 104, 'Koramil Bungah', 'Jl. Raya Bungah (Abar-abir)', 'Gresik'),
(5, 130, 104, 'Koramil Sidayu', 'Jl. Badrun 9 Sidayu Gresik', 'Gresik'),
(6, 130, 104, 'Koramil Panceng', 'Jl. Raya Panceng Gresik', 'Gresik'),
(7, 130, 104, 'Koramil Ujung Pangkah', 'Jl. Ujung Pangkah Gresik', 'Gresik'),
(8, 130, 104, 'Koramil Dukun', 'Jl. Raya Dukun Gresik', 'Gresik'),
(9, 130, 104, 'Koramil Duduk Sampeyan', 'Jl. Raya Duduk Sampean Gresik', 'Gresik'),
(10, 130, 104, 'Koramil Cerme', 'Jl. Jurit 11 Cerme Gresik', 'Gresik'),
(11, 130, 104, 'Koramil Benjeng', 'Jl. Raya Benjeng 4 Benjeng Gresik', 'Gresik'),
(12, 130, 104, 'Koramil Balongpanggang', 'Jl. Kedungpring Balongpanggang Gresik', 'Gresik'),
(13, 130, 104, 'Koramil Driyorejo', 'Jl. Driyorejo Gresik', 'Gresik'),
(14, 130, 104, 'Koramil Menganti', 'Jl. Raya Kepatihan Menganti Gresik', 'Gresik'),
(15, 130, 104, 'Koramil Wringinanom', 'Jl. Raya Wringinanom Gresik', 'Gresik'),
(16, 130, 104, 'Koramil Kedamean', 'Jl. Raya Kedamean 57 Gresik', 'Gresik'),
(17, 130, 104, 'Koramil Sangkapura', 'Jl. Pahlawan 7 Sangkapura Bawean Gresik', 'Gresik'),
(18, 130, 104, 'Koramil Tambak', 'Jl. Raya Pekalongan Tambak Bawean Gresik', 'Gresik');

-- --------------------------------------------------------

--
-- Table structure for table `korem`
--

CREATE TABLE `korem` (
  `id_korem` int(225) NOT NULL,
  `id_kodam` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL,
  `nama` varchar(225) NOT NULL,
  `markas` varchar(225) NOT NULL,
  `komando` varchar(225) NOT NULL,
  `keterangan` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korem`
--

INSERT INTO `korem` (`id_korem`, `id_kodam`, `id_kota`, `nama`, `markas`, `komando`, `keterangan`) VALUES
(1, 1, 3, 'Komando resort militer 011/Lilawangsa', 'Lhokseumawe', 'Kodam Iskandar Muda', 'Type B'),
(2, 1, 4, 'Komando resort militer 012/Teuku Umar', 'Meulaboh', 'Kodam Iskandar Muda', 'Type B'),
(3, 2, 102, 'Komando resort militer 022/Pantai Timur', 'Pematangsiantar', 'Kodam I/Bukit Barisan', 'Type B'),
(4, 2, 96, 'Komando resort militer 023/Kawal Samudera', 'Sibolga', 'Kodam I/Bukit Barisan', 'Type B'),
(5, 2, 72, 'Komando resort militer 031/Wirabima', 'Pekanbaru', 'Kodam I/Bukit Barisan', 'Type A'),
(6, 2, 84, 'Komando resort militer 032/Wirabraja', 'Padang', 'Kodam I/Bukit Barisan', 'Type B'),
(7, 2, 57, 'Komando resort militer 033/Wirapratama', 'Tanjungpinang', 'Kodam I/Bukit Barisan', 'Type B'),
(8, 3, 13, 'Komando resort militer 041/Garuda Emas', 'Bengkulu', 'Kodam II/Sriwijaya', 'Type B'),
(9, 3, 21, 'Komando resort militer 042/Garuda Putih', 'Jambi', 'Kodam II/Sriwijaya', 'Type B'),
(10, 3, 58, 'Komando resort militer 043/Garuda Hitam', 'Bandar Lampung', 'Kodam II/Sriwijaya', 'Type B'),
(11, 3, 92, 'Komando resort militer 044/Garuda Dempo', 'Palembang', 'Kodam II/Sriwijaya', 'Type B'),
(12, 3, 8, 'Komando resort militer 045/Garuda Jaya', 'Pangkalpinang', 'Kodam II/Sriwijaya', 'Type B'),
(13, 4, 23, 'Komando resort militer 051/Wijayakarta', 'Bekasi', 'Kodam Jaya', 'Type B'),
(14, 4, 12, 'Komando resort militer 052/Wijayakrama', 'Tangerang', 'Kodam Jaya', 'Type B'),
(15, 5, 24, 'Komando resort militer 061/Suryakencana', 'Bogor', 'Kodam III/Siliwangi', 'Type B'),
(17, 5, 26, 'Komando resort militer 063/Sunan Gunung Jati', 'Cirebon', 'Kodam III/Siliwangi', 'Type B'),
(18, 5, 10, 'Komando resort militer 064/Maulana Yusuf', 'Serang', 'Kodam III/Siliwangi', 'Type B'),
(19, 6, 33, 'Komando resort militer 071/Wijayakusuma', 'Purwokerto', 'Kodam IV/Diponegoro', 'Type B'),
(20, 6, 101, 'Komando resort militer 072/Pamungkas', 'Yogyakarta', 'Kodam IV/Diponegoro', 'Type A'),
(21, 6, 34, 'Komando resort militer 073/Makutarama', 'Salatiga', 'Kodam IV/Diponegoro', 'Type B'),
(22, 6, 36, 'Komando resort militer 074/Warastratama', 'Surakarta', 'Kodam IV/Diponegoro', 'Type B'),
(23, 7, 41, 'Komando resort militer 081/Dhirotsaha Jaya', 'Madiun', 'Kodam V/Brawijaya', 'Type B'),
(24, 7, 43, 'Komando resort militer 082/Panca Yudha Jaya', 'Mojokerto', 'Kodam V/Brawijaya', 'Type B'),
(25, 7, 42, 'Komando resort militer 083/Bhaladika Jaya', 'Malang', 'Kodam V/Brawijaya', 'Type B'),
(26, 1, 1, 'Komando resort militer 084/Bhaskara Jaya', 'Surabaya', 'Kodam V/Brawijaya', 'Type B'),
(27, 1, 1, 'Komando resort militer 091/Aji Surya Natakesuma', 'Samarinda', 'Kodam VI/Mullawarman', 'Type B'),
(28, 1, 1, 'Komando resort militer 101/Antasari', 'Banjarmasin', 'Kodam VI/Mullawarman', 'Type B'),
(29, 1, 1, 'Komando resort militer 102/Panju Panjung', 'Palangkaraya', 'Kodam XII/Tanjungpura', 'Type B'),
(30, 1, 1, 'Komando resort militer 121/Alambhana Wanawai', 'Pontianak', 'Kodam XII/Tanjungpura', 'Type B'),
(31, 1, 1, 'Komando resort militer 131/Santiago', 'Manado', 'Kodam VII/Wirabuana', 'Type A'),
(32, 1, 1, 'Komando resort militer 132/Tadulako', 'Palu', 'Kodam VII/Wirabuana', 'Type B'),
(33, 1, 1, 'Komando resort militer 141/Todopuli', 'Bone', 'Kodam VII/Wirabuana', 'Type B'),
(34, 1, 1, 'Komando resort militer 142/Taroada Tarogau', 'Pare-Pare', 'Kodam VII/Wirabuana', 'Type B'),
(35, 1, 1, 'Komando resort militer 143/Haluoleo', 'Kendari', 'Kodam VII/Wirabuana', 'Type B'),
(36, 1, 1, 'Komando resort militer 161/Wirasakti', 'Kupang', 'Kodam IX/Udayana', 'Type A'),
(37, 1, 1, 'Komando resort militer 162/Wirabhakti', 'Mataram', 'Kodam IX/Udayana', 'Type B'),
(38, 1, 1, 'Komando resort militer 163/Wirasatya', 'Denpasar', 'Kodam IX/Udayana', 'Type B'),
(39, 1, 1, 'Komando resort militer 151/Maluku Selatan', 'Ambon', 'Kodam XVI/Pattimura', 'Type B'),
(40, 1, 1, 'Komando resort militer 152/Maluku Utara', 'Ternate', 'Kodam XVI/Pattimura', 'Type B'),
(41, 1, 1, 'Komando resort militer 171/Praja Wira Tama', 'Sorong', 'Kodam XVII/Cenderawasih', 'Type A'),
(42, 1, 1, 'Komando resort militer 172/Praja Wira Yakti', 'Jayapura', 'Kodam XVII/Cenderawasih', 'Type B'),
(43, 1, 1, 'Komando resort militer 173/Praja Wira Braja', 'Biak', 'Kodam XVII/Cenderawasih', 'Type A'),
(44, 1, 1, 'Komando resort militer 174/Anim Ti Waninggap', 'Merauke', 'Kodam XVII/Cenderawasih', 'Type A');

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE `kota` (
  `id_kota` int(225) NOT NULL,
  `id_prov` int(225) NOT NULL,
  `nama_kota` varchar(225) NOT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kota`
--

INSERT INTO `kota` (`id_kota`, `id_prov`, `nama_kota`, `lng`, `lat`) VALUES
(1, 1, 'Banda Aceh', 0, 0),
(2, 1, 'Langsa', 0, 0),
(3, 1, 'Lhokseumawe', 0, 0),
(4, 1, 'Meulaboh', 0, 0),
(5, 1, 'Sabang', 0, 0),
(6, 1, 'Subulussalam', 0, 0),
(7, 17, 'Denpasar', 0, 0),
(8, 9, 'Pangkalpinang', 0, 0),
(9, 12, 'Cilegon', 0, 0),
(10, 16, 'Serang', 0, 0),
(11, 12, 'Tangerang Selatan', 0, 0),
(12, 12, 'Tangerang', 0, 0),
(13, 7, 'Bengkulu', 0, 0),
(14, 28, 'Gorontalo', 0, 0),
(15, 11, 'Kota Administrasi Jakarta Barat', 0, 0),
(16, 11, 'Kota Administrasi Jakarta Pusat', 0, 0),
(17, 11, 'Kota Administrasi Jakarta Selatan', 0, 0),
(18, 11, 'Kota Administrasi Jakarta Timur', 0, 0),
(19, 11, 'Kota Administrasi Jakarta Utara', 0, 0),
(20, 20, 'Sungai Penuh', 0, 0),
(21, 5, 'Jambi', 0, 0),
(22, 12, 'Bandung', 0, 0),
(23, 12, 'Bekasi', 0, 0),
(24, 12, 'Bogor', 0, 0),
(25, 12, 'Cimahi', 0, 0),
(26, 12, 'Cirebon', 0, 0),
(27, 12, 'Depok', 0, 0),
(28, 12, 'Sukabumi', 0, 0),
(29, 12, 'Tasikmalaya', 0, 0),
(30, 12, 'Banjar', 0, 0),
(31, 13, 'Magelang', 0, 0),
(32, 13, 'Pekalongan', 0, 0),
(33, 15, 'Purwokerto', 0, 0),
(34, 14, 'Salatiga', 0, 0),
(35, 14, 'Semarang', 0, 0),
(36, 14, 'Surakarta', 0, 0),
(37, 15, 'Tegal', 0, 0),
(38, 15, 'Batu', 0, 0),
(39, 15, 'Blitar', 0, 0),
(40, 15, 'Kediri', 0, 0),
(41, 15, 'Madiun', 0, 0),
(42, 15, 'Malang', 0, 0),
(43, 15, 'Mojokerto', 0, 0),
(44, 15, 'Pasuruan', 0, 0),
(45, 15, 'Probolinggo', 0, 0),
(46, 15, 'Surabaya', 0, 0),
(47, 20, 'Pontianak', 0, 0),
(48, 12, 'Singkawang', 0, 0),
(49, 22, 'Banjarbaru', 0, 0),
(50, 22, 'Banjarmasin', 0, 0),
(51, 21, 'Palangkaraya', 0, 0),
(52, 23, 'Balikpapan', 0, 0),
(53, 23, 'Bontang', 0, 0),
(54, 23, 'Samarinda', 0, 0),
(55, 23, 'Tarakan', 0, 0),
(56, 10, 'Batam', 0, 0),
(57, 10, 'Tanjungpinang', 0, 0),
(58, 8, 'Bandar Lampung', 0, 0),
(59, 8, 'Kotabumi', 0, 0),
(60, 8, 'Liwa', 0, 0),
(61, 8, 'Metro', 0, 0),
(62, 31, 'Ternate', 0, 0),
(63, 31, 'Tidore Kepulauan', 0, 0),
(64, 30, 'Ambon', 0, 0),
(65, 30, 'Tual', 0, 0),
(66, 19, 'Bima', 0, 0),
(67, 18, 'Mataram', 0, 0),
(68, 19, 'Kupang', 0, 0),
(69, 32, 'Sorong', 0, 0),
(70, 33, 'Jayapura', 0, 0),
(71, 4, 'Dumai', 0, 0),
(72, 4, 'Pekanbaru', 0, 0),
(73, 26, 'Makassar', 0, 0),
(74, 26, 'Palopo', 0, 0),
(75, 26, 'Parepare', 0, 0),
(76, 25, 'Palu', 0, 0),
(77, 27, 'Bau-Bau', 0, 0),
(78, 27, 'Kendari', 0, 0),
(79, 24, 'Bitung', 0, 0),
(80, 24, 'Kotamobagu', 0, 0),
(81, 24, 'Manado', 0, 0),
(82, 24, 'Tomohon', 0, 0),
(83, 3, 'Bukittinggi', 0, 0),
(84, 3, 'Padang', 0, 0),
(85, 3, 'Padangpanjang', 0, 0),
(86, 3, 'Pariaman', 0, 0),
(87, 3, 'Payakumbuh', 0, 0),
(88, 3, 'Sawahlunto', 0, 0),
(89, 3, 'Solok', 0, 0),
(90, 6, 'Lubuklinggau', 0, 0),
(91, 6, 'Pagaralam', 0, 0),
(92, 6, 'Palembang', 0, 0),
(93, 6, 'Prabumulih', 0, 0),
(94, 6, 'Binjai', 0, 0),
(95, 6, 'Medan', 0, 0),
(96, 6, 'Padang Sidempuan', 0, 0),
(97, 6, 'Pematangsiantar', 0, 0),
(98, 6, 'Sibolga', 0, 0),
(99, 6, 'Tanjungbalai', 0, 0),
(100, 6, 'Tebingtinggi', 0, 0),
(101, 14, 'Yogyakarta', 0, 0),
(102, 2, 'Pematangsiantar', 0, 0),
(104, 15, 'Gresik', 0, 0),
(105, 12, 'Garut', 107.907, -7.2307);

-- --------------------------------------------------------

--
-- Table structure for table `operasi`
--

CREATE TABLE `operasi` (
  `id_bencana` int(225) NOT NULL,
  `id_skala` int(225) NOT NULL,
  `id_kategori` int(225) NOT NULL,
  `nomor_pers` int(225) NOT NULL,
  `nama_bencana` varchar(225) NOT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL,
  `tgl_input` varchar(225) NOT NULL,
  `keterangan` text NOT NULL,
  `gambar` text NOT NULL,
  `status` varchar(225) NOT NULL,
  `id_prov` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `operasi`
--

INSERT INTO `operasi` (`id_bencana`, `id_skala`, `id_kategori`, `nomor_pers`, `nama_bencana`, `lng`, `lat`, `tgl_input`, `keterangan`, `gambar`, `status`, `id_prov`, `id_kota`) VALUES
(1, 3, 1, 14650018, 'Gunung meletus', 108.065, -7.26494, '08/10/2016', 'Gunung Meletus', '', 'Evakuasi', 12, 105);

-- --------------------------------------------------------

--
-- Table structure for table `provinsi`
--

CREATE TABLE `provinsi` (
  `id_prov` int(225) NOT NULL,
  `nama_prov` varchar(225) NOT NULL,
  `lng` float NOT NULL,
  `lat` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinsi`
--

INSERT INTO `provinsi` (`id_prov`, `nama_prov`, `lng`, `lat`) VALUES
(1, 'Aceh\r', 96.8976, 4.47601),
(2, 'Sumatera Utara\r', 99.1666, 2.20319),
(3, 'Sumatera Barat\r', 0, 0),
(4, 'Riau\r', 0, 0),
(5, 'Jambi\r', 0, 0),
(6, 'Sumatera Selatan\r', 0, 0),
(7, 'Bengkulu\r', 0, 0),
(8, 'Lampung\r', 0, 0),
(9, 'Kepulauan Bangka Belitung\r', 0, 0),
(10, 'Kepulauan Riau\r', 0, 0),
(11, 'DKI Jakarta', 0, 0),
(12, 'Jawa Barat\r', 107.489, -6.84473),
(13, 'Jawa Tengah\r', 0, 0),
(14, 'DI Yogyakarta', 0, 0),
(15, 'Jawa Timur\r', 112.349, -7.72306),
(16, 'Banten\r', 0, 0),
(17, 'Bali\r', 0, 0),
(18, 'Nusa Tenggara Barat\r', 0, 0),
(19, 'Nusa Tenggara Timur\r', 0, 0),
(20, 'Kalimantan Barat\r', 0, 0),
(21, 'Kalimantan Tengah\r', 0, 0),
(22, 'Kalimantan Selatan\r', 0, 0),
(23, 'Kalimantan Timur\r', 0, 0),
(24, 'Sulawesi Utara\r', 0, 0),
(25, 'Sulawesi Tengah\r', 0, 0),
(26, 'Sulawesi Selatan\r', 0, 0),
(27, 'Sulawesi Tenggara\r', 0, 0),
(28, 'Gorontalo\r', 0, 0),
(29, 'Sulawesi Barat\r', 0, 0),
(30, 'Maluku\r', 0, 0),
(31, 'Maluku Utara\r', 0, 0),
(32, 'Papua Barat\r', 0, 0),
(33, 'Papua\r', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `skala`
--

CREATE TABLE `skala` (
  `id_skala` int(225) NOT NULL,
  `nama_skala` varchar(225) NOT NULL,
  `prioritas` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `skala`
--

INSERT INTO `skala` (`id_skala`, `nama_skala`, `prioritas`) VALUES
(1, 'Daerah', 'Setelah Provinsi'),
(2, 'Provinsi', 'Setelah Pusat'),
(3, 'Nasional', 'Utama');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `nomor_pers` int(225) NOT NULL,
  `id_dinas` int(225) NOT NULL,
  `nama_pers` varchar(225) NOT NULL,
  `pangkat` varchar(225) NOT NULL,
  `password` varchar(225) NOT NULL,
  `level` int(225) NOT NULL,
  `id_prov` int(225) NOT NULL,
  `id_kota` int(225) NOT NULL,
  `foto` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`nomor_pers`, `id_dinas`, `nama_pers`, `pangkat`, `password`, `level`, `id_prov`, `id_kota`, `foto`) VALUES
(12321321, 1, 'asacasc', 'ascscasac', 'ascascasc', 1, 1, 1, '752079.jpg'),
(14650018, 1, 'Hilmy', 'Letnan', '123', 1, 12, 22, ''),
(14650099, 1, 'asjocbaijbcjcan', 'jasncsiajcb', '123', 1, 1, 1, '122795.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `arsip`
--
ALTER TABLE `arsip`
  ADD PRIMARY KEY (`id_arsip`);

--
-- Indexes for table `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `id_bencana` (`id_bencana`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `kebutuhan`
--
ALTER TABLE `kebutuhan`
  ADD PRIMARY KEY (`id_kebutuhan`);

--
-- Indexes for table `kodam`
--
ALTER TABLE `kodam`
  ADD PRIMARY KEY (`id_kodam`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indexes for table `kodim`
--
ALTER TABLE `kodim`
  ADD PRIMARY KEY (`id_kodim`),
  ADD KEY `id_korem` (`id_korem`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `koramil`
--
ALTER TABLE `koramil`
  ADD PRIMARY KEY (`id_koramil`),
  ADD KEY `id_kodim` (`id_kodim`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `korem`
--
ALTER TABLE `korem`
  ADD PRIMARY KEY (`id_korem`),
  ADD KEY `id_kodam` (`id_kodam`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
  ADD PRIMARY KEY (`id_kota`),
  ADD KEY `id_prov` (`id_prov`);

--
-- Indexes for table `operasi`
--
ALTER TABLE `operasi`
  ADD PRIMARY KEY (`id_bencana`),
  ADD KEY `id_skala` (`id_skala`),
  ADD KEY `id_kategori` (`id_kategori`),
  ADD KEY `nomor_pers` (`nomor_pers`),
  ADD KEY `id_prov` (`id_prov`),
  ADD KEY `id_kota` (`id_kota`);

--
-- Indexes for table `provinsi`
--
ALTER TABLE `provinsi`
  ADD PRIMARY KEY (`id_prov`);

--
-- Indexes for table `skala`
--
ALTER TABLE `skala`
  ADD PRIMARY KEY (`id_skala`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`nomor_pers`),
  ADD KEY `id_prov` (`id_prov`),
  ADD KEY `id_kota` (`id_kota`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `arsip`
--
ALTER TABLE `arsip`
  MODIFY `id_arsip` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `kebutuhan`
--
ALTER TABLE `kebutuhan`
  MODIFY `id_kebutuhan` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
  MODIFY `id_kota` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `operasi`
--
ALTER TABLE `operasi`
  MODIFY `id_bencana` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `provinsi`
--
ALTER TABLE `provinsi`
  MODIFY `id_prov` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `skala`
--
ALTER TABLE `skala`
  MODIFY `id_skala` int(225) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `berita`
--
ALTER TABLE `berita`
  ADD CONSTRAINT `berita_ibfk_1` FOREIGN KEY (`id_bencana`) REFERENCES `operasi` (`id_bencana`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kodam`
--
ALTER TABLE `kodam`
  ADD CONSTRAINT `kodam_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kodim`
--
ALTER TABLE `kodim`
  ADD CONSTRAINT `kodim_ibfk_1` FOREIGN KEY (`id_korem`) REFERENCES `korem` (`id_korem`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kodim_ibfk_2` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `koramil`
--
ALTER TABLE `koramil`
  ADD CONSTRAINT `koramil_ibfk_1` FOREIGN KEY (`id_kodim`) REFERENCES `kodim` (`id_kodim`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `koramil_ibfk_2` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `korem`
--
ALTER TABLE `korem`
  ADD CONSTRAINT `korem_ibfk_1` FOREIGN KEY (`id_kodam`) REFERENCES `kodam` (`id_kodam`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `korem_ibfk_2` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kota`
--
ALTER TABLE `kota`
  ADD CONSTRAINT `kota_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id_prov`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `operasi`
--
ALTER TABLE `operasi`
  ADD CONSTRAINT `operasi_ibfk_1` FOREIGN KEY (`id_skala`) REFERENCES `skala` (`id_skala`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_2` FOREIGN KEY (`id_kategori`) REFERENCES `kategori` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_3` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id_prov`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `operasi_ibfk_4` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_prov`) REFERENCES `provinsi` (`id_prov`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`id_kota`) REFERENCES `kota` (`id_kota`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

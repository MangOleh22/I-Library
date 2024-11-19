-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 19, 2024 at 05:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_ilibrary`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `user_id` int(2) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `fullname` varchar(30) NOT NULL,
  `gambar` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`user_id`, `username`, `password`, `fullname`, `gambar`) VALUES
(3, 'Chan', '1234', 'Chandra', 'gambar_admin/4.jpg'),
(4, 'admin1', 'admin123', 'administrasi', 'gambar_admin/download.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `data_anggota`
--

CREATE TABLE `data_anggota` (
  `id` int(4) NOT NULL,
  `no_induk` varchar(5) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `kelas` varchar(5) NOT NULL,
  `ttl` varchar(100) NOT NULL,
  `alamat` varchar(250) NOT NULL,
  `foto` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `data_anggota`
--

INSERT INTO `data_anggota` (`id`, `no_induk`, `nama`, `jk`, `kelas`, `ttl`, `alamat`, `foto`) VALUES
(14, '12090', 'Tes', 'L', '10', 'Jakarta, 12/10/7', 'Tes', 'gambar_anggota/user.jpg'),
(15, '12090', 'Waduh', 'P', '11', 'Jakarta, 19/19/9', 'Tes', 'gambar_anggota/user.jpg'),
(16, '12345', 'anggota1', 'P', '12', '12 desember 1928', 'Kediri', 'gambar_anggota/download.jfif');

-- --------------------------------------------------------

--
-- Table structure for table `data_buku`
--

CREATE TABLE `data_buku` (
  `id` int(5) NOT NULL,
  `judul` varchar(250) NOT NULL,
  `pengarang` varchar(250) NOT NULL,
  `th_terbit` varchar(4) NOT NULL,
  `penerbit` varchar(250) NOT NULL,
  `isbn` varchar(25) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `kode_klas` varchar(20) NOT NULL,
  `jumlah_buku` int(2) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `asal` varchar(50) NOT NULL,
  `jum_temp` int(4) NOT NULL,
  `tgl_input` varchar(75) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `data_buku`
--

INSERT INTO `data_buku` (`id`, `judul`, `pengarang`, `th_terbit`, `penerbit`, `isbn`, `kategori`, `kode_klas`, `jumlah_buku`, `lokasi`, `asal`, `jum_temp`, `tgl_input`, `gambar`) VALUES
(6, 'Cisco', 'Saya', '2020', 'Saya', '2309012391', 'Teknologi', 'XI', 3, 'Lantai 2', 'Sumbangan', 1, '2024/11/14', 'gambar_buku/wocc.jpg'),
(7, 'buku1', 'pengarang1', '2024', 'penerbit1', '865364', 'psikologi', 'XI', 13, '2', 'Pembelian', 2, '2024/11/19', 'gambar_buku/bukujpg-20230718091718.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `pengunjung`
--

CREATE TABLE `pengunjung` (
  `id` int(6) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `kelas` varchar(17) NOT NULL,
  `perlu1` varchar(15) NOT NULL,
  `cari` varchar(255) NOT NULL,
  `saran` varchar(255) NOT NULL,
  `tgl_kunjung` date NOT NULL,
  `jam_kunjung` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pengunjung`
--

INSERT INTO `pengunjung` (`id`, `nama`, `jk`, `kelas`, `perlu1`, `cari`, `saran`, `tgl_kunjung`, `jam_kunjung`) VALUES
(10, 'Tes', 'L', 'XII1', 'Meminjam Buku', 'Meminjam Buku Cisco', '', '2024-11-14', '15:59:38'),
(11, 'Waduh', 'P', 'XI4', 'Meminjam Buku', 'Cisco', '', '2024-11-14', '16:08:17'),
(12, 'Waduh', 'P', 'XI1', 'Meminjam Buku', 'Cisco', 'Lebih Baik Lagi', '2024-11-14', '16:08:49'),
(13, 'Tes', 'L', 'X1', 'Meminjam Buku', 'Cisco', 'fefef', '2024-11-14', '16:19:39');

-- --------------------------------------------------------

--
-- Table structure for table `trans_pinjam`
--

CREATE TABLE `trans_pinjam` (
  `id` int(5) NOT NULL,
  `judul_buku` varchar(250) NOT NULL,
  `id_peminjam` int(4) NOT NULL,
  `nama_peminjam` varchar(100) NOT NULL,
  `tgl_pinjam` varchar(15) NOT NULL,
  `tgl_kembali` varchar(15) NOT NULL,
  `status` varchar(10) NOT NULL,
  `ket` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trans_pinjam`
--

INSERT INTO `trans_pinjam` (`id`, `judul_buku`, `id_peminjam`, `nama_peminjam`, `tgl_pinjam`, `tgl_kembali`, `status`, `ket`) VALUES
(5, 'Cisco', 6, 'Tes', '14-11-2024', '21-11-2024', 'kembali', '12-10-2024'),
(6, 'Cisco', 6, 'Waduh', '14-11-2024', '21-11-2024', 'kembali', '1-1-2024'),
(7, 'buku1', 7, 'anggota1', '19-11-2024', '26-11-2024', 'kembali', 'tugas 7 hari'),
(8, 'buku1', 7, 'anggota1', '19-11-2024', '26-11-2024', 'pinjam', 'tes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `data_anggota`
--
ALTER TABLE `data_anggota`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_buku`
--
ALTER TABLE `data_buku`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengunjung`
--
ALTER TABLE `pengunjung`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_pinjam`
--
ALTER TABLE `trans_pinjam`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `user_id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `data_anggota`
--
ALTER TABLE `data_anggota`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `data_buku`
--
ALTER TABLE `data_buku`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `pengunjung`
--
ALTER TABLE `pengunjung`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `trans_pinjam`
--
ALTER TABLE `trans_pinjam`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php
$namafolder="gambar_buku/"; //tempat menyimpan file

include "../conn.php";

if (!empty($_FILES["nama_file"]["tmp_name"]))
{
	$jenis_gambar=$_FILES['nama_file']['type'];
        $id = $_POST['id'];
        $judul = $_POST['judul'];
        $pengarang = $_POST['pengarang'];
        $th_terbit = $_POST['th_terbit'];
        $penerbit = $_POST['penerbit'];
        $isbn = $_POST['isbn'];
        $kategori = $_POST['kategori'];
        $kode_klas = $_POST['kode_klas'];
        $jumlah_buku = $_POST['jumlah_buku'];
        $lokasi = $_POST['lokasi'];
        $asal = $_POST['asal'];
        $jum_temp = $_POST['jum_temp'];
        $tgl_input = $_POST['tgl_input'];

		
	if($jenis_gambar=="image/jpeg" || $jenis_gambar=="image/jpg" || $jenis_gambar=="image/gif" || $jenis_gambar=="image/x-png")
	{			
		$gambar = $namafolder . basename($_FILES['nama_file']['name']);		
		if (move_uploaded_file($_FILES['nama_file']['tmp_name'], $gambar)) {
			$sql="INSERT INTO data_buku(id,judul,pengarang,th_terbit,penerbit,isbn,kategori,kode_klas,jumlah_buku,lokasi,asal,jum_temp,tgl_input,gambar) VALUES
            ('$id','$judul','$pengarang','$th_terbit','$penerbit','$isbn','$kategori','$kode_klas','$jumlah_buku','$lokasi','$asal','$jum_temp','$tgl_input','$gambar')";
			$res=mysql_query($sql) or die (mysql_error());
			echo "Gambar berhasil dikirim ke direktori".$gambar;
            echo "<h3><a href='input-buku.php'> Input Lagi</a></h3>";
            echo "<h3><a href='buku.php'> Data Buku</a></h3>";	   
		} else {
		   echo "<p>Gambar gagal dikirim</p>";
		}
   } else {
		echo "Jenis gambar yang anda kirim salah. Harus .jpg .gif .png";
   }
} else {
  echo "Anda belum memilih gambar";
}
?>
<div class="col-sm-8">
  <input name="id" type="text" id="id" class="form-control" placeholder="Tidak perlu di isi" autofocus="on" readonly="readonly" />
</div>
<div class="form-group">
  <label class="col-sm-2 col-sm-2 control-label">Judul</label>
  <div class="col-sm-8">
    <input name="judul" type="text" id="judul" class="form-control" autocomplete="off" placeholder="Judul Buku" required="" />
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 col-sm-2 control-label">Pengarang</label>
  <div class="col-sm-8">
    <input name="pengarang" type="text" id="pengarang" class="form-control" autocomplete="off" placeholder="Pengarang Buku" required="" />
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 col-sm-2 control-label">Peminjam</label>
  <div class="col-sm-8">
    <input name="peminjam" type="text" id="peminjam" class="form-control" autocomplete="off" placeholder="Nama Peminjam" required="" />
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 col-sm-2 control-label">Tanggal Pinjam</label>
  <div class="col-sm-8">
    <input name="tanggal_pinjam" type="date" id="tanggal_pinjam" class="form-control" required="" />
  </div>
</div>
<div class="form-group">
  <label class="col-sm-2 col-sm-2 control-label">Tanggal Kembali</label>
  <div class="col-sm-8">
    <input name="tanggal_kembali" type="date" id="tanggal_kembali" class="form-control" required="" />
  </div>
</div>
<?php
?>
<div>
</div>
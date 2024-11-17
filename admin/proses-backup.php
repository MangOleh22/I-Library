<?php
include "../conn.php";

$date = date('d-m-Y-g-i-s');
$file = "backup@" . $date . ".sql";
$file_path = 'backup/' . $file;

// Ensure the backup directory exists
if (!is_dir('backup')) {
    mkdir('backup', 0777, true);
}

$command = "mysqldump -u root db_perpus > $file_path 2>&1";
exec($command, $output, $result);

// Log the output of the command
file_put_contents('backup/backup_log.txt', implode("\n", $output), FILE_APPEND);

if ($result === 0 && file_exists($file_path) && filesize($file_path) > 0) {
    // header yang menunjukkan nama file yang akan didownload
    header("Content-Disposition: attachment; filename=$file");

    // header yang menunjukkan ukuran file yang akan didownload
    header("Content-length: " . filesize($file_path));

    // header yang menunjukkan jenis file yang akan didownload
    header("Content-type: application/octet-stream");

    // proses membaca isi file yang akan didownload dari folder
    $fp = fopen($file_path, 'r');
    $content = fread($fp, filesize($file_path));
    fclose($fp);

    // menampilkan isi file yang akan didownload
    echo $content;

    echo "<script>alert('Berhasil Backup Database. Nama File = $file');</script>";
} else {
    echo "<script>alert('Gagal Backup ! File tidak ditemukan atau kosong.');</script>";
    // Log the error
    file_put_contents('backup/backup_error_log.txt', "Backup failed on $date\nCommand: $command\nOutput: " . implode("\n", $output) . "\n", FILE_APPEND);
}

exit;
?>
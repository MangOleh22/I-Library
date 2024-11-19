<?php
session_start();
session_destroy();	

    echo "<script>alert('Sesi Selesai, Silahkan login kembali.'); window.location = 'login.html'</script>";
?>
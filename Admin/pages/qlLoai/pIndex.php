<h1>Quản Lí Tài Khoản</h1>
    <?php
        $a = 1;
        if(isset($_GET["a"]))
            $a = $_GET["a"];

        switch ($a) {
            case 1:
                include "pages/qlLoai/pDanhSach.php";
                break;
            case 2:
                include "pages/qlLoai/pCapNhat.php";
                break;
            case 3:
                include "pages/qlLoai/pThemMoi.php";
                break;
            case 4:
                include "pages/qlLoai/pTimKiem.php";
            break;
            default:
                include "pages/pError.php";
                break;
        }
    ?>

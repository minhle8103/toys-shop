<?php
    session_start();
    include "../../lib/DataProvider.php";
    if (isset($_POST["us"])) // Bỏ kiểm tra Captcha
    {
        $us = $_POST["us"];
        $ps = $_POST["ps"];
        $name = $_POST["name"];
        $add = $_POST["add"];
        $tel = $_POST["tel"];
        $mail = $_POST["mail"];

        $sql = "SELECT * FROM TaiKhoan WHERE TenDangNhap = '$us'";
        $result = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($result);
        if ($row != null) {
            $curURL = $_SESSION["path"];
            DataProvider::ChangeURL("../../.." . $curURL . "&err=1");
        } else {
            $sql = "INSERT INTO TaiKhoan(TenDangNhap, MatKhau, TenHienThi, DiaChi, DienThoai, Email, MaLoaiTaiKhoan)
                    VALUES('$us', '$ps', '$name', '$add', '$tel', '$mail', 1)";
            DataProvider::ExecuteQuery($sql);
            
            $sql = "SELECT MaTaiKhoan FROM TaiKhoan WHERE TenDangNhap= '$us' AND MatKhau='$ps'";
            $result = DataProvider::ExecuteQuery($sql);
            $row = mysqli_fetch_array($result);

            $_SESSION["MaTaiKhoan"] = $row["MaTaiKhoan"];
            $_SESSION["MaLoaiTaiKhoan"] = 1;
            $_SESSION["TenHienThi"] = $name;
            DataProvider::ChangeURL("../../index.php");
        }
    }
    else {
        DataProvider::ChangeURL("../../index.php?a=404&id=10");
    }
?>

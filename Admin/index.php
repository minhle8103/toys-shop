<?php
session_start();
include "../lib/DataProvider.php";
//Check Admin
if (!isset($_SESSION["MaTaiKhoan"]) || $_SESSION["MaLoaiTaiKhoan"] != 2)
    DataProvider::changeURL("../index.php");
$c = 0;
if (isset($_GET["c"])) {
    $c = $_GET["c"];
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<style>
    /* Reset body styling for consistency */
body {
    font-family: Tahoma, Helvetica, Arial, sans-serif;
    font-size: 14px;
    background-color: #f0f2f5; /* Sử dụng nền màu xám nhạt để tăng tính hiện đại */
    margin: 0;
    padding: 0;
    color: #333;
}

/* General link styling */
a {
    text-decoration: none;
    color: inherit;
}

/* Header styling */
#header {
    text-align: center;
    font-size: 28px;
    background-color: #ff4d73;
    padding: 15px;
    font-weight: bold;
    color: white;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Thêm bóng để header nổi bật */
}

#header a {
    color: white;
    transition: ease 0.3s;
}

#header a:hover {
    color: #ccc; /* Màu sáng hơn khi hover */

}

/* Navigation menu styling */
#menu {
    background-color: #007bff;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 0 10px;
    font-size: 16px;
    height: 60px;
    color: white;
}

#mMenu {
    width: 80%;
    display: flex;
    gap: 20px;
    align-items: center;
    justify-content: center;
}

#mMenu a {
    color: white;
    padding: 14px 20px;
    font-weight: 600;
    transition: background-color 0.3s, color 0.3s;
}

#mMenu a:hover {
    background-color: #0056b3;
    border-radius: 5px;
}

/* Login section in the header */
#login {
    position: absolute;
    right: 25px;
    top: 22px;
    font-weight: bold;
    color: #FFF;
}

#login a{
    margin-left: 10px;
    padding-top: 2px;
}
.login-text{
    color: black;
    transition: ease 0.3s;
}

.login-text:hover{
    color: #ccc;
    
    
}
/* Footer styling */
#footer {
    clear: both;
    background-color: #0d3d96;
    padding: 15px;
    text-align: center;
    color: #FFF;
    font-weight: bold;
    border-top: 2px solid #FFF;
    font-size: 14px;
}

/* Content area styling */
#content {
    margin: 20px auto;
    padding: 20px;
    max-width: 1000px;
    background-color: white;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1); /* Đổ bóng nhẹ cho phần nội dung */
    border-radius: 8px;
}

#content h1 {
    color: #ff4d4d;
    text-align: center;
    margin-bottom: 20px;
}

#content img {
    display: block;
    margin: 20px auto;
}

#content table {
    margin: 20px auto;
    width: 100%;
    border-collapse: collapse;
    font-size: 15px;
}

/* Table styling */
table, th, td {
    border: 1px solid #088fbd;
}

table th {
    background-color: #088fbd;
    color: #fff;
    padding: 10px;
    text-align: center;
}

table td {
    padding: 10px;
    text-align: center;
    color: #333;
}

#content span {
    width: 150px;
    font-size: 16px;
    text-align: right;
    display: inline-block;
    margin-right: 10px;
    color: #555;
}

/* Fieldset legend styling */
fieldset legend {
    font-size: 16px;
    color: #333;
    font-weight: bold;
    text-align: center;
    margin-bottom: 10px;
}

/* Button styling for add button */
.add {
    padding: 10px 20px;
    font-weight: bold;
    color: white;
    background-color: #007bff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.add:hover {
    background-color: #0056b3;
}

</style>
<body>
    <div id="header">
        <a href="index.php">
            HỆ THỐNG QUẢN LÝ SẢN PHẨM SHOP
        </a>
    </div>
    <div id="menu">
        <?php
        include "modules/mMenu.php";
        include "modules/mLogin.php";
        ?>
    </div>
    <div id="content">
        <?php
        switch ($c) {
            case 0:
                include "pages/pIndex.php";
                break;
            case 1:
                include "pages/qlTaiKhoan/pIndex.php";
                break;
            case 2:
                include "pages/qlSanPham/pIndex.php";
                break;
            case 3:
                include "pages/qlLoai/pIndex.php";
                break;
            case 4:
                include "pages/qlHang/pIndex.php";
                break;
            case 5:
                include "pages/qlDonDatHang/pIndex.php";
                break;
            default:
                include "pages/pError.php";
                break;
        }
        ?>
    </div>
    <div id="footer">
        &copy;
    </div>
</body>

</html>
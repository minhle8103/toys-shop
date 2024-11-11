<h2><img src="img/eye-icon.png"/>Thông tin chi tiết sản phẩm</h2>
<?php
if (isset($_GET["id"])) {
    $id = $_GET["id"];
} else {
    DataProvider::ChangeURL("index.php?a=404");
}
$sql = "SELECT s.MaSanPham, s.TenSanPham, s.GiaSanPham, s.SoLuongBan, s.SoLuocXem, s.HinhURL, s.MoTa, h.TenHangSanXuat, l.TenLoaiSanPham, l.MaLoaiSanPham
    FROM SanPham s, HangSanXuat h, LoaiSanPham l
    WHERE s.BiXoa = 0 AND s.MaHangSanXuat=h.MaHangSanXuat AND s.MaLoaiSanPham = l.MaLoaiSanPham AND s.MaSanPham=$id";

$result = DataProvider::ExecuteQuery($sql);
$row = mysqli_fetch_array($result);
$slx = $row["SoLuocXem"];
$MaLoaiSanPham = $row["MaLoaiSanPham"];
if ($result == null) {
    DataProvider::ChangeURL("index.php?a=404");
}
?>
<div id="chitietsp">
    <div class="row">

        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
            <div class="chitietleft photobox">
                <img src="images/<?php echo $row["HinhURL"]; ?>">
            </div>
        </div>

        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">

            <div class="chitietright">
                <div>
                    <span class="label">Tên sản phẩm:</span>
                    <span class="name"><?php echo $row["TenSanPham"]; ?></span>
                </div>
                <div>
                    <span class="label">Giá:</span>
                    <span class="price"><?php echo $row["GiaSanPham"]; ?> đ</span>
                </div>
                <div>
                    <span class="label">Hãng sản xuất:</span>
                    <span class="factory"><?php echo $row["TenHangSanXuat"]; ?></span>
                </div>
                <div>
                    <span class="label">Loại sản phẩm:</span>
                    <span class="data"><?php echo $row["TenLoaiSanPham"]; ?></span>
                </div>
                <div>
                    <span class="label">Số lượng bán:</span></span>
                    <span class="data"><?php echo $row["SoLuongBan"]; ?> sản phẩm</span>
                </div>
                <div>
                    <span class="label">Số lượt xem:</span>
                    <span class="data"><?php echo $row["SoLuocXem"] + 1; ?> lượt</span>
                </div>
                <hr>
                <div class="giohang">
                    <?php
                    if (isset($_SESSION["MaTaiKhoan"])) {
                    ?>
                        <a href="index.php?a=5&id=<?php echo $row["MaSanPham"]; ?>">
                            <img src="img/shopping-cart.png" width="32" title="Thêm vào giỏ hàng">
                        </a>
                    <?php
                    } else {
                        echo "<div class='error-message'>Bạn cần đăng nhập để thêm sản phẩm vào giỏ hàng.</div>";
                    }
                    ?>
</div>

            </div>
            <div class="mota">
                Ghi chú:
                <br>
                &Tab;<?php echo $row["MoTa"]; ?>
            </div>
        </div>

        <!-- 5 sản phẩm cùng loại -->
        <h2 style="margin-top: 10px"><img src="img/eye-icon.png"/>Sản phẩm cùng loại</h2>
        <?php
        $sql = "SELECT * FROM SanPham WHERE BiXoa = 0 AND MaLoaiSanPham = $MaLoaiSanPham LIMIT 0, 5";
        $result = DataProvider::ExecuteQuery($sql);
        ?>

        <div class="row">
            <?php
            while ($row = mysqli_fetch_array($result)) {
            ?>
                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                    <div class="box">

                        <a href="index.php?a=4&id=<?php echo $row["MaSanPham"]; ?>">
                            <img src="images/<?php echo $row["HinhURL"]; ?>" />
                            <div class="pname"> <?php echo $row["TenSanPham"]; ?></div>
                            <div class="pprice">Giá: <?php echo $row["GiaSanPham"]; ?>đ</div>
                        </a>
                    </div>

                </div>
            <?php
            }
            ?>
        </div>
    </div>
</div>
<?php
$SoLuocXem = $slx + 1;
$sql = "UPDATE SanPham SET SoLuocXem = $SoLuocXem WHERE MaSanPham = $id";
DataProvider::ExecuteQuery($sql);
?>
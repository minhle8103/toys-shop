-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 04, 2024 at 04:16 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `babyshop`
--

-- --------------------------------------------------------

--
-- Table structure for table `chitietdondathang`
--

CREATE TABLE `chitietdondathang` (
  `MaChiTietDonDatHang` varchar(11) NOT NULL,
  `SoLuong` int(11) DEFAULT NULL,
  `GiaBan` int(11) DEFAULT NULL,
  `MaDonDatHang` varchar(9) NOT NULL,
  `MaSanPham` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `chitietdondathang`
--

INSERT INTO `chitietdondathang` (`MaChiTietDonDatHang`, `SoLuong`, `GiaBan`, `MaDonDatHang`, `MaSanPham`) VALUES
('08101200100', 4, 260000, '081012001', 11),
('08101200101', 3, 160000, '081012001', 4),
('08101200102', 30, 220000, '081012001', 10),
('08101200103', 1, 380000, '081012001', 9),
('08101200200', 1, 380000, '081012002', 9),
('08101200300', 2, 220000, '081012003', 10),
('13121200100', 4, 160000, '131212001', 4),
('13121200200', 1, 180000, '131212002', 5),
('13121200201', 2, 260000, '131212002', 11);

-- --------------------------------------------------------

--
-- Table structure for table `dondathang`
--

CREATE TABLE `dondathang` (
  `MaDonDatHang` varchar(9) NOT NULL,
  `NgayLap` datetime DEFAULT NULL,
  `TongThanhTien` int(11) DEFAULT NULL,
  `MaTaiKhoan` int(11) NOT NULL,
  `MaTinhTrang` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dondathang`
--

INSERT INTO `dondathang` (`MaDonDatHang`, `NgayLap`, `TongThanhTien`, `MaTaiKhoan`, `MaTinhTrang`) VALUES
('081012001', '2012-10-08 00:00:00', 380000, 1, 4),
('081012002', '2012-10-08 00:00:00', 380000, 1, 4),
('081012003', '2012-10-08 00:00:00', 440000, 1, 1),
('131212001', '2012-12-13 00:00:00', 640000, 1, 1),
('131212002', '2012-12-13 00:00:00', 700000, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hangsanxuat`
--

CREATE TABLE `hangsanxuat` (
  `MaHangSanXuat` int(11) NOT NULL,
  `TenHangSanXuat` varchar(64) DEFAULT NULL,
  `LogoURL` varchar(45) DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `hangsanxuat`
--

INSERT INTO `hangsanxuat` (`MaHangSanXuat`, `TenHangSanXuat`, `LogoURL`, `BiXoa`) VALUES
(1, 'Revell', 'Revell.png', 0),
(2, 'Lego', 'Lego.png', 0),
(3, 'Lamaze', 'Lamaze.png', 0),
(4, 'vTech', 'vtech.png', 0),
(5, 'Rastar', 'Rastar.jpg', 0),
(6, 'Syma', 'Syma.png', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loaisanpham`
--

CREATE TABLE `loaisanpham` (
  `MaLoaiSanPham` int(11) NOT NULL,
  `TenLoaiSanPham` varchar(64) DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaisanpham`
--

INSERT INTO `loaisanpham` (`MaLoaiSanPham`, `TenLoaiSanPham`, `BiXoa`) VALUES
(1, 'Thú nhồi bông', 0),
(2, 'Đồ chơi nhựa', 0),
(3, 'Đồ chơi điện tử', 0),
(4, 'Điều khiển từ xa', 0),
(5, 'Đồ chơi trí tuệ', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loaitaikhoan`
--

CREATE TABLE `loaitaikhoan` (
  `MaLoaiTaiKhoan` int(11) NOT NULL,
  `TenLoaiTaiKhoan` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `loaitaikhoan`
--

INSERT INTO `loaitaikhoan` (`MaLoaiTaiKhoan`, `TenLoaiTaiKhoan`) VALUES
(1, 'User'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`) VALUES
(1, 'Sản phẩm A', 100.00),
(2, 'Sản phẩm B', 200.00),
(3, 'Sản phẩm C', 300.00);

-- --------------------------------------------------------

--
-- Table structure for table `sanpham`
--

CREATE TABLE `sanpham` (
  `MaSanPham` int(11) NOT NULL,
  `TenSanPham` varchar(45) DEFAULT NULL,
  `HinhURL` varchar(45) DEFAULT NULL,
  `GiaSanPham` int(11) DEFAULT NULL,
  `NgayNhap` datetime DEFAULT NULL,
  `SoLuongTon` int(11) DEFAULT NULL,
  `SoLuongBan` int(11) DEFAULT NULL,
  `SoLuocXem` int(11) DEFAULT NULL,
  `MoTa` text DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0,
  `MaLoaiSanPham` int(11) NOT NULL,
  `MaHangSanXuat` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sanpham`
--

INSERT INTO `sanpham` (`MaSanPham`, `TenSanPham`, `HinhURL`, `GiaSanPham`, `NgayNhap`, `SoLuongTon`, `SoLuongBan`, `SoLuocXem`, `MoTa`, `BiXoa`, `MaLoaiSanPham`, `MaHangSanXuat`) VALUES
(4, 'Bill D. Beaver', 'Lamaze_Bill_D_Beaver.jpeg', 160000, '2024-10-29 12:10:02', 14, 9, 26, '                    Hải lý bằng bông mịn, đẹp, dễ thương                ', 0, 1, 3),
(5, 'Captain Calamari', 'Lamaze_Captain_Calamari.jpeg', 180000, '2024-10-29 12:10:42', 14, 6, 4, '                    Bạch tuộc biển                ', 0, 1, 3),
(7, 'Elephantunes', 'Lamaze_Elephantunes.jpeg', 480000, '2024-10-29 12:10:40', 25, 2, 9, '                    Voi bằng bông, hồng xì tin...                ', 0, 1, 3),
(8, 'Freddie the Firefly', 'Lamaze_Freddie_Firefly.jpeg', 300000, '2024-10-29 12:10:50', 30, 0, 8, '                    Bướm nhồi bông                ', 0, 1, 3),
(9, 'Super Mario', 'Lego_Supper_Mario.jpeg', 380000, '2024-11-04 03:11:03', 24, 6, 17, '                                        Bộ lấp áp Lego trò chơi Mario                                ', 1, 5, 2),
(10, 'Nasa Academy Space', 'Revell_Academy_Space.jpeg', 220000, '2024-10-29 12:10:45', 28, 7, 8, '                    Tàu con thoi của Nasa                ', 0, 3, 1),
(11, 'Lamborghini Revention', 'Revell_Lamborghini_Revention.jpeg', 260000, '2024-10-29 12:10:57', 38, 3, 44, '                    Siêu xe Lamborghini Revention                ', 0, 3, 1),
(12, 'Camaro SS', 'Revell_Camaro_SS.jpeg', 260000, '2024-10-29 12:10:26', 20, 0, 1, '                    Xe đua Camaro SS                ', 0, 3, 1),
(13, 'Pond Motion Gym', 'Lamaze_Pond_Motion_Gym.jpg', 920000, '2024-10-29 12:10:35', 10, 2, 15, '                                        Niệm lót cho trẻ em                                ', 0, 1, 3),
(14, 'Stacking Rings', 'Lamaze_Stacking_Rings.jpg', 240000, '2024-10-29 12:10:04', 5, 5, 1, '                    Vòng xoay kỳ thú, kích thích sự tò mò của trẻ                ', 0, 1, 3),
(15, 'Octivity Time', 'Lamaze_Octivity_Time.jpg', 270000, '2024-10-29 12:10:09', 19, 3, 3, '                    Bé mặt trời xanh                ', 0, 1, 3),
(16, 'Mittens the Kitten', 'Lamaze_Mittens_the_Kitten.jpg', 190000, '2024-10-29 12:10:06', 50, 3, 5, '                    Chú mèo ngộ nghĩnh                ', 0, 1, 3),
(17, 'Feel Me Fish', 'Lamaze_Feel_Me_Fish.jpg', 180000, '2024-10-29 12:10:31', 60, 3, 2, '                    Chú cá vàng đa sắc                ', 0, 1, 3),
(18, 'Huey the Hedgehog', 'Lamaze_Huey_the_Hedgehog.jpg', 200000, '2024-10-29 12:10:01', 30, 30, 22, '                    Nhiếm bảy màu, mang đến sự may mắn cho bé                ', 0, 1, 3),
(19, 'Neat-Oh!', 'Lego_Neat_Oh.jpg', 110000, '2024-10-29 12:10:56', 19, 13, 27, '                    Túi đồ chơi xây dựng công viên của Lego                ', 0, 5, 2),
(20, 'Ninjago 2172', 'Lego_Ninjago_2172.jpg', 160000, '2024-10-29 12:10:48', 20, 12, 18, '                    Bộ xếp hình Lego thời Ai Cập cổ đại                ', 0, 5, 2),
(21, 'Mexican', 'Lego_Mexican.jpg', 140000, '2024-10-29 12:10:52', 35, 12, 13, '                    Bộ xếp hình Lego nhạc công Mehico                ', 0, 5, 2),
(22, 'Star Wars', 'Lego_Star_Wars.jpg', 500000, '2024-10-29 12:10:05', 24, 28, 30, '                    Bộ xếp hình Lego phi thuyền trong cuộc chiến tranh giữa các vì sao                ', 0, 5, 2),
(23, 'City Park Cafe 3061', 'Lego_City_Park_Cafe_3061.jpg', 950000, '2024-10-29 12:10:17', 30, 2, 26, '                    Bộ xếp hình xây dựng shop cafe trong thành phố                 ', 0, 5, 2),
(24, 'Bright Lights Ball', 'Vtech_Bright_Lights_Ball.jpg', 150000, '2024-10-29 12:10:23', 39, 2, 8, '                    Quả cầu thông minh                ', 0, 2, 4),
(25, 'Baby\'s Laptop', 'Vtech_Baby_Laptop.jpg', 240000, '2012-09-07 00:00:00', 38, 2, 5, 'Laptop thông tin của trẻ em, giúp trẻ phát triển tư duy trí tuệ', 0, 2, 4),
(26, 'Toot Driver Garage', 'Vtech_Toot_Driver_Garage.jpg', 620000, '2024-10-29 12:10:58', 20, 12, 41, '                    Bãi đỗ xe trong thành phố, sẽ giúp bé tự điều hành việc hoạt động của một bãi đỗ xe hiện đại trong thành phố                ', 0, 2, 4),
(27, 'Emergency Vehicles (3-Pack)', 'Vtech_Emergency_Vehicles.jpg', 223000, '2024-10-29 12:10:54', 20, 12, 4, '                    Bộ sản phẩm 3 xe đồ chơi, đẹp, dễ thương và an toàn với trẻ                ', 0, 2, 4),
(28, 'Lamborghini Murcielago', 'Rastar_Lamborghini_Murcielago.jpg', 300000, '2024-10-29 12:10:34', 10, 1, 3, '                    Xe điều khiển từ xa Lamborghini                ', 0, 4, 5),
(29, 'Rover Sport HSE', 'Rastar_Rover_Sport_HSE.jpg', 320000, '2024-10-29 12:10:31', 10, 3, 2, '                    Xe điều khiển Rover, vượt mọi địa hình, sức mạnh của trâu                ', 0, 4, 5),
(30, 'Apache Helicopter', 'Syma_Apache_Helicopter.jpg', 625000, '2024-10-29 12:10:27', 4, 2, 1, '                    Máy bay chiến đâu siêu đa năng Apache                ', 0, 4, 6),
(31, 'Micro Helicopter', 'Syma_Micro_Helicopter.jpg', 560000, '2024-10-29 12:10:24', 2, 6, 5, '                    Máy bay lên thẳng đa dụng                ', 0, 4, 6),
(32, 'Micro Chinook', 'Syma_ Micro_Chinook.jpg', 410000, '2024-10-29 12:10:22', 3, 0, 2, '                    Máy bay trực thăng vận tải, đa dụng, có thể vận chuyển được xe tăng                ', 0, 4, 6),
(33, 'X1 - 01', 'Syma_x1_01.jpg', 600000, '2024-10-29 12:10:19', 4, 0, 17, '                    Máy bay lên thẳng 4 cánh quạt, đa dụng và dễ dàng điều khiển vượt qua mọi địa hình                ', 0, 4, 6),
(34, 'Con Quay Yoyo Đao Bạc - Yoyo 22 EU677223R - X', 'Syma_yoyo.jpg', 120000, '2024-11-04 03:11:43', 20, 0, 3, '', 0, 2, 6);

-- --------------------------------------------------------

--
-- Table structure for table `taikhoan`
--

CREATE TABLE `taikhoan` (
  `MaTaiKhoan` int(11) NOT NULL,
  `TenDangNhap` varchar(20) DEFAULT NULL,
  `MatKhau` varchar(20) DEFAULT NULL,
  `TenHienThi` varchar(64) DEFAULT NULL,
  `DiaChi` varchar(256) DEFAULT NULL,
  `DienThoai` varchar(11) DEFAULT NULL,
  `Email` varchar(30) DEFAULT NULL,
  `BiXoa` tinyint(1) DEFAULT 0,
  `MaLoaiTaiKhoan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taikhoan`
--

INSERT INTO `taikhoan` (`MaTaiKhoan`, `TenDangNhap`, `MatKhau`, `TenHienThi`, `DiaChi`, `DienThoai`, `Email`, `BiXoa`, `MaLoaiTaiKhoan`) VALUES
(1, 'ndhuy', 'ndhuy', 'Đức Huy', '227 - Nguyễn Văn Cừ - Q.5', '01234567890', 'ndhuy@gmail.com', 0, 1),
(5, 'admin', 'admin', 'Admin website', 'Baby Shop', '0909123456', 'admin@babyshop.vn', 0, 2),
(6, 'minhle8103', '123151', 'minhle', 'pm', '0359363203', 'sadboiz2k3@gmail.com', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tinhtrang`
--

CREATE TABLE `tinhtrang` (
  `MaTinhTrang` int(11) NOT NULL,
  `TenTinhTrang` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tinhtrang`
--

INSERT INTO `tinhtrang` (`MaTinhTrang`, `TenTinhTrang`) VALUES
(1, 'Đặt hàng'),
(2, 'Đang giao hàng'),
(3, 'Thanh toán'),
(4, 'Hủy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD PRIMARY KEY (`MaChiTietDonDatHang`),
  ADD KEY `fk_ChiTietDonDatHang_DonDatHang1_idx` (`MaDonDatHang`),
  ADD KEY `fk_ChiTietDonDatHang_SanPham1_idx` (`MaSanPham`);

--
-- Indexes for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD PRIMARY KEY (`MaDonDatHang`),
  ADD KEY `fk_DonDatHang_TaiKhoan1_idx` (`MaTaiKhoan`),
  ADD KEY `fk_DonDatHang_TinhTrang1_idx` (`MaTinhTrang`);

--
-- Indexes for table `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  ADD PRIMARY KEY (`MaHangSanXuat`);

--
-- Indexes for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  ADD PRIMARY KEY (`MaLoaiSanPham`);

--
-- Indexes for table `loaitaikhoan`
--
ALTER TABLE `loaitaikhoan`
  ADD PRIMARY KEY (`MaLoaiTaiKhoan`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MaSanPham`),
  ADD KEY `fk_SanPham_LoaiSanPham1_idx` (`MaLoaiSanPham`),
  ADD KEY `fk_SanPham_HangSanXuat1_idx` (`MaHangSanXuat`);

--
-- Indexes for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD PRIMARY KEY (`MaTaiKhoan`),
  ADD KEY `fk_TaiKhoan_LoaiTaiKhoan_idx` (`MaLoaiTaiKhoan`);

--
-- Indexes for table `tinhtrang`
--
ALTER TABLE `tinhtrang`
  ADD PRIMARY KEY (`MaTinhTrang`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hangsanxuat`
--
ALTER TABLE `hangsanxuat`
  MODIFY `MaHangSanXuat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loaisanpham`
--
ALTER TABLE `loaisanpham`
  MODIFY `MaLoaiSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `loaitaikhoan`
--
ALTER TABLE `loaitaikhoan`
  MODIFY `MaLoaiTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MaSanPham` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `taikhoan`
--
ALTER TABLE `taikhoan`
  MODIFY `MaTaiKhoan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tinhtrang`
--
ALTER TABLE `tinhtrang`
  MODIFY `MaTinhTrang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chitietdondathang`
--
ALTER TABLE `chitietdondathang`
  ADD CONSTRAINT `fk_ChiTietDonDatHang_DonDatHang1` FOREIGN KEY (`MaDonDatHang`) REFERENCES `dondathang` (`MaDonDatHang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ChiTietDonDatHang_SanPham1` FOREIGN KEY (`MaSanPham`) REFERENCES `sanpham` (`MaSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dondathang`
--
ALTER TABLE `dondathang`
  ADD CONSTRAINT `fk_DonDatHang_TaiKhoan1` FOREIGN KEY (`MaTaiKhoan`) REFERENCES `taikhoan` (`MaTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_DonDatHang_TinhTrang1` FOREIGN KEY (`MaTinhTrang`) REFERENCES `tinhtrang` (`MaTinhTrang`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `fk_SanPham_HangSanXuat1` FOREIGN KEY (`MaHangSanXuat`) REFERENCES `hangsanxuat` (`MaHangSanXuat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_SanPham_LoaiSanPham1` FOREIGN KEY (`MaLoaiSanPham`) REFERENCES `loaisanpham` (`MaLoaiSanPham`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `taikhoan`
--
ALTER TABLE `taikhoan`
  ADD CONSTRAINT `fk_TaiKhoan_LoaiTaiKhoan` FOREIGN KEY (`MaLoaiTaiKhoan`) REFERENCES `loaitaikhoan` (`MaLoaiTaiKhoan`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

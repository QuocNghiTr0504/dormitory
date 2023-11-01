-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2023 lúc 04:21 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `qlktx1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lop`
--

CREATE TABLE `lop` (
  `MaLop` varchar(10) NOT NULL,
  `TenLop` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `lop`
--

INSERT INTO `lop` (`MaLop`, `TenLop`) VALUES
('1', 'Thiet ke Website'),
('2', 'Cấu trúc dữ liệu'),
('3', 'Anh Văn');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nhanvien`
--

CREATE TABLE `nhanvien` (
  `MaNV` varchar(10) NOT NULL,
  `HoTen` varchar(50) DEFAULT NULL,
  `SDT` varchar(15) DEFAULT NULL,
  `QueQuan` varchar(50) NOT NULL,
  `GhiChu` varchar(100) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `nhanvien`
--

INSERT INTO `nhanvien` (`MaNV`, `HoTen`, `SDT`, `QueQuan`, `GhiChu`, `Password`) VALUES
('1', 'Admin', '0378006535', 'Can Tho', 'Admin', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phieudangky`
--

CREATE TABLE `phieudangky` (
  `MaPhieu` int(10) NOT NULL,
  `MaSV` varchar(10) DEFAULT NULL,
  `BatDau` date DEFAULT NULL,
  `KetThuc` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phong`
--

CREATE TABLE `phong` (
  `MaPhong` varchar(50) NOT NULL,
  `TenPhong` varchar(50) DEFAULT NULL,
  `DienTich` varchar(20) DEFAULT NULL,
  `SoGiuong` int(11) DEFAULT NULL,
  `SucChuaHienTai` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `phong`
--

INSERT INTO `phong` (`MaPhong`, `TenPhong`, `DienTich`, `SoGiuong`, `SucChuaHienTai`) VALUES
('1', ' A012', '23x24m', 4, 3),
('2', 'A02', '23x24', 4, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MaSV` varchar(50) NOT NULL,
  `TenSV` varchar(50) DEFAULT NULL,
  `SoDienThoai` varchar(15) DEFAULT NULL,
  `MaLop` varchar(10) DEFAULT NULL,
  `QueQuan` varchar(100) DEFAULT NULL,
  `PassWord` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `sinhvien`
--

INSERT INTO `sinhvien` (`MaSV`, `TenSV`, `SoDienThoai`, `MaLop`, `QueQuan`, `PassWord`) VALUES
('2', 'Đinh Anh Kiệt', '0742838222', '2', 'an giang', '123'),
('3', 'Đặng Thị Ngọc Bích', '01233334444', '3', 'Kiêng Giang', '123'),
('4', 'Phan Văn Trị', '0322347275', '2', 'Hà Nội', '123'),
('5', 'Trần Phú Thuần1', '0899698197', '1', 'Thốt Nốt', '123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tt_thuephong`
--

CREATE TABLE `tt_thuephong` (
  `MaThue` int(10) NOT NULL,
  `Thoigian` varchar(20) DEFAULT NULL,
  `ThanhToan` varchar(10) DEFAULT NULL,
  `MaPhong` varchar(50) DEFAULT NULL,
  `MaSV` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Đang đổ dữ liệu cho bảng `tt_thuephong`
--

INSERT INTO `tt_thuephong` (`MaThue`, `Thoigian`, `ThanhToan`, `MaPhong`, `MaSV`) VALUES
(142, ' 09-10-2023', 'yes', '1', '2'),
(143, ' 09-10-2023', 'no', '1', '3');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `lop`
--
ALTER TABLE `lop`
  ADD PRIMARY KEY (`MaLop`);

--
-- Chỉ mục cho bảng `nhanvien`
--
ALTER TABLE `nhanvien`
  ADD PRIMARY KEY (`MaNV`);

--
-- Chỉ mục cho bảng `phieudangky`
--
ALTER TABLE `phieudangky`
  ADD PRIMARY KEY (`MaPhieu`),
  ADD KEY `MaSV` (`MaSV`);

--
-- Chỉ mục cho bảng `phong`
--
ALTER TABLE `phong`
  ADD PRIMARY KEY (`MaPhong`);

--
-- Chỉ mục cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `sinhvien_ibfk_1` (`MaLop`);

--
-- Chỉ mục cho bảng `tt_thuephong`
--
ALTER TABLE `tt_thuephong`
  ADD PRIMARY KEY (`MaThue`),
  ADD KEY `tt_thuephong_ibfk_2` (`MaPhong`),
  ADD KEY `MaSV` (`MaSV`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `phieudangky`
--
ALTER TABLE `phieudangky`
  MODIFY `MaPhieu` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `tt_thuephong`
--
ALTER TABLE `tt_thuephong`
  MODIFY `MaThue` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `phieudangky`
--
ALTER TABLE `phieudangky`
  ADD CONSTRAINT `phieudangky_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`);

--
-- Các ràng buộc cho bảng `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`MaLop`) REFERENCES `lop` (`MaLop`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `tt_thuephong`
--
ALTER TABLE `tt_thuephong`
  ADD CONSTRAINT `tt_thuephong_ibfk_2` FOREIGN KEY (`MaPhong`) REFERENCES `phong` (`MaPhong`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tt_thuephong_ibfk_3` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

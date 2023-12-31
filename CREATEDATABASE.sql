CREATE DATABASE QUANLI_NHATHUOC;
GO
USE QUANLI_NHATHUOC;

-- Tạo bảng sản phẩm --

CREATE TABLE SANPHAM (
    MASP VARCHAR(10) UNIQUE,
    TENSP NVARCHAR(30) NOT NULL,
    CONGDUNG NVARCHAR(20) NOT NULL,
    DONVI_TINH NVARCHAR(10) NOT NULL,
    LIEUDUNG NVARCHAR(20) NOT NULL,
    TD_PHU VARCHAR(50),
    PRIMARY KEY (MASP)

);

-- Tạo bảng thuốc --

CREATE TABLE THUOC (
    MATHUOC VARCHAR(10) UNIQUE,
    TENTHUOC NVARCHAR(30) NOT NULL,
    HAMLUONG VARCHAR(5) NOT NULL,
    MASP VARCHAR(10) UNIQUE,
    PRIMARY KEY (MATHUOC),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);

-- Tạo bảng bệnh --

CREATE TABLE BENH (
    MABENH VARCHAR(10) NOT NULL,
    TENBENH NVARCHAR(45) NOT NULL,
    MATHUOC VARCHAR(10) UNIQUE,
    PRIMARY KEY (MABENH),
    FOREIGN KEY (MATHUOC) REFERENCES THUOC(MATHUOC)
);

-- Tạo bảng dược liệu --

CREATE TABLE DUOCLIEU (
    MADL VARCHAR(10) UNIQUE,
    TENDL NVARCHAR(40) NOT NULL,
    CHEPHAM NVARCHAR(40) NOT NULL,
    TENHC NVARCHAR(50) NOT NULL,
    MASP VARCHAR(10) UNIQUE,
    PRIMARY KEY (MADL),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);

-- Tạo bảng lô sản xuất --

CREATE TABLE LOSANXUAT (
    MA_LOSX VARCHAR(10) NOT NULL,
    MASP VARCHAR(10) UNIQUE,
    NGAYSX DATETIME NOT NULL,
    HSD DATETIME NOT NULL,
    PRIMARY KEY (MA_LOSX),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
);

-- Tạo bảng nhà cung cấp --

CREATE TABLE NHACUNGCAP (
    MANCC VARCHAR(10) NOT NULL,
    TENNCC NVARCHAR(45) NOT NULL,
    DIACHI NVARCHAR(100),
    SODIENTHOAI VARCHAR(15),
    PRIMARY KEY (MANCC)
);

-- Tạo bảng nhân viên --

CREATE TABLE NHANVIEN (
    MANV VARCHAR(10) NOT NULL,
    TENNV NVARCHAR(50) NOT NULL,
    SODIENTHOAI VARCHAR(15) NOT NULL,
    DIACHI NVARCHAR(100) NOT NULL,
    NGAYBATDAU DATETIME NOT NULL,
    VITRI NVARCHAR(100),
    PRIMARY KEY (MANV)
);

-- Tạo bảng khách hàng --

CREATE TABLE KHACHHANG (
    MAKH VARCHAR(10) NOT NULL,
    TENKH NVARCHAR(50) NOT NULL,
    SODIENTHOAI VARCHAR(15) NOT NULL,
    DIACHI NVARCHAR(100) NOT NULL,
    NGAYDANGKY DATETIME NOT NULL,
    LSMUAHANG NVARCHAR(100) NULL,
    PRIMARY KEY (MAKH)
);

-- Tạo bảng phiếu nhập kho --

CREATE TABLE PHIEUNHAPKHO (
    MAPHIEU VARCHAR(15) NOT NULL,
    MASP VARCHAR(10) UNIQUE,
    SOLUONG INT NOT NULL,
    MANCC VARCHAR(10) NOT NULL,
    MANV VARCHAR(10) NOT NULL,
    NGAYNHAP DATETIME NOT NULL,
    PRIMARY KEY (MAPHIEU),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (MANCC) REFERENCES NHACUNGCAP(MANCC),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
);

-- Tạo bảng hoá đơn --

CREATE TABLE HOADON (
    SOHD VARCHAR(7) NOT NULL,
    NGAYLAP DATETIME NOT NULL,
    MASP VARCHAR(10) NOT NULL,
    TONGGT VARCHAR(6) NOT NULL,
    PTTT NVARCHAR(20) NOT NULL,
    MABENH VARCHAR(10) NOT NULL,
    MANV VARCHAR(10) NOT NULL,
    MAKH VARCHAR(10) NOT NULL,
    SOLUONG_BR INT NOT NULL,
    PRIMARY KEY (SOHD),
    FOREIGN KEY (MABENH) REFERENCES BENH(MABENH),
    FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV),
    FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP),
    FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
);

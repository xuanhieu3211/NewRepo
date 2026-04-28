CREATE DATABASE QuanLyCongTrinh
GO
CREATE TABLE THANH_PHO
(
matp char(2) Primary Key,
tentp nvarchar(20)
)

CREATE TABLE NHAN_VIEN (
	manv		CHAR(3) PRIMARY KEY,
	honv		NVARCHAR(20) NOT NULL,
	tennv		NVARCHAR(10) NOT NULL,
	phai		NVARCHAR(3) CHECK (phai IN (N'Nam', N'Nữ')),
	ngaysinh 		DATE NOT NULL,
	mucluong		REAL DEFAULT (800000),
	macn		CHAR(3),
	manvquanly	CHAR(3),
)
CREATE TABLE CHI_NHANH (
macn char(3) primary key,
tencn nvarchar(30),
manvptr char (3),
ngaynhamchuc date not null
)

CREATE TABLE VPHONG_CN
(
macn char(3),
matp char(2)
primary key(macn, matp)
)

create table CONG_TRINH
(
mact char(4) primary key,
tenct nvarchar(30),
ngaybd date NOT NUll,
ngaykt date NOT NULL,
matp char(2),
macn char(3)
)

create table phan_cong
(
manv char(3),
mact char(4),
sogiotuan int,
primary key (manv, mact)
)

CREATE TABLE THAN_NHAN
(
manv char(3),
tenthannhan nvarchar(30),
ngaysinh date,
phai NVARCHAR(3) CHECK (phai IN (N'Nam', N'Nữ')),
moiquanhe Nvarchar(10),
primary key(manv, tenthannhan)
)
INSERT INTO THANH_PHO VALUEs ('01', N'Hà Nội');
INSERT INTO THANH_PHO VALUEs ('02', 'TPHCM');
INSERT INTO THANH_PHO VALUEs ('03', N'Đà Nẵng');
INSERT INTO THANH_PHO VALUEs ('04', N'Cần Thơ');

INSERT INTO NHAN_VIEN VALUEs ('N01', N'Trần Ngọc',N'An',N'Nam','1965/11/10',4500000,'C03','N02');
INSERT INTO NHAN_VIEN VALUEs ('N02', N'Lưu An',N'Tư',N'Nam','1980/12/10',5200000,'C03',NULL);
INSERT INTO NHAN_VIEN VALUEs ('N03', N'Lý Thanh',N'Ngọc',N'Nữ','1988/09/25',4300000,'C02','N04');
INSERT INTO NHAN_VIEN VALUEs ('N04', N'Lê Kim',N'Oanh',N'Nữ','1975/06/22',5000000,'C02',NULL);
INSERT INTO NHAN_VIEN VALUEs ('N05', N'Lý Văn',N'Nam',N'Nam','1988/03/07',4800000,'C03','N02');
INSERT INTO NHAN_VIEN VALUEs ('N06', N'Nguyễn Thị',N'Chín',N'Nữ','1968/07/16',3200000,'C03','N05');
INSERT INTO NHAN_VIEN VALUEs ('N07', N'Lê Văn',N'Bốn',N'Nam','1970/07/18',4500000,'C02','N04');
INSERT INTO NHAN_VIEN VALUEs ('N08', N'Lê Hùng',N'Sư',N'Nam','1965/12/25',6500000,'C01',NULL);

INSERT INTO CHI_NHANH VALUES ('C01',N'Chi nhánh 1','N08','2006/02/16');
INSERT INTO CHI_NHANH VALUES ('C02',N'Chi nhánh 2','N04','2005/12/10');
INSERT INTO CHI_NHANH VALUES ('C03',N'Chi nhánh 3','N02','2004/03/07');

INSERT INTO VPHONG_CN VALUES ('C01','01');
INSERT INTO VPHONG_CN VALUES ('C02','02');
INSERT INTO VPHONG_CN VALUES ('C03','03');
INSERT INTO VPHONG_CN VALUES ('C03','04');
INSERT INTO VPHONG_CN VALUES ('C03','01');

INSERT INTO CONG_TRINH VALUES ('CT01',N'Công trình số 1','2007/03/07','2007/05/15','03','c03');
INSERT INTO CONG_TRINH VALUES ('CT02',N'Công trình số 2','2007/02/16','2007/05/15','04','c03');
INSERT INTO CONG_TRINH VALUES ('CT03',N'Công trình số 3','2007/07/16','2007/07/18','01','c03');
INSERT INTO CONG_TRINH VALUES ('CT04',N'Công trình số 4','2007/07/18','2007/12/25','02','c02');
INSERT INTO CONG_TRINH VALUES ('CT05',N'Công trình số 5','2007/06/22','2007/12/25','01','c01');
INSERT INTO CONG_TRINH VALUES ('CT06',N'Công trình số 6','2007/06/22','2007/12/10','02','c02');

INSERT INTO PHAN_CONG VALUES ('N01','CT01',18);
INSERT INTO PHAN_CONG VALUES ('N01','CT02',30);
INSERT INTO PHAN_CONG VALUES ('N05','CT03',20);
INSERT INTO PHAN_CONG VALUES ('N06','CT04',26);
INSERT INTO PHAN_CONG VALUES ('N06','CT05',12);
INSERT INTO PHAN_CONG VALUES ('N02','CT01',12);
INSERT INTO PHAN_CONG VALUES ('N02','CT06',20);
INSERT INTO PHAN_CONG VALUES ('N02','CT02',18);
INSERT INTO PHAN_CONG VALUES ('N02','CT03',22);
INSERT INTO PHAN_CONG VALUES ('N02','CT04',32);
INSERT INTO PHAN_CONG VALUES ('N02','CT05',16);
INSERT INTO PHAN_CONG VALUES ('N03','CT06',8);
INSERT INTO PHAN_CONG VALUES ('N03','CT04',28);
INSERT INTO PHAN_CONG VALUES ('N07','CT04',12);
INSERT INTO PHAN_CONG VALUES ('N07','CT06',32);
INSERT INTO PHAN_CONG VALUES ('N04','CT06',24);
INSERT INTO PHAN_CONG VALUES ('N04','CT05',16);
INSERT INTO PHAN_CONG VALUES ('N08','CT05',18);

INSERT INTO THAN_NHAN VALUES ('N01',N'Trần Đình Toàn','1980/11/30',N'Nam',N'Con');
INSERT INTO THAN_NHAN VALUES ('N03',N'Lý Vệ','1990/01/30',N'Nam',N'Anh Ruột');
INSERT INTO THAN_NHAN VALUES ('N03',N'Lý Ngọc Nữ','1980/03/30',N'Nữ',N'Chị ruột');
INSERT INTO THAN_NHAN VALUES ('N06',N'Nguyễn A','1981/11/11',N'Nam',N'Con');
INSERT INTO THAN_NHAN VALUES ('N08',N'Lê Lựu','1983/05/30',N'Nam',N'Con nuôi');

ALTER TABLE CHI_NHANH
	ADD CONSTRAINT FK_CN_NV
		FOREIGN KEY (manvptr) REFERENCES NHAN_VIEN(manv)

ALTER TABLE CHI_NHANH
	ADD CONSTRAINT FK_CN_NV
		FOREIGN KEY (macn) REFERENCES NHAN_VIEN(macn)

ALTER TABLE CONG_TRINH
	ADD CONSTRAINT FK_CT_CN
		FOREIGN KEY (macn) REFERENCES CHI_NHANH(macn)

ALTER TABLE CONG_TRINH
	ADD CONSTRAINT FK_CT_TP
		FOREIGN KEY (matp) REFERENCES THANH_PHO(matp)


ALTER TABLE THAN_NHAN
	ADD CONSTRAINT FK_NT_NV
		FOREIGN KEY (manv) REFERENCES NHAN_VIEN(manv)

ALTER TABLE	VPHONG_CN
	ADD CONSTRAINT FK_VP_TP
		FOREIGN KEY (matp) REFERENCES THANH_PHO(matp)

ALTER TABLE VPHONG_CN
	ADD CONSTRAINT FK_VP_CN
		FOREIGN KEY (macn) REFERENCES CHI_NHANH(macn)

ALTER TABLE PHAN_CONG
	ADD CONSTRAINT FK_PC_NV
		FOREIGN KEY (manv) REFERENCES NHAN_VIEN(manv)

ALTER TABLE PHAN_CONG
	ADD CONSTRAINT FK_PC_CT
		FOREIGN KEY (mact) REFERENCES NHAN_VIEN(mact)

--a) Danh sách họ tên nhân viên và tên chi nhánh của những nhân viên có mức lương từ 4 000 000 đến 5 000 000
--cách 1
SELECT
nv.manv,
honv + ' ' + tennv AS hoten_nhanvien,
cn.tencn,
nv.mucluong
FROM NHAN_VIEN nv, CHI_NHANH cn
WHERE nv.mucluong <=5000000 and nv.mucluong >= 4000000

--cách 2
SELECT
nv.manv,
honv + ' ' + tennv AS hoten_nhanvien,
cn.tencn,
nv.mucluong
FROM NHAN_VIEN nv, CHI_NHANH cn
WHERE nv.mucluong BETWEEN 4000000 AND 5000000;

--b. Danh sách tất cả những nhân viên nữ trên 40 tuổi

SELECT
nv.manv,
nv.honv + ' ' + nv.tennv AS hoten_nhanvien,
nv.phai,
nv.ngaysinh
FROM NHAN_VIEN nv
WHERE nv.phai = N'Nữ' AND (YEAR(GETDATE()) - YEAR(ngaysinh)) > 40

--c. Danh sách tên những công trình đang phụ trách thi công của mỗi chi nhánh

SELECT
cn.macn,
ct.macn,
ct.mact,
ct.tenct
FROM CONG_TRINH ct, CHI_NHANH cn
WHERE ct.macn = cn.macn

--d. Danh sách mã số, họ tên và ngày nhậm chức của người phụ trách của từng chi nhánh

SELECT
cn.manvptr,
nv.honv + ' ' + nv.tennv AS hovatennhanvien,
cn.ngaynhamchuc,
cn.macn,
cn.tencn
FROM CHI_NHANH cn, NHAN_VIEN nv
WHERE nv.manv = cn.manvptr
 
--e. Danh sách mã số, họ tên nhân viên, mã công trình và tên công trình mà trong đó nhân viên tham gia công trình với thời gian làm việc hơn 25 giờ/tuần.
--Cách 1
SELECT
nv.manv,
nv.honv + ' ' + nv.tennv AS hovatennhanvien,
ct.mact,
ct.tenct,
pc.sogiotuan
FROM NHAN_VIEN nv, CONG_TRINH ct, phan_cong pc
WHERE nv.manv = pc.manv AND pc.mact = ct.mact AND pc.sogiotuan > 25

--Cách 2
SELECT
nv.manv,
nv.honv + ' ' + tennv AS hoten_nhanvien,
ct.mact,
ct.tenct,
pc.sogiotuan
FROM NHAN_VIEN nv 
JOIN PHAN_CONG pc ON pc.manv = nv.manv
JOIN CONG_TRINH ct on pc.mact = ct.mact
WHERE pc.sogiotuan > 25

--f. Danh sách mã số và tên của những công trình do các chi nhánh khác nhau thi công nhưng lại ở cùng thành phố. Mỗi cặp chỉ liệt kê 1 lần, ví dụ đã liệt kê (i, j) thì không liệt kê lại (j, i).

SELECT ct1.tenct, ct2.tenct
FROM CONG_TRINH ct1, CONG_TRINH ct2
WHERE ct1.macn > ct2.macn AND ct1.matp = ct2.matp

--g. Danh sách những mã số và tên công trình có địa điểm (thành phố) trùng với thành phố của chinhánh phụ trách thi công. 

SELECT
ct.tenct,
ct.matp,
cn.tencn,
vp.macn
FROM CONG_TRINH ct, VPHONG_CN vp, CHI_NHANH cn
WHERE ct.matp = vp.matp AND vp.macn = ct.macn AND vp.macn = cn.macn

--h)Danh sách họ tên nhân viên và họ tên người phụ trách chi nhánh của mỗi nhân viên.		

select nv.honv + ' ' + nv.tennv AS hovatennhanvien

from NHAN_VIEN nv inner join  CHI_NHANH cn on nv.manv = cn.manvptr
--i)Danh sách họ tên nhân viên và tên các công trình mà nhân viên có tham gia, nếu có. 

select nv.honv + ' ' + nv.tennv AS hovatennhanvien, ct.tenct
from NHAN_VIEN nv join  phan_cong pc on nv.manv = pc.manv join CONG_TRINH ct on pc.mact = ct.mact

--j)Danh sách tên công trình và tổng số giờ làm việc một tuần của tất cả các nhân viên tham gia từng công trình. 

SELECT
nv.manv,
ct.tenct,
SUM(sogiotuan) AS tonggio
FROM NHAN_VIEN nv
 JOIN phan_cong pc  ON nv.manv = pc.manv
 JOIN cong_trinh ct on ct.mact = pc.mact
GROUP BY nv.manv, ct.tenct
ORDER BY nv.manv ASC;

--k. Danh sách tên chi nhánh và lương trung bình của những nhân viên làm việc của mỗi chi nhánh. 

SELECT
cn.macn,
nv.manv,
AVG(mucluong) AS luongtrungbinhcuanhanvien 
FROM CHI_NHANH cn, NHAN_VIEN nv
WHERE cn.macn = nv.macn
GROUP BY nv.manv, cn.macn;

--Mức lương trung bình của tất cả những nhân viên nữ. 

SELECT
nv.manv,
nv.phai,
AVG(mucluong) AS luongtrungbinh
FROM NHAN_VIEN nv 
WHERE nv.phai = N'Nữ'
GROUP BY nv.manv, nv.phai;

--m.Danh sách tên chi nhánh và số lượng nhân viên tương ứng của chi nhánh mà có mức lương trung bình trên 4 500 000. 
 
 SELECT
cn.tencn,
cn.macn,
AVG(mucluong) AS luongtrungbinhcuanhanvien,
COUNT(manv) AS soluongnhanvien
FROM CHI_NHANH cn, NHAN_VIEN nv
WHERE cn.macn = nv.macn 
GROUP BY cn.macn, cn.tencn
HAVING AVG(mucluong) > 4500000;

--n. Danh sách mã số công trình mà trong đó tên nhân viên tham gia công trình hay tên người trưởng chi nhánh phụ trách công trình đó có 4 ký tự trở lên\
SELECT
pc.mact,
nv.tennv,
LEN(tennv) as Sokytu
FROM NHAN_VIEN nv, phan_cong pc
WHERE pc.manv = nv.manv AND LEN(tennv) >=4

--o. Danh sách mã số và họ tên nhân viên có mức lương trên mức lương trung bình của chi nhánh có tên ‘Chi nhánh 2’ 
SELECT 
nv.manv,
nv.honv+ ' ' + nv.tennv as hovatennv,
nv.mucluong,
cn2.tencn
FROM NHAN_VIEN nv, CHI_NHANH cn2
WHERE cn2.tencn <> N'Chi nhánh 2' AND 
nv.mucluong > ( 
SELECT AVG(nv2.mucluong)
FROM NHAN_VIEN nv2, CHI_NHANH cn
WHERE nv2.macn =cn.macn and cn.tencn = N'Chi nhánh 2'
)
ORDER BY nv.mucluong DESC;

--p. Danh sách tên chi nhánh và họ tên trưởng chi nhánh đứng đầu về số lượng nhân viên (yêu cầu tương tự cho đứng cuối). 
SELECT
    cn.TenCN,
    nv.HoNV + ' ' + nv.TenNV AS HoTenTruongCN,
    (SELECT COUNT(*) FROM NHAN_VIEN WHERE MaCN = cn.MaCN) AS SoNhanVien
FROM CHI_NHANH cn
JOIN NHAN_VIEN nv ON cn.MaNVPtr = nv.MaNV
ORDER BY SoNhanVien DESC;

--q. Danh sách mã số, họ tên nhân viên trùng tên với nhau. Mỗi cặp chỉ liệt kê 1 lần, ví dụ đã liệt kê (i,j) thì không liệt kê lại (j, i). 

SELECT nv1.manv, nv2.manv, nv1.honv+ ' ' + nv1.tennv as hovatennv, nv2.honv+ ' ' + nv2.tennv as hovatennv
FROM NHAN_VIEN nv1, NHAN_VIEN nv2
WHERE nv1.manv > nv2.manv AND nv1.honv+ ' ' + nv1.tennv = nv2.honv+ ' ' + nv2.tennv 
 --cach 2
 SELECT 
    nv1.MaNV AS MaNV1, 
    nv2.MaNV AS MaNV2, 
    nv1.HoNV + ' ' + nv1.TenNV AS HoTenNV
FROM NHAN_VIEN nv1
JOIN NHAN_VIEN nv2 ON nv1.TenNV = nv2.TenNV AND nv1.HoNV = nv2.HoNV
WHERE nv1.MaNV > nv2.MaNV;
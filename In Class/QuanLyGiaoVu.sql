-- Tạo database quản lí giáo vụ
CREATE DATABASE QUANLIGIAOVU

USE QUANLIGIAOVU

-- Tạo các quan hệ trong database
CREATE TABLE HOCVIEN(
	 MAHV char(5) PRIMARY KEY,
	 HO varchar(40),
	 TEN varchar(10),
	 NGSINH smalldatetime,
	 GIOITINH varchar(3),
	 NOISINH varchar(40),
	 MALOP char(4),
);

ALTER TABLE HOCVIEN
ALTER COLUMN MALOP CHAR (3)

ALTER TABLE HOCVIEN ADD
CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)

CREATE TABLE KHOA(
	MAKHOA varchar(4) PRIMARY KEY,
	TENKHOA varchar(40),
	NGTLAP smalldatetime,
	TRGKHOA char(4),
);

CREATE TABLE MONHOC(
	MAMH VARCHAR(10) PRIMARY KEY,
	TENMH VARCHAR(40),
	TCLT TINYINT,
	TCTH TINYINT,
	MAKHOA VARCHAR(4) REFERENCES KHOA(MAKHOA),
);

CREATE TABLE DIEUKIEN(
	MAMH VARCHAR(10) REFERENCES MONHOC(MAMH),
	MAMH_TRUOC VARCHAR(10) REFERENCES MONHOC(MAMH),
	PRIMARY KEY (MAMH, MAMH_TRUOC),
);

CREATE TABLE GIAOVIEN(
	MAGV CHAR(4) PRIMARY KEY,
	HOTEN VARCHAR(40),
	HOCVI VARCHAR(10),
	HOCHAM VARCHAR(10),
	GIOITINH VARCHAR(3),
	NGSINH SMALLDATETIME,
	NGVL SMALLDATETIME,
	HESO NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4) REFERENCES KHOA(MAKHOA),
);

CREATE TABLE LOP(
	MALOP CHAR(3) PRIMARY KEY,
	TENLOP VARCHAR(40),
	TRGLOP CHAR(5) REFERENCES HOCVIEN(MAHV),
	SISO TINYINT,
	MAGVCN CHAR(4) REFERENCES GIAOVIEN(MAGV),
);

CREATE TABLE GIANGDAY(
	MALOP CHAR(3) REFERENCES LOP(MALOP),
	MAMH VARCHAR(10) REFERENCES MONHOC(MAMH),
	MAGV CHAR(4) REFERENCES GIAOVIEN(MAGV),
	HOCKY TINYINT,
	NAM SMALLINT,
	TUNGAY SMALLDATETIME,
	DENNGAY SMALLDATETIME,
	PRIMARY KEY (MALOP, MAMH),
);

CREATE TABLE KETQUATHI(
	MAMH VARCHAR(10) REFERENCES MONHOC(MAMH),
	MAHV CHAR(5) REFERENCES HOCVIEN(MAHV),
	LANTHI TINYINT,
	NGTHI SMALLDATETIME,
	DIEM NUMERIC(4,2),
	KQUA VARCHAR(10),
	PRIMARY KEY(MAHV, MAMH, LANTHI),
);

ALTER TABLE KHOA ADD
CONSTRAINT FK_TGK_GV FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)

-- Nhập dữ liệu cho cơ sở dữ liệu
INSERT KHOA (MAKHOA, TENKHOA, NGTLAP, TRGKHOA) VALUES 
(N'KHMT', N'Khoa hoc may tinh', CAST(N'2005-06-07T00:00:00.000' AS DateTime), NULL),
(N'HTTT', N'He thong thong tin', CAST(N'2005-06-07T00:00:00.000' AS DateTime), NULL),
(N'CNPM', N'Cong nghe phan mem', CAST(N'2005-06-07T00:00:00.000' AS DateTime), NULL),
(N'MTT', N'Mang va truyen thong', CAST(N'2005-10-20T00:00:00.000' AS DateTime), NULL),
(N'KTMT', N'Ky thuat may tinh', CAST(N'2005-12-20T00:00:00.000' AS DateTime), NULL);

INSERT MONHOC (MAMH, TENMH, TCLT, TCTH, MAKHOA) VALUES
(N'THDC', N'Tin hoc dai cuong', 4, 1, N'KHMT'),
(N'CTRR', N'Cau truc roi rac', 5, 0, N'KHMT'),
(N'CSDL', N'Co so du lieu', 3, 1, N'HTTT'),
(N'CTDLGT', N'Cau truc du lieu va giai thuat', 3, 1, N'KHMT'),
(N'PTTKTT', N'Phan tich thiet ke thuat toan', 3, 0, N'KHMT'),
(N'DHMT', N'Do hoa may tinh', 3, 1, N'KHMT'),
(N'KTMT', N'Kien truc may tinh', 3, 0, N'KTMT'),
(N'TKCSDL', N'Thiet ke co so du lieu', 3, 1, N'HTTT'),
(N'PTTKHTTT', N'Phan tich thiet ke he thong thong tin', 4, 1, N'HTTT'),
(N'HDH', N'He dieu hanh', 4, 0, N'KTMT'),
(N'NMCNPM', N'Nhap mon cong nghe phan mem', 3, 0, N'CNPM'),
(N'LTCFW', N'Lap trinh C for win', 3, 1, N'CNPM'),
(N'LTHDT', N'Lap trinh huong doi tuong', 3, 1, N'CNPM');

INSERT DIEUKIEN (MAMH, MAMH_TRUOC) VALUES
(N'CSDL', N'CTRR'),
(N'CSDL', N'CTDLGT'),
(N'CTDLGT', N'THDC'),
(N'PTTKTT', N'THDC'),
(N'PTTKTT', N'CTDLGT'),
(N'DHMT', N'THDC'),
(N'LTHDT', N'THDC'),
(N'PTTKHTTT', N'CSDL');

INSERT GIAOVIEN (MAGV, HOTEN, HOCVI, HOCHAM, GIOITINH, NGSINH, NGVL, HESO, MUCLUONG, MAKHOA) VALUES
(N'GV01', N'Ho Thanh Son', N'PTS', N'GS', N'Nam', '1950-05-02', '2004-01-11', 5, 2250000, N'KHMT'),
(N'GV02', N'Tran Tam Thanh', N'TS', N'PGS', N'Nam', '1965-12-17', '2004-04-20', 4.5, 2025000, N'HTTT'),
(N'GV03', N'Do Nghiem Phung', N'TS', N'GS', N'Nu', '1950-08-01', '2004-09-23', 4, 1800000, N'CNPM'),
(N'GV04', N'Tran Nam Son', N'TS', N'PGS', N'Nam', '1961-02-22', '2005-01-12', 4.5, 2025000, N'KTMT'),
(N'GV05', N'Mai Thanh Danh', N'ThS', N'GV', N'Nam', '1958-03-12', '2005-01-12', 3, 1350000, N'HTTT'),
(N'GV06', N'Tran Doan Hung', N'TS', N'GV', N'Nam', '1953-03-11', '2005-01-12', 4.5, 2025000, N'KHMT'),
(N'GV07', N'Nguyen Minh Tien', N'ThS', N'GV', N'Nam', '1971-11-23', '2005-03-01', 4, 1800000, N'KHMT'),
(N'GV08', N'Le Thi Tran', N'KS', N'Null', N'Nu', '1974-03-26', '2005-03-01', 1.69, 760500, N'KHMT'),
(N'GV09', N'Nguyen To Lan', N'ThS', N'GV', N'Nu', '1966-12-31', '2005-03-01', 4, 1800000, N'HTTT'),
(N'GV10', N'Le Tran Anh Loan', N'KS', N'Null', N'Nu', '1972-07-17', '2005-03-01', 1.86, 837000, N'CNPM'),
(N'GV11', N'Ho Thanh Tung', N'CN', N'GV', N'Nam', '1980-01-12', '2005-05-15', 2.67, 1201500, N'MTT'),
(N'GV12', N'Tran Van Anh', N'CN', N'Null', N'Nu', '1981-03-29', '2005-05-15', 1.69, 760500, N'CNPM'),
(N'GV13', N'Nguyen Linh Dan', N'CN', N'Null', N'Nu', '1980-05-23', '2005-05-15', 1.69, 760500, N'KTMT'),
(N'GV14', N'Truong Minh Chau', N'ThS', N'GV', N'Nu', '1976-11-30', '2005-05-15', 3, 1350000, N'MTT'),
(N'GV15', N'Le Ha Thanh', N'ThS', N'GV', N'Nam', '1978-05-04', '2005-05-15', 3, 1350000, N'KHMT');

INSERT LOP (MALOP, TENLOP, TRGLOP, SISO, MAGVCN) VALUES
(N'K11', N'Lop 1 khoa 1', N'K1108', 11, N'GV07'),
(N'K12', N'Lop 2 khoa 1', N'K1205', 12, N'GV09'),
(N'K13', N'Lop 3 khoa 1', N'K1305', 12, N'GV14');

INSERT HOCVIEN (MAHV, HO, TEN, NGSINH, GIOITINH, NOISINH, MALOP) VALUES
(N'K1101', N'Nguyen Van', N'A', '1986-01-27', N'Nam', N'TpHCM', N'K11'),
(N'K1102', N'Tran Ngoc', N'Han', '1986-03-14', N'Nu', N'Kien Giang', N'K11'),
(N'K1103', N'Ha Duy', N'Lap', '1986-04-18', N'Nam', N'Nghe An', N'K11'),
(N'K1104', N'Tran Ngoc', N'Linh', '1986-03-30', N'Nu', N'Tay Ninh', N'K11'),
(N'K1105', N'Tran Minh', N'Long', '1986-02-27', N'Nam', N'TpHCM', N'K11'),
(N'K1106', N'Le Nhat', N'Minh', '1986-01-24', N'Nam', N'TpHCM', N'K11'),
(N'K1107', N'Nguyen Nhu', N'Nhut', '1986-01-27', N'Nam', N'Ha Noi', N'K11'),
(N'K1108', N'Nguyen Manh', N'Tam', '1986-02-27', N'Nam', N'Kien Giang', N'K11'),
(N'K1109', N'Phan Thi Thanh', N'Tam', '1986-01-27', N'Nu', N'Vinh Long', N'K11'),
(N'K1110', N'Le Hoai', N'Thuong', '1986-02-05', N'Nu', N'Can Tho', N'K11'),
(N'K1111', N'Le Ha', N'Vinh', '1986-12-25', N'Nam', N'Vinh Long', N'K11'),
(N'K1201', N'Nguyen Van', N'B', '1986-02-11', N'Nam', N'TpHCM', N'K12'),
(N'K1202', N'Nguyen Thi Kim', N'Duyen', '1986-01-18', N'Nu', N'TpHCM', N'K12'),
(N'K1203', N'Tran Thi Kim', N'Duyen', '1986-09-17', N'Nu', N'TpHCM', N'K12'),
(N'K1204', N'Truong My', N'Hanh', '1986-05-19', N'Nu', N'Dong Nai', N'K12'),
(N'K1205', N'Nguyen Thanh', N'Nam', '1986-04-17', N'Nam', N'TpHCM', N'K12'),
(N'K1206', N'Nguyen Thi Truc', N'Thanh', '1986-03-04', N'Nu', N'Kien Giang', N'K12'),
(N'K1207', N'Tran Thi Bich', N'Thuy', '1986-02-08', N'Nu', N'Nghe An', N'K12'),
(N'K1208', N'Huynh Thi Kim', N'Trieu', '1986-04-08', N'Nu', N'Tay Ninh', N'K12'),
(N'K1209', N'Pham Thanh', N'Trieu', '1986-02-23', N'Nam', N'TpHCM', N'K12'),
(N'K1210', N'Ngo Thanh', N'Tuan', '1986-02-14', N'Nam', N'TpHCM', N'K12'),
(N'K1211', N'Do Thi', N'Xuan', '1986-03-09', N'Nu', N'Ha Noi', N'K12'),
(N'K1212', N'Le Thi Phi', N'Yen', '1986-03-12', N'Nu', N'TpHCM', N'K12'),
(N'K1301', N'Nguyen Thi Kim', N'Cuc', '1986-06-09', N'Nu', N'Kien Giang', N'K13'),
(N'K1302', N'Truong Thi My', N'Hien', '1986-03-18', N'Nu', N'Nghe An', N'K13'),
(N'K1303', N'Le Duc', N'Hien', '1986-03-21', N'Nam', N'Tay Ninh', N'K13'),
(N'K1304', N'Le Quang', N'Hien', '1986-04-18', N'Nam', N'TpHCM', N'K13'),
(N'K1305', N'Le Thi', N'Huong', '1986-03-27', N'Nu', N'TpHCM', N'K13'),
(N'K1306', N'Nguyen Thai', N'Huu', '1986-03-30', N'Nam', N'Ha Noi', N'K13'),
(N'K1307', N'Tran Minh', N'Man', '1986-05-28', N'Nam', N'TpHCM', N'K13'),
(N'K1308', N'Nguyen Hieu', N'Nghia', '1986-04-08', N'Nam', N'Kien Giang', N'K13'),
(N'K1309', N'Nguyen Trung', N'Nghia', '1987-01-18', N'Nam', N'Nghe An', N'K13'),
(N'K1310', N'Tran Thi Hong', N'Tham', '1986-04-22', N'Nu', N'Tay Ninh', N'K13'),
(N'K1311', N'Tran Minh', N'Thuc', '1986-04-04', N'Nam', N'TpHCM', N'K13'),
(N'K1312', N'Nguyen Thi Kim', N'Yen', '1986-09-07', N'Nu', N'TpHCM', N'K13');

INSERT GIANGDAY (MALOP, MAMH, MAGV, HOCKY, NAM, TUNGAY, DENNGAY) VALUES
(N'K11', N'THDC', N'GV07', 1, 2006, '2006-01-02', '2006-05-12'),
(N'K12', N'THDC', N'GV06', 1, 2006, '2006-01-02', '2006-05-12'),
(N'K13', N'THDC', N'GV15', 1, 2006, '2006-01-02', '2006-05-12'),
(N'K11', 'CTRR', N'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
(N'K12', N'CTRR', N'GV02', 1, 2006, '2006-01-09', '2006-05-17'),
(N'K13', N'CTRR', N'GV08', 1, 2006, '2006-01-09', '2006-05-17'),
(N'K11', N'CSDL', N'GV05', 2, 2006, '2006-06-01', '2006-07-15'),
(N'K12', N'CSDL', N'GV09', 2, 2006, '2006-06-01', '2006-07-15'),
(N'K13', N'CTDLGT', N'GV15', 2, 2006, '2006-06-01', '2006-07-15'),
(N'K13', N'CSDL', N'GV05', 3, 2006, '2006-08-01', '2006-12-15'),
(N'K13', N'DHMT', N'GV07', 3, 2006, '2006-08-01', '2006-12-15'),
(N'K11', N'CTDLGT', N'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
(N'K12', N'CTDLGT', N'GV15', 3, 2006, '2006-08-01', '2006-12-15'),
(N'K11', N'HDH', N'GV04', 1, 2007, '2007-01-02', '2007-02-18'),
(N'K12', N'HDH', N'GV04', 1, 2007, '2007-01-02', '2007-03-20'),
(N'K11', N'DHMT', N'GV07', 1, 2007, '2007-02-18', '2007-03-20');

INSERT KETQUATHI (MAHV, MAMH, LANTHI, NGTHI, DIEM, KQUA) VALUES
(N'K1101', N'CSDL', 1, '2006-07-20', 10, N'Dat'),
(N'K1101', N'CTDLGT', 1, '2006-12-28', 9, N'Dat'),
(N'K1101', N'THDC', 1, '2006-05-20', 9, N'Dat'),
(N'K1101', N'CTRR', 1, '2006-05-13', 9.5, N'Dat'),
(N'K1102', N'CSDL', 1, '2006-07-20', 4, N'Khong Dat'),
(N'K1102', N'CSDL', 2, '2006-07-27', 4.25, N'Khong Dat'),
(N'K1102', N'CSDL', 3, '2006-08-10', 4.5, N'Khong Dat'),
(N'K1102', N'CTDLGT', 1, '2006-12-28', 4.5, N'Khong Dat'),
(N'K1102', N'CTDLGT', 2, '2007-01-05', 4, N'Khong Dat'),
(N'K1102', N'CTDLGT', 3, '2007-01-15', 6, N'Dat'),
(N'K1102', N'THDC', 1, '2006-05-20', 5, N'Dat'),
(N'K1102', N'CTRR', 1, '2006-05-13', 7, N'Dat'),
(N'K1103', N'CSDL', 1, '2006-07-20', 3.5, N'Khong Dat'),
(N'K1103', N'CSDL', 2, '2006-07-27', 8.25, N'Dat'),
(N'K1103', N'CTDLGT', 1, '2006-12-28', 7, N'Dat'),
(N'K1103', N'THDC', 1, '2006-05-20', 8, N'Dat'),
(N'K1103', N'CTRR', 1, '2006-05-13', 6.5, N'Dat'),
(N'K1104', N'CSDL', 1, '2006-07-20', 3.75, N'Khong Dat'),
(N'K1104', N'CTDLGT', 1, '2006-12-28', 4, N'Khong Dat'),
(N'K1104', N'THDC', 1, '2006-05-20', 4, N'Khong Dat'),
(N'K1104', N'CTRR', 1, '2006-05-13', 4, N'Khong Dat'),
(N'K1104', N'CTRR', 2, '2006-05-20', 3.5, N'Khong Dat'),
(N'K1104', N'CTRR', 3, '2006-06-30', 4, N'Khong Dat'),
(N'K1201', N'CSDL', 1, '2006-07-20', 6, N'Dat'),
(N'K1201', N'CTDLGT', 1, '2006-12-28', 5, N'Dat'),
(N'K1201', N'THDC', 1, '2006-05-20', 8.5, N'Dat'),
(N'K1201', N'CTRR', 1, '2006-05-13', 9, N'Dat'),
(N'K1202', N'CSDL', 1, '2006-07-20', 8, N'Dat'),
(N'K1202', N'CTDLGT', 1, '2006-12-28', 4, N'Khong Dat'),
(N'K1202', N'CTDLGT', 2, '2007-01-05', 5, N'Dat'),
(N'K1202', N'THDC', 1, '2006-05-20', 4, N'Khong Dat'),
(N'K1202', N'THDC', 2, '2006-05-27', 4, N'Khong Dat'),
(N'K1202', N'CTRR', 1, '2006-05-13', 3, N'Khong Dat'),
(N'K1202', N'CTRR', 2, '2006-05-20', 4, N'Khong Dat'),
(N'K1202', N'CTRR', 3, '2006-06-30', 6.25, N'Dat'),
(N'K1203', N'CSDL', 1, '2006-07-20', 9.25, N'Dat'),
(N'K1203', N'CTDLGT', 1, '2006-12-28', 9.5, N'Dat'),
(N'K1203', N'THDC', 1, '2006-05-20', 10, N'Dat'),
(N'K1203', N'CTRR', 1, '2006-05-13', 10, N'Dat'),
(N'K1204', N'CSDL', 1, '2006-07-20', 8.5, N'Dat'),
(N'K1204', N'CTDLGT', 1, '2006-12-28', 6.75, N'Dat'),
(N'K1204', N'THDC', 1, '2006-05-20', 4, N'Khong Dat'),
(N'K1204', N'CTRR', 1, '2006-05-13', 6, N'Dat'),
(N'K1301', N'CSDL', 1, '2006-12-20', 4.25, N'Khong Dat'),
(N'K1301', N'CTDLGT', 1, '2006-07-25', 8, N'Dat'),
(N'K1301', N'THDC', 1, '2006-05-20', 7.75, N'Dat'),
(N'K1301', N'CTRR', 1, '2006-05-13', 8, N'Dat'),
(N'K1302', N'CSDL', 1, '2006-12-20', 6.75, N'Dat'),
(N'K1302', N'CTDLGT', 1, '2006-07-25', 5, N'Dat'),
(N'K1302', N'THDC', 1, '2006-05-20', 8, N'Dat'),
(N'K1302', N'CTRR', 1, '2006-05-13', 8.5, N'Dat'),
(N'K1303', N'CSDL', 1, '2006-12-20', 4, N'Khong Dat'),
(N'K1303', N'CTDLGT', 1, '2006-07-25', 4.5, N'Khong Dat'),
(N'K1303', N'CTDLGT', 2, '2006-08-07', 4, N'Khong Dat'),
(N'K1303', N'CTDLGT', 3, '2006-08-15', 4.25, N'Khong Dat'),
(N'K1303', N'THDC', 1, '2006-05-20', 4.5, N'Khong Dat'),
(N'K1303', N'CTRR', 1, '2006-05-13', 3.25, N'Khong Dat'),
(N'K1303', N'CTRR', 2, '2006-05-20', 5, N'Dat'),
(N'K1304', N'CSDL', 1, '2006-12-20', 7.75, N'Dat'),
(N'K1304', N'CTDLGT', 1, '2006-07-25', 9.75, N'Dat'),
(N'K1304', N'THDC', 1, '2006-05-20', 5.5, N'Dat'),
(N'K1304', N'CTRR', 1, '2006-05-13', 5, N'Dat'),
(N'K1305', N'CSDL', 1, '2006-12-20', 9.25, N'Dat'),
(N'K1305', N'CTDLGT', 1, '2006-07-25', 10, N'Dat'),
(N'K1305', N'THDC', 1, '2006-05-20', 8, N'Dat'),
(N'K1305', N'CTRR', 1, '2006-05-13', 10, N'Dat');

UPDATE KHOA SET TRGKHOA = N'GV01' 
WHERE MAKHOA = N'KHMT'

UPDATE KHOA SET TRGKHOA = N'GV02' 
WHERE MAKHOA = N'HTTT'

UPDATE KHOA SET TRGKHOA = N'GV03' 
WHERE MAKHOA = N'CNPM'

UPDATE KHOA SET TRGKHOA = N'GV04' 
WHERE MAKHOA = N'MTT'

UPDATE KHOA SET TRGKHOA = N'Null'
WHERE MAKHOA = N'KTMT'

-- 3. Thuộc tính của GIOITINH chỉ có giá trị là "Nam" hoặc "Nữ".
ALTER TABLE HOCVIEN ADD
CONSTRAINT CK_GT_HV CHECK (GIOITINH IN ('Nam', 'Nu'))

ALTER TABLE GIAOVIEN ADD
CONSTRAINT CK_GT_GV CHECK (GIOITINH IN ('Nam', 'Nu'))

-- 4. Điểm số của một lần thi có giá trị từ 0 đến 10 và cần lưu đến 2 số lẽ (VD: 6.22).
ALTER TABLE KETQUATHI ADD 
CONSTRAINT CK_DIEM CHECK (
	DIEM BETWEEN 0 AND 10 AND
	LEN(SUBSTRING(CAST(DIEM AS VARCHAR), CHARINDEX('.', DIEM) + 1, 1000)) >= 2
)

-- 5. Kết quả thi là “Dat” nếu điểm từ 5 đến 10  và “Khong dat” nếu điểm nhỏ hơn 5.
ALTER TABLE KETQUATHI ADD 
CONSTRAINT CK_KQUA CHECK (KQUA = IIF(DIEM BETWEEN 5 AND 10, 'Dat', 'Khong dat'))

-- 6. Học viên thi một môn tối đa 3 lần.
ALTER TABLE KETQUATHI ADD
CONSTRAINT CK_SOLANTHI CHECK (LANTHI <= 3)

-- 7. Học kì chỉ có giá trị từ 1 đến 3.
ALTER TABLE GIANGDAY ADD
CONSTRAINT CK_HOCKY CHECK (HOCKY BETWEEN 1 AND 3)

-- 8. Học vị của giáo viên chỉ có thể là "CN", "KS", "ThS", "TS", "PTS".
ALTER TABLE GIAOVIEN ADD
CONSTRAINT CK_HOCVI CHECK (HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS'))
--LAB2
-- Nhập dữ liệu cho KHOA --
INSERT INTO KHOA VALUES ('KHMT','Khoa hoc may tinh','6/7/2005','GV01'),
('HTTT','He thong thong tin','6/7/2005','GV02'),
('CNPM','Cong nghe phan mem','6/7/2005','GV04'),
('MTT','Mang va truyen thong','10/20/2005','GV03'),
('KTMT','Ky thuat may tinh','12/20/2005','')
-- Nhập dữ liệu cho LOP --
INSERT INTO LOP VALUES('K11','Lop 1 khoa 1','K1108',11,'GV07'),
('K12','Lop 2 khoa 1','K1205',12,'GV09'),
('K13','Lop 3 khoa 1','K1305',12,'GV14')
-- Nhập dữ liệu cho MONHOC --
INSERT INTO MONHOC VALUES('THDC','Tin hoc dai cuong',4,1,'KHMT'),
('CTRR','Cau truc roi rac',5,2,'KHMT'),
('CSDL','Co so du lieu',3,1,'HTTT'),
('CTDLGT','Cau truc du lieu va giai thuat',3,1,'KHMT'),
('PTTKTT','Phan tich thiet ke thuat toan',3,0,'KHMT'),
('DHMT','Do hoa may tinh',3,1,'KHMT'),
('KTMT','Kien truc may tinh',3,0,'KTMT'),
('TKCSDL','Thiet ke co so du lieu',3,1,'HTTT'),
('PTTKHTTT','Phan tich thiet ke he thong thong tin',4,1,'HTTT'),
('HDH','He dieu hanh',4,1,'KTMT'),
('NMCNPM','Nhap mon cong nghe phan mem',3,0,'CNPM'),
('LTCFW','Lap trinh C for win',3,1,'CNPM'),
('LTHDT','Lap trinh huong doi tuong',3,1,'CNPM')
-- Nhập dữ liệu cho GIANGDAY --
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'1/2/2006','5/12/2006'),
('K12','THDC','GV06',1,2006,'1/2/2006','5/12/2006'),
('K13','THDC','GV15',1,2006,'1/2/2006','5/12/2006'),
('K11','CTRR','GV02',1,2006,'1/9/2006','5/17/2006'),
('K12','CTRR','GV02',1,2006,'1/9/2006','5/17/2006'),
('K13','CTRR','GV08',1,2006,'1/9/2006','5/17/2006'),
('K11','CSDL','GV05',2,2006,'6/1/2006','7/15/2006'),
('K12','CSDL','GV09',2,2006,'6/1/2006','7/15/2006'),
('K13','CTDLGT','GV15',2,2006,'6/1/2006','7/15/2006'),
('K13','CSDL','GV05',3,2006,'8/1/2006','12/15/2006'),
('K13','DHMT','GV07',3,2006,'8/1/2006','12/15/2006'),
('K11','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006'),
('K12','CTDLGT','GV15',3,2006,'8/1/2006','12/15/2006'),
('K11','HDH','GV04',1,2007,'1/2/2007','2/18/2007'),
('K12','HDH','GV04',1,2007,'1/2/2007','3/20/2007'),
('K11','DHMT','GV07',1,2007,'2/18/2007','3/20/2007')
-- Nhập dữ liệu cho GIAOVIEN --
INSERT INTO GIAOVIEN VALUES('GV01','Ho Thanh Son','PTS','GS','Nam','5/2/1950','1/11/2004',5.00,2250000,'KHMT'),
('GV02','Tran Tam Thanh','TS','PGS','Nam','12/17/1965','4/20/2004',4.50,2025000,'HTTT'),
('GV03','Do Nghiem Phung','TS','GS','Nu','8/1/1950','9/23/2004',4.00,1800000,'CNPM'),
('GV04','Tran Nam Son','TS','PGS','Nam','2/22/1961','1/12/2005',4.50,2025000,'KTMT'),
('GV05','Mai Thanh Danh','ThS','GV','Nam','3/12/1958','1/12/2005',3.00,1350000,'HTTT'),
('GV06','Tran Doan Hung','TS','GV','Nam','3/11/1953','1/12/2005',4.50,2025000,'KHMT'),
('GV07','Nguyen Minh Tien','ThS','GV','Nam','11/23/1971','3/1/2005',4.00,1800000,'KHMT'),
('GV08','Le Thi Tran','KS','','Nu','3/26/1974','3/1/2005',1.69,760500,'KHMT'),
('GV09','Nguyen To Lan','ThS','GV','Nu','12/31/1966','3/1/2005',4.00,1800000,'HTTT'),
('GV10','Le Tran Anh Loan','KS','','Nu','7/17/1972','3/1/2005',1.86,837000,'CNPM'),
('GV11','Ho Thanh Tung','CN','GV','Nam','1/12/1980','5/15/2005',2.67,1201500,'MTT'),
('GV12','Tran Van Anh','CN','','Nu','3/29/1981','5/15/2005',1.69,760500,'CNPM'),
('GV13','Nguyen Linh Dan','CN','','Nu','5/23/1980','5/15/2005',1.69,760500,'KTMT'),
('GV14','Truong Minh Chau','ThS','GV','Nu','11/30/1976','5/15/2005',3.00,1350000,'MTT'),
('GV15','Le Ha Thanh','ThS','GV','Nam','5/4/1978','5/15/2005',3.00,1350000,'KHMT')
-- NHẬP DỮ LIỆU CHO DIEUKIEN --
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR'),
('CSDL','CTDLGT'),
('CTDLGT','THDC'),
('PTTKTT','THDC'),
('PTTKTT','CTDLGT'),
('DHMT','THDC'),
('LTHDT','THDC'),
('PTTKHTTT','CSDL')
-- Nhập dữ liệu cho KETQUATHI --
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'7/20/2006',10.00,'Dat'),
('K1101','CTDLGT',1,'12/28/2006',9.00,'Dat'),
('K1101','THDC',1,'5/20/2006',9.00,'Dat'),
('K1101','CTRR',1,'5/13/2006',9.50,'Dat'),
('K1102','CSDL',1,'7/20/2006',4.00,'Khong Dat'),
('K1102','CSDL',2,'7/27/2006',4.25,'Khong Dat'),
('K1102','CSDL',3,'8/10/2006',4.50,'Khong Dat'),
('K1102','CTDLGT',1,'12/28/2006',4.50,'Khong Dat'),
('K1102','CTDLGT',2,'1/5/2007',4.00,'Khong Dat'),
('K1102','CTDLGT',3,'1/15/2007',6.00,'Dat'),
('K1102','THDC',1,'5/20/2006',5.00,'Dat'),
('K1102','CTRR',1,'5/13/2006',7.00,'Dat'),
('K1103','CSDL',1,'7/20/2006',3.50,'Khong Dat'),
('K1103','CSDL',2,'7/27/2006',8.25,'Dat'),
('K1103','CTDLGT',1,'12/28/2006',7.00,'Dat'),
('K1103','THDC',1,'5/20/2006',8.00,'Dat'),
('K1103','CTRR',1,'5/13/2006',6.50,'Dat'),
('K1104','CSDL',1,'7/20/2006',3.75,'Khong Dat'),
('K1104','CTDLGT',1,'12/28/2006',4.00,'Khong Dat'),
('K1104','THDC',1,'5/20/2006',4.00,'Khong Dat'),
('K1104','CTRR',1,'5/13/2006',4.00,'Khong Dat'),
('K1104','CTRR',2,'5/20/2006',3.50,'Khong Dat'),
('K1104','CTRR',3,'6/30/2006',4.00,'Khong Dat'),
('K1201','CSDL',1,'7/20/2006',6.00,'Dat'),
('K1201','CTDLGT',1,'12/28/2006',5.00,'Dat'),
('K1201','THDC',1,'5/20/2006',8.50,'Dat'),
('K1201','CTRR',1,'5/13/2006',9.00,'Dat'),
('K1202','CSDL',1,'7/20/2006',8.00,'Dat'),
('K1202','CTDLGT',1,'12/28/2006',4.00,'Khong Dat'),
('K1202','CTDLGT',2,'1/5/2007',5.00,'Dat'),
('K1202','THDC',1,'5/20/2006',4.00,'Khong Dat'),
('K1202','THDC',2,'5/27/2006',4.00,'Khong Dat'),
('K1202','CTRR',1,'5/13/2006',3.00,'Khong Dat'),
('K1202','CTRR',2,'5/20/2006',4.00,'Khong Dat'),
('K1202','CTRR',3,'6/30/2006',6.25,'Dat'),
('K1203','CSDL',1,'7/20/2006',9.25,'Dat'),
('K1203','CTDLGT',1,'12/28/2006',9.50,'Dat'),
('K1203','THDC',1,'5/20/2006',10.00,'Dat'),
('K1203','CTRR',1,'5/13/2006',10.00,'Dat'),
('K1204','CSDL',1,'7/20/2006',8.50,'Dat'),
('K1204','CTDLGT',1,'12/28/2006',6.75,'Dat'),
('K1204','THDC',1,'5/20/2006',4.00,'Khong Dat'),
('K1204','CTRR',1,'5/13/2006',6.00,'Dat'),
('K1301','CSDL',1,'12/20/2006',4.25,'Khong Dat'),
('K1301','CTDLGT',1,'7/25/2006',8.00,'Dat'),
('K1301','THDC',1,'5/20/2006',7.75,'Dat'),
('K1301','CTRR',1,'5/13/2006',8.00,'Dat'),
('K1302','CSDL',1,'12/20/2006',6.75,'Dat'),
('K1302','CTDLGT',1,'7/25/2006',5.00,'Dat'),
('K1302','THDC',1,'5/20/2006',8.00,'Dat'),
('K1302','CTRR',1,'5/13/2006',8.50,'Dat'),
('K1303','CSDL',1,'12/20/2006',4.00,'Khong Dat'),
('K1303','CTDLGT',1,'7/25/2006',4.50,'Khong Dat'),
('K1303','CTDLGT',2,'8/7/2006',4.00,'Khong Dat'),
('K1303','CTDLGT',3,'8/15/2006',4.25,'Khong Dat'),
('K1303','THDC',1,'5/20/2006',4.50,'Khong Dat'),
('K1303','CTRR',1,'5/13/2006',3.25,'Khong Dat'),
('K1303','CTRR',2,'5/20/2006',5.00,'Dat'),
('K1304','CSDL',1,'12/20/2006',7.75,'Dat'),
('K1304','CTDLGT',1,'7/25/2006',9.75,'Dat'),
('K1304','THDC',1,'5/20/2006',5.50,'Dat'),
('K1304','CTRR',1,'5/13/2006',5.00,'Dat'),
('K1305','CSDL',1,'12/20/2006',9.25,'Dat'),
('K1305','CTDLGT',1,'7/25/2006',10.00,'Dat'),
('K1305','THDC',1,'5/20/2006',8.00,'Dat'),
('K1305','CTRR',1,'5/13/2006',10.00,'Dat')
-- Nhập dữ liệu cho HOCVIEN --
INSERT INTO HOCVIEN VALUES('K1101','Nguyen Van','A','1/27/1986','Nam','TpHCM','K11'),
('K1102','Tran Ngoc','Han','3/1/1986','Nu','Kien Giang','K11'),
('K1103','Ha Duy','Lap','4/18/1986','Nam','Nghe An','K11'),
('K1104','Tran Ngoc','Linh','3/30/1986','Nu','Tay Ninh','K11'),
('K1105','Tran Minh','Long','2/27/1986','Nam','TpHCM','K11'),
('K1106','Le Nhat','Minh','1/24/1986','Nam','TpHCM','K11'),
('K1107','Nguyen Nhu','Nhut','1/27/1986','Nam','Ha Noi','K11'),
('K1108','Nguyen Manh','Tam','2/27/1986','Nam','Kien Giang','K11'),
('K1109','Phan Thi Thanh','Tam','1/27/1986','Nu','Vinh Long','K11'),
('K1110','Le Hoai','Thuong','2/5/1986','Nu','Can Tho','K11'),
('K1111','Le Ha','Vinh','12/25/1986','Nam','Vinh Long','K11'),
('K1201','Nguyen Van','B','2/11/1986','Nam','TpHCM','K12'),
('K1202','Nguyen Thi Kim','Duyen','1/18/1986','Nu','TpHCM','K12'),
('K1203','Tran Thi Kim','Duyen','9/17/1986','Nu','TpHCM','K12'),
('K1204','Truong My','Hanh','5/19/1986','Nu','Dong Nai','K12'),
('K1205','Nguyen Thanh','Nam','4/17/1986','Nam','TpHCM','K12'),
('K1206','Nguyen Thi Truc','Thanh','3/4/1986','Nu','Kien Giang','K12'),
('K1207','Tran Thi Bich','Thuy','2/8/1986','Nu','Nghe An','K12'),
('K1208','Huynh Thi Kim','Trieu','4/8/1986','Nu','Tay Ninh','K12'),
('K1209','Pham Thanh','Trieu','2/23/1986','Nam','TpHCM','K12'),
('K1210','Ngo Thanh','Tuan','2/14/1986','Nam','TpHCM','K12'),
('K1211','Do Thi','Xuan','3/9/1986','Nu','Ha Noi','K12'),
('K1212','Le Thi Phi','Yen','3/12/1986','Nu','TpHCM','K12'),
('K1301','Nguyen Thi Kim','Cuc','6/9/1986','Nu','Kien Giang','K13'),
('K1302','Truong Thi My','Hien','3/18/1986','Nu','Nghe An','K13'),
('K1303','Le Duc','Hien','3/12/1986','Nam','Tay Ninh','K13'),
('K1304','Le Quang','Hien','4/18/1986','Nam','TpHCM','K13'),
('K1305','Le Thi','Huong','3/27/1986','Nu','TpHCM','K13'),
('K1306','Nguyen Thai','Huu','3/30/1986','Nam','Ha Noi','K13'),
('K1307','Tran Minh','Man','5/28/1986','Nam','TpHCM','K13'),
('K1308','Nguyen Hieu','Nghia','4/8/1986','Nam','Kien Giang','K13'),
('K1309','Nguyen Trung','Nghia','1/18/1987','Nam','Nghe An','K13'),
('K1310','Tran Thi Hong','Tham','4/22/1986','Nu','Tay Ninh','K13'),
('K1311','Tran Minh','Thuc','4/4/1986','Nam','TpHCM','K13'),
('K1312','Nguyen Thi Kim','Yen','9/7/1986','Nu','TpHCM','K13')


					
--LAB5: Sinh viên hoàn thành Phần I bài tập QuanLyGiaoVu câu 9, 10 và từ câu 15 đến câu 24. 
--Câu 9: Lớp trưởng của một lớp phải là học viên của lớp đó. 
GO
CREATE TRIGGER trg_LopTrg ON LOP
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MALOP1 char(3), @MALOP2 char(3), @TRGLOP char(5)
	SELECT @MALOP1=MALOP, @TRGLOP=TRGLOP
	FROM INSERTED
	SELECT @MALOP2=MALOP
	FROM HOCVIEN
	WHERE @TRGLOP=MAHV
	IF (@MALOP1=@MALOP2)
		BEGIN
			PRINT N'Thêm lớp mới thành công'
		END
	ELSE
		BEGIN
			PRINT N'Lớp mới không hợp lệ'
			ROLLBACK TRANSACTION
		END
END
GO
--Câu 10: Trưởng khoa phải là giáo viên thuộc khoa và có học vị “TS” hoặc “PTS”. 
ALTER TRIGGER TRG_TRGKHOA ON KHOA
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MAKHOA1 VARCHAR(4), @MAKHOA2 VARCHAR(4), @TRGKHOA CHAR(4), @HOCVI VARCHAR(10)
	SELECT @MAKHOA1=MAKHOA, @TRGKHOA=TRGKHOA
	FROM INSERTED
	SELECT @MAKHOA2=MAKHOA, @HOCVI=HOCVI
	FROM GIAOVIEN
	WHERE MAGV=@TRGKHOA
	IF(@MAKHOA1 = @MAKHOA2 AND @HOCVI IN ('TS', 'PTS') AND @MAKHOA1 IS NOT NULL)
		BEGIN
			PRINT N'Thêm khoa mới thành công'
		END
	ELSE
		BEGIN
			PRINT N'Không đủ điều kiện thành lập khoa'
			ROLLBACK TRANSACTION
		END
END
--Câu 15: Học viên chỉ được thi một môn học nào đó khi lớp của học viên đã học xong môn học này
GO
CREATE TRIGGER TRG_THI ON KETQUATHI
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @MAHV CHAR(5), @MAMH VARCHAR(10), @MALOP CHAR(3), @DENNGAY SMALLDATETIME, @NGTHI SMALLDATETIME
	SELECT @MAHV=MAHV, @MAMH=MAMH, @NGTHI=NGTHI
	FROM INSERTED
	SELECT @MALOP=MALOP
	FROM HOCVIEN
	WHERE MAHV=@MAHV
	SELECT @DENNGAY=DENNGAY
	FROM GIANGDAY
	WHERE @MAMH=MAMH AND @MALOP=MALOP
	IF(@DENNGAY IS NOT NULL AND @DENNGAY< @NGTHI)
		BEGIN
			PRINT N'Thêm KETQUATHI thành công'
		END
	ELSE
		BEGIN
			PRINT N'Dữ liệu không hợp lệ'
			ROLLBACK TRANSACTION
		END
END
GO
--Câu 16: Mỗi học kỳ của một năm học, một lớp chỉ được học tối đa 3 môn.
ALTER TRIGGER TRG_HOCKY ON GIANGDAY
FOR INSERT, UPDATE
AS 
BEGIN
	IF EXISTS (
        SELECT MALOP, HOCKY, NAM
        FROM GIANGDAY
        GROUP BY MALOP, HOCKY, NAM
        HAVING COUNT(MAMH) > 3
    )
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
	ELSE
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END	
END
GO
--Câu 17: Sỉ số của một lớp bằng với số lượng học viên thuộc lớp đó.
ALTER TRIGGER TRG_SISO ON LOP
FOR INSERT, UPDATE
AS 
BEGIN
	DECLARE @SISO TINYINT, @SOHOCVIEN TINYINT, @MALOP CHAR(3)
	SELECT @SISO=SISO, @MALOP=MALOP
	FROM INSERTED
	SELECT @SOHOCVIEN=COUNT(MAHV)
	FROM HOCVIEN
	WHERE MALOP=@MALOP
	IF(@SISO=@SOHOCVIEN)
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END
	ELSE
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
END
GO
--Câu 18: Trong quan hệ DIEUKIEN giá trị của thuộc tính MAMH và MAMH_TRUOC trong cùng 
--một bộ không được giống nhau (“A”,”A”) và cũng không tồn tại hai bộ (“A”,”B”) và (“B”,”A”).
CREATE TRIGGER TRG_DIEUKIEN ON DIEUKIEN
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MAMH VARCHAR(10), @MAMH_TRUOC VARCHAR(10)
	SELECT @MAMH=MAMH, @MAMH_TRUOC=MAMH_TRUOC
	FROM INSERTED
	IF( @MAMH=@MAMH_TRUOC OR EXISTS( SELECT 1
									  FROM DIEUKIEN D1
									  JOIN DIEUKIEN D2
									  ON D1.MAMH = D2.MAMH_TRUOC
									  AND D1.MAMH_TRUOC = D2.MAMH)
	)
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
	ELSE
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END
END
--Câu 19: Các giáo viên có cùng học vị, học hàm, hệ số lương thì mức lương bằng nhau. 
GO
CREATE TRIGGER TRG_LUONGGV ON GIAOVIEN
FOR INSERT, UPDATE
AS
BEGIN
	IF EXISTS (
        SELECT HOCVI, HOCHAM, HESO
        FROM GIAOVIEN
        GROUP BY HOCVI, HOCHAM, HESO
        HAVING COUNT(DISTINCT MUCLUONG) > 1
    )
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
	ELSE
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END
END
GO
--Câu 20: Học viên chỉ được thi lại (lần thi >1) khi điểm của lần thi trước đó dưới 5
CREATE TRIGGER TRG_Lanthi ON KETQUATHI
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @LANTHI TINYINT, @DIEM NUMERIC(4,2), @MAHV CHAR(5)
	SELECT @LANTHI=LANTHI, @MAHV=MAHV
	FROM INSERTED
	SELECT @DIEM=DIEM
	FROM KETQUATHI
	WHERE @MAHV=MAHV AND LANTHI=@LANTHI-1
	IF(@LANTHI=1 OR (@DIEM<5 AND @DIEM IS NOT NULL))
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END
	ELSE
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
END
GO
--Câu 21: Ngày thi của lần thi sau phải lớn hơn ngày thi của lần thi trước (cùng học viên, cùng môn học).
ALTER TRIGGER TRG_NgayThi ON KETQUATHI
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @NGTHI SMALLDATETIME, @MAHV CHAR(5), @MAMH VARCHAR(10), @LANTHI TINYINT
	SELECT @NGTHI=NGTHI, @MAHV=MAHV, @MAMH=MAMH
	FROM INSERTED
	IF EXISTS(SELECT 1 
			  FROM KETQUATHI
			  WHERE @MAHV=MAHV AND @MAMH=MAMH AND @LANTHI>LANTHI AND @NGTHI<NGTHI 
			  )
		BEGIN
			PRINT N'Dữ liệu thêm không hợp lệ.';
			ROLLBACK TRANSACTION;   
		END
	ELSE
		BEGIN
			PRINT 'Thêm dữ liệu thành công';
		END
END
GO
--Câu 22: Khi phân công giảng dạy một môn học, phải xét đến thứ tự trước sau giữa các môn học (sau 
--khi học xong những môn học phải học trước mới được học những môn liền sau).
ALTER TRIGGER TRG_PHANCONG ON GIANGDAY
FOR INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED I
        JOIN DIEUKIEN DK 
          ON I.MAMH = DK.MAMH
        JOIN GIANGDAY GD_TRUOC 
          ON GD_TRUOC.MALOP = I.MALOP 
         AND GD_TRUOC.MAMH = DK.MAMH_TRUOC
        WHERE GD_TRUOC.DENNGAY > I.TUNGAY
    )
    BEGIN
        PRINT N'Không thể phân công giảng dạy: Môn học trước chưa hoàn thành.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT N'Phân công giảng dạy thành công.';
    END
END;
GO
--Câu 23: Giáo viên chỉ được phân công dạy những môn thuộc khoa giáo viên đó phụ trách.
ALTER TRIGGER TRG_PHANCONG_GV ON GIANGDAY
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM INSERTED I
        JOIN MONHOC MH ON I.MAMH = MH.MAMH
        JOIN GIAOVIEN GV ON I.MAGV = GV.MAGV
        WHERE MH.MAKHOA <> GV.MAKHOA
    )
    BEGIN
        PRINT N'Phân công không hợp lệ: Giáo viên không thuộc khoa của môn học.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        PRINT N'Phân công giảng dạy thành công.';
    END
END;
GO

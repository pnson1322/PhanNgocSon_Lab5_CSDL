CREATE DATABASE QUANLICHUYENGIA

USE QUANLICHUYENGIA

-- Tạo bảng Chuyên gia
CREATE TABLE ChuyenGia (
    MaChuyenGia INT PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    Email NVARCHAR(100),
    SoDienThoai NVARCHAR(20),
    ChuyenNganh NVARCHAR(50),
    NamKinhNghiem INT
);

-- Tạo bảng Công ty
CREATE TABLE CongTy (
    MaCongTy INT PRIMARY KEY,
    TenCongTy NVARCHAR(100),
    DiaChi NVARCHAR(200),
    LinhVuc NVARCHAR(50),
    SoNhanVien INT
);

-- Tạo bảng Dự án
CREATE TABLE DuAn (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(200),
    MaCongTy INT,
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);

-- Tạo bảng Kỹ năng
CREATE TABLE KyNang (
    MaKyNang INT PRIMARY KEY,
    TenKyNang NVARCHAR(100),
    LoaiKyNang NVARCHAR(50)
);

-- Tạo bảng Chuyên gia - Kỹ năng
CREATE TABLE ChuyenGia_KyNang (
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    PRIMARY KEY (MaChuyenGia, MaKyNang),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaKyNang) REFERENCES KyNang(MaKyNang)
);

-- Tạo bảng Chuyên gia - Dự án
CREATE TABLE ChuyenGia_DuAn (
    MaChuyenGia INT,
    MaDuAn INT,
    VaiTro NVARCHAR(50),
    NgayThamGia DATE,
    PRIMARY KEY (MaChuyenGia, MaDuAn),
    FOREIGN KEY (MaChuyenGia) REFERENCES ChuyenGia(MaChuyenGia),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(1, N'Nguyễn Văn An', '1985-05-10', N'Nam', 'nguyenvanan@email.com', '0901234567', N'Phát triển phần mềm', 10),
(2, N'Trần Thị Bình', '1990-08-15', N'Nữ', 'tranthiminh@email.com', '0912345678', N'An ninh mạng', 7),
(3, N'Lê Hoàng Cường', '1988-03-20', N'Nam', 'lehoangcuong@email.com', '0923456789', N'Trí tuệ nhân tạo', 9),
(4, N'Phạm Thị Dung', '1992-11-25', N'Nữ', 'phamthidung@email.com', '0934567890', N'Khoa học dữ liệu', 6),
(5, N'Hoàng Văn Em', '1987-07-30', N'Nam', 'hoangvanem@email.com', '0945678901', N'Điện toán đám mây', 8),
(6, N'Ngô Thị Phượng', '1993-02-14', N'Nữ', 'ngothiphuong@email.com', '0956789012', N'Phân tích dữ liệu', 5),
(7, N'Đặng Văn Giang', '1986-09-05', N'Nam', 'dangvangiang@email.com', '0967890123', N'IoT', 11),
(8, N'Vũ Thị Hương', '1991-12-20', N'Nữ', 'vuthihuong@email.com', '0978901234', N'UX/UI Design', 7),
(9, N'Bùi Văn Inh', '1989-04-15', N'Nam', 'buivaninch@email.com', '0989012345', N'DevOps', 8),
(10, N'Lý Thị Khánh', '1994-06-30', N'Nữ', 'lythikhanh@email.com', '0990123456', N'Blockchain', 4);

-- Chèn dữ liệu mẫu vào bảng Công ty
INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(1, N'TechViet Solutions', N'123 Đường Lê Lợi, TP.HCM', N'Phát triển phần mềm', 200),
(2, N'DataSmart Analytics', N'456 Đường Nguyễn Huệ, Hà Nội', N'Phân tích dữ liệu', 150),
(3, N'CloudNine Systems', N'789 Đường Trần Hưng Đạo, Đà Nẵng', N'Điện toán đám mây', 100),
(4, N'SecureNet Vietnam', N'101 Đường Võ Văn Tần, TP.HCM', N'An ninh mạng', 80),
(5, N'AI Innovate', N'202 Đường Lý Tự Trọng, Hà Nội', N'Trí tuệ nhân tạo', 120);

-- Chèn dữ liệu mẫu vào bảng Dự án
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(1, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Hoàn thành'),
(2, N'Xây dựng hệ thống phân tích dữ liệu khách hàng', 2, '2023-03-15', '2023-09-15', N'Đang thực hiện'),
(3, N'Triển khai giải pháp đám mây cho doanh nghiệp', 3, '2023-02-01', '2023-08-31', N'Đang thực hiện'),
(4, N'Nâng cấp hệ thống bảo mật cho tập đoàn viễn thông', 4, '2023-04-01', '2023-10-31', N'Đang thực hiện'),
(5, N'Phát triển chatbot AI cho dịch vụ khách hàng', 5, '2023-05-01', '2023-11-30', N'Đang thực hiện');

-- Chèn dữ liệu mẫu vào bảng Kỹ năng
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(1, 'Java', N'Ngôn ngữ lập trình'),
(2, 'Python', N'Ngôn ngữ lập trình'),
(3, 'Machine Learning', N'Công nghệ'),
(4, 'AWS', N'Nền tảng đám mây'),
(5, 'Docker', N'Công cụ'),
(6, 'Kubernetes', N'Công cụ'),
(7, 'SQL', N'Cơ sở dữ liệu'),
(8, 'NoSQL', N'Cơ sở dữ liệu'),
(9, 'React', N'Framework'),
(10, 'Angular', N'Framework');

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Kỹ năng
INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES 
(1, 1, 5), (1, 7, 4), (1, 9, 3),
(2, 2, 4), (2, 3, 3), (2, 8, 4),
(3, 2, 5), (3, 3, 5), (3, 4, 3),
(4, 2, 4), (4, 7, 5), (4, 8, 4),
(5, 4, 5), (5, 5, 4), (5, 6, 4),
(6, 2, 4), (6, 3, 3), (6, 7, 5),
(7, 1, 3), (7, 2, 4), (7, 5, 3),
(8, 9, 5), (8, 10, 4),
(9, 5, 5), (9, 6, 5), (9, 4, 4),
(10, 2, 3), (10, 3, 3), (10, 8, 4);

-- Chèn dữ liệu mẫu vào bảng Chuyên gia - Dự án
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 1, N'Trưởng nhóm phát triển', '2023-01-01'),
(2, 4, N'Chuyên gia bảo mật', '2023-04-01'),
(3, 5, N'Kỹ sư AI', '2023-05-01'),
(4, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(5, 3, N'Kiến trúc sư đám mây', '2023-02-01'),
(6, 2, N'Chuyên gia phân tích dữ liệu', '2023-03-15'),
(7, 3, N'Kỹ sư IoT', '2023-02-01'),
(8, 1, N'Nhà thiết kế UX/UI', '2023-01-01'),
(9, 3, N'Kỹ sư DevOps', '2023-02-01'),
(10, 5, N'Kỹ sư Blockchain', '2023-05-01');

-- 101. Tạo một trigger để tự động cập nhật trường NgayCapNhat trong bảng ChuyenGia mỗi khi có sự thay đổi thông tin.
ALTER TABLE ChuyenGia
ADD NgayCapNhat DATETIME NULL;
GO
CREATE TRIGGER TRI_UPDATEDATE ON ChuyenGia
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MaChuyenGia INT
	SELECT @MaChuyenGia=MaChuyenGia
	FROM INSERTED
	UPDATE ChuyenGia
	SET NgayCapNhat = GETDATE()
	WHERE MaChuyenGia=@MaChuyenGia
END
GO
SELECT * FROM ChuyenGia
UPDATE ChuyenGia
SET HoTen = N'Nguyễn Văn A'
WHERE MaChuyenGia = 1;

-- 102. Tạo một trigger để ghi log mỗi khi có sự thay đổi trong bảng DuAn.
CREATE TABLE DuAn_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    MaDuAn INT,
    TenDuAn NVARCHAR(255),
    TrangThai NVARCHAR(50),
    LoaiThayDoi NVARCHAR(50),  
    ThoiGianThayDoi DATETIME DEFAULT GETDATE(),
    UserName NVARCHAR(255) 
);
GO
CREATE TRIGGER trg_LogDuAn
ON DuAn
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @LoaiThayDoi NVARCHAR(50);
    DECLARE @MaDuAn INT;
    DECLARE @TenDuAn NVARCHAR(255);
    DECLARE @TrangThai NVARCHAR(50);
    DECLARE @UserName NVARCHAR(255) = SYSTEM_USER;  
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @LoaiThayDoi = 'INSERT';
        SELECT @MaDuAn = MaDuAn, @TenDuAn = TenDuAn, @TrangThai = TrangThai FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @LoaiThayDoi = 'DELETE';
        SELECT @MaDuAn = MaDuAn, @TenDuAn = TenDuAn, @TrangThai = TrangThai FROM deleted;
    END
    IF @LoaiThayDoi = 'UPDATE'
    BEGIN
        SELECT @MaDuAn = MaDuAn, @TenDuAn = TenDuAn, @TrangThai = TrangThai FROM inserted;
    END
    INSERT INTO DuAn_Log (MaDuAn, TenDuAn, TrangThai, LoaiThayDoi, ThoiGianThayDoi, UserName)
    VALUES (@MaDuAn, @TenDuAn, @TrangThai, @LoaiThayDoi, GETDATE(), @UserName);
END;
DELETE FROM DuAn
WHERE MaDuAn = 11;
SELECT * FROM DuAn_Log;
-- 103. Tạo một trigger để đảm bảo rằng một chuyên gia không thể tham gia vào quá 5 dự án cùng một lúc.
GO
CREATE TRIGGER TRG_LIMITDA2 ON ChuyenGia_DuAn
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MaChuyenGia INT, @SoDuAn INT
	SELECT @MaChuyenGia=MaChuyenGia
	FROM INSERTED
	SELECT @SoDuAn=COUNT(*)
	FROM ChuyenGia_DuAn
	WHERE MaChuyenGia= @MaChuyenGia
	IF(@SoDuAn > 5)
		BEGIN
			ROLLBACK TRAN
			PRINT N'Dữ liệu bị lỗi'
		END
END
GO

INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES (6, N'Dự án A', 1, '2024-01-01', '2024-12-31', N'Đang triển khai');
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 2, N'Chuyên gia phát triển phần mềm', '2023-01-15'),
(1, 3, N'Trưởng nhóm phát triển phần mềm', '2023-02-15'),
(1, 4, N'Trưởng nhóm bảo mật', '2023-03-15'),
(1, 5, N'Trưởng nhóm AI', '2023-04-15');
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES 
(1, 6, N'Trưởng nhóm Blockchain', '2023-05-15');
-- 104. Tạo một trigger để tự động cập nhật số lượng nhân viên trong bảng CongTy mỗi khi có sự thay đổi trong bảng ChuyenGia.
GO
CREATE TRIGGER TRG_CAPNHATNV3 ON CHUYENGIA_DuAn
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @MaCongTy INT, @MaDuAn INT
	IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @MaDuAn=MaDuAn
		FROM INSERTED
		SELECT @MaCongTy=MaCongTy
		FROM DuAn
		WHERE MaDuAn=@MaDuAn
		UPDATE CongTy
        SET SoNhanVien = SoNhanVien+1
        WHERE MaCongTy = @MaCongTy;
    END 
	IF EXISTS (SELECT * FROM DELETED)
    BEGIN
        SELECT @MaDuAn=MaDuAn
		FROM DELETED
		SELECT @MaCongTy=MaCongTy
		FROM DuAn
		WHERE MaDuAn=@MaDuAn
		UPDATE CongTy
        SET SoNhanVien = SoNhanVien+1
        WHERE MaCongTy = @MaCongTy;
    END  
END
GO
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES (9, 2, N'Trưởng nhóm', '2023-06-01');
SELECT * FROM CongTy WHERE MaCongTy = 2;
GO
-- 105. Tạo một trigger để ngăn chặn việc xóa các dự án đã hoàn thành.
CREATE TRIGGER TRG_DELETEDUAN ON DuAn
FOR DELETE
AS
BEGIN 
	DECLARE @MaDuAn INT;
    DECLARE @TrangThai NVARCHAR(50);

    -- Lấy thông tin mã dự án và trạng thái của dự án từ bảng deleted
    SELECT @MaDuAn = MaDuAn, @TrangThai = TrangThai
    FROM deleted;

    -- Kiểm tra nếu trạng thái dự án là "Hoàn thành"
    IF @TrangThai = N'Hoàn thành'
    BEGIN
        -- Hiển thị thông báo và không cho phép xóa dự án
		ROLLBACK TRANSACTION
        PRINT N'Không thể xóa dự án đã hoàn thành!';
    END
END
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(17, N'Phát triển ứng dụng di động cho ngân hàng', 2, '2023-01-01', '2023-06-30', N'Hoàn thành')
DELETE FROM DuAn WHERE MaDuAn = 17;
GO

-- 106. Tạo một trigger để tự động cập nhật cấp độ kỹ năng của chuyên gia khi họ tham gia vào một dự án mới.
CREATE TRIGGER trg_UpdateKyNangCapDo
ON ChuyenGia_DuAn
FOR INSERT
AS
BEGIN
    DECLARE @MaChuyenGia INT;
    SELECT @MaChuyenGia = MaChuyenGia
    FROM inserted;
    UPDATE ChuyenGia_KyNang
    SET CapDo = CapDo+1
    WHERE MaChuyenGia = @MaChuyenGia
END;
select * from ChuyenGia_KyNang where MaChuyenGia=2
INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
VALUES (2, 5, N'Trưởng nhóm', '2023-06-01');

-- 107. Tạo một trigger để ghi log mỗi khi có sự thay đổi cấp độ kỹ năng của chuyên gia.
CREATE TABLE ChuyenGia_KyNang_Log (
    LogID INT IDENTITY(1,1) PRIMARY KEY,
    MaChuyenGia INT,
    MaKyNang INT,
    CapDo INT,
    LoaiThayDoi NVARCHAR(50),  -- INSERT, UPDATE, DELETE
    ThoiGianThayDoi DATETIME DEFAULT GETDATE(),
    UserName NVARCHAR(255) -- Người thực hiện thay đổi
);
GO
CREATE TRIGGER trg_LogChuyenGiaKyNang
ON ChuyenGia_KyNang
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @LoaiThayDoi NVARCHAR(50);
    DECLARE @MaChuyenGia INT;
    DECLARE @MaKyNang INT;
    DECLARE @CapDo INT;
    DECLARE @UserName NVARCHAR(255) = SYSTEM_USER; 
    
 
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SET @LoaiThayDoi = 'INSERT';
        SELECT @MaChuyenGia = MaChuyenGia, @MaKyNang = MaKyNang, @CapDo = CapDo FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SET @LoaiThayDoi = 'DELETE';
        SELECT @MaChuyenGia = MaChuyenGia, @MaKyNang = MaKyNang, @CapDo = CapDo FROM deleted;
    END

    
    IF @LoaiThayDoi = 'UPDATE'
    BEGIN
        SELECT @MaChuyenGia = MaChuyenGia, @MaKyNang = MaKyNang, @CapDo = CapDo FROM inserted;
    END

   
    INSERT INTO ChuyenGia_KyNang_Log (MaChuyenGia, MaKyNang, CapDo, LoaiThayDoi, ThoiGianThayDoi, UserName)
    VALUES (@MaChuyenGia, @MaKyNang, @CapDo, @LoaiThayDoi, GETDATE(), @UserName);
END;
DELETE FROM ChuyenGia_KyNang
WHERE MaChuyenGia = 1 AND MaKyNang = 1;
SELECT * FROM ChuyenGia_KyNang_Log;

-- 108. Tạo một trigger để đảm bảo rằng ngày kết thúc của dự án luôn lớn hơn ngày bắt đầu.
GO
CREATE TRIGGER TRG_NgayDuAn
ON DuAn
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @NgayBatDau DATE;
    DECLARE @NgayKetThuc DATE;
    SELECT @NgayBatDau = NgayBatDau, @NgayKetThuc = NgayKetThuc
    FROM inserted;
    IF @NgayKetThuc <= @NgayBatDau
    BEGIN
        PRINT N'Ngày kết thúc phải lớn hơn ngày bắt đầu!';
        ROLLBACK TRANSACTION;
    END
END;
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES (16, N'Dự án không hợp lệ', 1, '2023-10-01', '2023-09-01', N'Đang thực hiện');
GO
-- 109. Tạo một trigger để tự động xóa các bản ghi liên quan trong bảng ChuyenGia_KyNang khi một kỹ năng bị xóa.
CREATE TRIGGER trg_DeleteChuyenGiaKyNang
ON KyNang
AFTER DELETE
AS
BEGIN
    DELETE FROM ChuyenGia_KyNang
    WHERE MaKyNang IN (SELECT MaKyNang FROM deleted);
    PRINT N'Đã xóa các bản ghi liên quan trong bảng ChuyenGia_KyNang.';
END;
INSERT INTO KyNang (MaKyNang, TenKyNang, LoaiKyNang)
VALUES 
(11, 'Java', N'Ngôn ngữ lập trình')

DELETE FROM KyNang WHERE MaKyNang = 11;
GO
-- 110. Tạo một trigger để đảm bảo rằng một công ty không thể có quá 10 dự án đang thực hiện cùng một lúc.
CREATE TRIGGER trg_CheckMaxDuAn
ON DuAn
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaCongTy INT;
    DECLARE @SoDuAnDangThucHien INT;
    SELECT @MaCongTy = MaCongTy FROM inserted;
    SELECT @SoDuAnDangThucHien = COUNT(*)
    FROM DuAn
    WHERE MaCongTy = @MaCongTy AND TrangThai = N'Đang thực hiện';
    IF @SoDuAnDangThucHien > 10
    BEGIN
        ROLLBACK TRANSACTION;
        PRINT N'Không thể thêm dự án mới vì công ty đã có quá 10 dự án đang thực hiện.';
    END
END;
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(11, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(12, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(13, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(14, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(15, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(16, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(178, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(18, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(19, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện'),
(20, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện')
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES
(21, N'Phát triển ứng dụng di động cho ngân hàng', 1, '2023-01-01', '2023-06-30', N'Đang thực hiện');
-- Câu hỏi và ví dụ về Triggers bổ sung (123-135)
GO
-- 123. Tạo một trigger để tự động cập nhật lương của chuyên gia dựa trên cấp độ kỹ năng và số năm kinh nghiệm.
ALTER TABLE ChuyenGia
ADD Luong INT;
GO
CREATE TRIGGER trg_UpdateLuongChuyenGia
ON ChuyenGia_KyNang
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaChuyenGia INT;
    DECLARE @CapDo INT;
    DECLARE @NamKinhNghiem INT;
    DECLARE @Luong INT;
    SELECT @MaChuyenGia = MaChuyenGia, @CapDo = CapDo
    FROM inserted;
    SELECT @NamKinhNghiem = NamKinhNghiem
    FROM ChuyenGia
    WHERE MaChuyenGia = @MaChuyenGia;
    SET @Luong = (@CapDo * 1000) + (@NamKinhNghiem * 500);
    UPDATE ChuyenGia
    SET Luong = @Luong
    WHERE MaChuyenGia = @MaChuyenGia;
    PRINT 'Lương của chuyên gia đã được cập nhật.';
END;
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES (11, N'Phan Thị Lan', '1990-05-05', N'Nữ', 'phanlan@email.com', '0971234567', N'Thị trường tài chính', 5);

INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES (11, 1, 4); 

SELECT * FROM ChuyenGia WHERE MaChuyenGia = 11;
-- 124. Tạo một trigger để tự động gửi thông báo khi một dự án sắp đến hạn (còn 7 ngày).
-- Tạo bảng ThongBao nếu chưa có
CREATE TABLE ThongBao (
    MaThongBao INT IDENTITY(1,1) PRIMARY KEY,
    MaDuAn INT,
    NoiDung NVARCHAR(500),
    NgayThongBao DATETIME,
    TrangThai NVARCHAR(50),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);
GO
CREATE TRIGGER trg_GuiThongBaoDuAn
ON DuAn
AFTER UPDATE
AS
BEGIN
    DECLARE @MaDuAn INT;
    DECLARE @NgayKetThuc DATETIME;
    DECLARE @NoiDung NVARCHAR(500);
    SELECT @MaDuAn = MaDuAn, @NgayKetThuc = NgayKetThuc FROM inserted;
    IF DATEDIFF(DAY, GETDATE(), @NgayKetThuc) <= 7
    BEGIN
        SET @NoiDung = N'Dự án ' + CAST(@MaDuAn AS NVARCHAR) + N' sắp đến hạn, còn lại ' 
                        + CAST(DATEDIFF(DAY, GETDATE(), @NgayKetThuc) AS NVARCHAR) + N' ngày.';
        INSERT INTO ThongBao (MaDuAn, NoiDung, NgayThongBao, TrangThai)
        VALUES (@MaDuAn, @NoiDung, GETDATE(), N'Chưa đọc');
    END
END;


-- 125. Tạo một trigger để ngăn chặn việc xóa hoặc cập nhật thông tin của chuyên gia đang tham gia dự án.
GO
CREATE TRIGGER trg_KiemTraXoaCapNhatChuyenGia
ON ChuyenGia
FOR UPDATE, DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM ChuyenGia_DuAn
        WHERE MaChuyenGia IN (SELECT MaChuyenGia FROM deleted)
    )
    BEGIN
        PRINT N'Không thể xóa hoặc cập nhật thông tin chuyên gia đang tham gia dự án';
        ROLLBACK TRANSACTION; 
    END
END;

-- 126. Tạo một trigger để tự động cập nhật số lượng chuyên gia trong mỗi chuyên ngành.
-- Tạo bảng ThongKeChuyenNganh nếu chưa có
CREATE TABLE ThongKeChuyenNganh (
    MaChuyenNganh INT PRIMARY KEY,
    TenChuyenNganh NVARCHAR(100),
    SoLuongChuyenGia INT
);
GO
CREATE TRIGGER trg_ThongKeChuyenNganh
ON ChuyenGia
AFTER INSERT, DELETE
AS
BEGIN
    DECLARE @MaChuyenNganh INT;
    DECLARE @SoLuongChuyenGia INT;
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @MaChuyenNganh = ChuyenNganh FROM inserted;
        SELECT @SoLuongChuyenGia = COUNT(*) 
        FROM ChuyenGia 
        WHERE ChuyenNganh = @MaChuyenNganh;
        IF EXISTS (SELECT * FROM ThongKeChuyenNganh WHERE MaChuyenNganh = @MaChuyenNganh)
        BEGIN
            UPDATE ThongKeChuyenNganh
            SET SoLuongChuyenGia = @SoLuongChuyenGia
            WHERE MaChuyenNganh = @MaChuyenNganh;
        END
        ELSE
        BEGIN
            INSERT INTO ThongKeChuyenNganh (MaChuyenNganh, TenChuyenNganh, SoLuongChuyenGia)
            SELECT @MaChuyenNganh, ChuyenNganh, @SoLuongChuyenGia FROM inserted;
        END
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @MaChuyenNganh = ChuyenNganh FROM deleted;
        SELECT @SoLuongChuyenGia = COUNT(*) 
        FROM ChuyenGia 
        WHERE ChuyenNganh = @MaChuyenNganh;
        IF EXISTS (SELECT * FROM ThongKeChuyenNganh WHERE MaChuyenNganh = @MaChuyenNganh)
        BEGIN
            UPDATE ThongKeChuyenNganh
            SET SoLuongChuyenGia = @SoLuongChuyenGia
            WHERE MaChuyenNganh = @MaChuyenNganh;
        END
    END
END;

-- 127. Tạo một trigger để tự động tạo bản sao lưu của dự án khi nó được đánh dấu là hoàn thành.
-- Tạo bảng DuAnHoanThanh nếu chưa có
CREATE TABLE DuAnHoanThanh (
    MaDuAn INT PRIMARY KEY,
    TenDuAn NVARCHAR(255),
    MaCongTy INT,
    NgayBatDau DATETIME,
    NgayKetThuc DATETIME,
    TrangThai NVARCHAR(50),
    CONSTRAINT FK_DuAnHoanThanh_CongTy FOREIGN KEY (MaCongTy) REFERENCES CongTy(MaCongTy)
);
GO
CREATE TRIGGER trg_SaoLuuDuAn
ON DuAn
AFTER UPDATE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted WHERE TrangThai = N'Hoàn thành')
    BEGIN
        DECLARE @MaDuAn INT, @TenDuAn NVARCHAR(255), @MaCongTy INT, @NgayBatDau DATETIME, @NgayKetThuc DATETIME, @TrangThai NVARCHAR(50);
        SELECT 
            @MaDuAn = MaDuAn,
            @TenDuAn = TenDuAn,
            @MaCongTy = MaCongTy,
            @NgayBatDau = NgayBatDau,
            @NgayKetThuc = NgayKetThuc,
            @TrangThai = TrangThai
        FROM inserted;
        INSERT INTO DuAnHoanThanh (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
        VALUES (@MaDuAn, @TenDuAn, @MaCongTy, @NgayBatDau, @NgayKetThuc, @TrangThai);
    END
END;

-- 128. Tạo một trigger để tự động cập nhật điểm đánh giá trung bình của công ty dựa trên điểm đánh giá của các dự án.
ALTER TABLE CongTy
ADD DiemDanhGia DECIMAL(3,2) DEFAULT 0;
ALTER TABLE DuAn
ADD DiemDanhGia DECIMAL(3,2) DEFAULT 0;
GO
CREATE TRIGGER trg_CapNhatDiemDanhGiaCongTy
ON DuAn
FOR UPDATE, INSERT
AS
BEGIN
    DECLARE @MaCongTy INT;
    SELECT @MaCongTy = MaCongTy FROM inserted;
    UPDATE CongTy
    SET DiemDanhGia = (
        SELECT AVG(DiemDanhGia)
        FROM DuAn
        WHERE MaCongTy = @MaCongTy
    )
    WHERE MaCongTy = @MaCongTy;
END;

UPDATE DuAn
SET DiemDanhGia = 7
WHERE MaDuAn = 1;


SELECT * FROM CongTy WHERE MaCongTy = 1;
-- 129. Tạo một trigger để tự động phân công chuyên gia vào dự án dựa trên kỹ năng và kinh nghiệm.\
GO
CREATE TRIGGER trg_PhanCongChuyenGia
ON DuAn
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaDuAn INT;
    SELECT @MaDuAn = MaDuAn FROM inserted;
    INSERT INTO ChuyenGia_DuAn (MaChuyenGia, MaDuAn, VaiTro, NgayThamGia)
    SELECT cg.MaChuyenGia, @MaDuAn, N'Chuyên gia', GETDATE()
    FROM ChuyenGia cg
    WHERE cg.NamKinhNghiem > @MaDuAn;   
END;
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES (23, N'Phát triển hệ thống AI', 2, '2023-06-01', '2023-12-31', N'Đang thực hiện');

SELECT * FROM ChuyenGia_DuAn WHERE MaDuAn = 23;

-- 130. Tạo một trigger để tự động cập nhật trạng thái "bận" của chuyên gia khi họ được phân công vào dự án mới.
ALTER TABLE ChuyenGia
ADD TrangThai NVARCHAR(20);
GO
CREATE TRIGGER trg_ThongBaoBan
ON ChuyenGia_DuAn
FOR INSERT
AS
BEGIN
    UPDATE ChuyenGia
    SET TrangThai = N'Bận'
    FROM ChuyenGia cg
    INNER JOIN inserted i ON cg.MaChuyenGia = i.MaChuyenGia
    WHERE cg.TrangThai IS NULL OR cg.TrangThai <> N'Bận';
END;

SELECT MaChuyenGia, TrangThai FROM ChuyenGia WHERE MaChuyenGia = 22;

-- 131. Tạo một trigger để ngăn chặn việc thêm kỹ năng trùng lặp cho một chuyên gia.
GO
CREATE TRIGGER trg_NganKyNangTrungLap
ON ChuyenGia_KyNang
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaChuyenGia INT;
    DECLARE @MaKyNang INT;
    DECLARE @CapDo INT;
    DECLARE @Count INT;
    SELECT @MaChuyenGia = MaChuyenGia, 
           @MaKyNang = MaKyNang, 
           @CapDo = CapDo 
    FROM INSERTED;
    SELECT @Count = COUNT(*)
    FROM ChuyenGia_KyNang
    WHERE MaChuyenGia = @MaChuyenGia AND MaKyNang = @MaKyNang;
    IF @Count > 0
    BEGIN
        ROLLBACK TRAN
		PRINT N'Không thể thêm'
    END
END;

INSERT INTO ChuyenGia_KyNang (MaChuyenGia, MaKyNang, CapDo)
VALUES (1, 1, 5);


-- 132. Tạo một trigger để tự động tạo báo cáo tổng kết khi một dự án kết thúc.
CREATE TABLE BaoCaoTongKet (
    MaBaoCao INT IDENTITY(1,1) PRIMARY KEY,
    MaDuAn INT NOT NULL,
    TenDuAn NVARCHAR(200),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    TongSoChuyenGia INT,
    TrangThai NVARCHAR(50),
    GhiChu NVARCHAR(500),
    FOREIGN KEY (MaDuAn) REFERENCES DuAn(MaDuAn)
);
GO
CREATE TRIGGER trg_TaoBaoCaoTongKet
ON DuAn
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 
        FROM INSERTED i
        JOIN DELETED d ON i.MaDuAn = d.MaDuAn
        WHERE i.TrangThai = N'Hoàn thành' AND d.TrangThai <> N'Hoàn thành'
    )
    BEGIN
        INSERT INTO BaoCaoTongKet (MaDuAn, TenDuAn, NgayBatDau, NgayKetThuc, TongSoChuyenGia, TrangThai, GhiChu)
        SELECT 
            i.MaDuAn,
            i.TenDuAn,
            i.NgayBatDau,
            i.NgayKetThuc,
            (SELECT COUNT(*) 
             FROM ChuyenGia_DuAn 
             WHERE ChuyenGia_DuAn.MaDuAn = i.MaDuAn) AS TongSoChuyenGia,
            i.TrangThai,
            N'Dự án đã hoàn thành thành công và báo cáo được tạo tự động.'
        FROM INSERTED i
        WHERE i.TrangThai = N'Hoàn thành';
    END
END;

UPDATE DuAn
SET TrangThai = N'Hoàn thành'
WHERE MaDuAn = 2;
SELECT * FROM BaoCaoTongKet;


-- 133. Tạo một trigger để tự động cập nhật thứ hạng của công ty dựa trên số lượng dự án hoàn thành và điểm đánh giá.
ALTER TABLE CongTy
ADD ThuHang INT;
GO
CREATE TRIGGER trg_CapNhatThuHangCongTy
ON DuAn
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @MaCongTy INT, @SoDuAnHoanThanh INT, @DiemTrungBinh FLOAT;
    DECLARE cur CURSOR FOR 
    SELECT DISTINCT MaCongTy
    FROM inserted; 
    OPEN cur;
    FETCH NEXT FROM cur INTO @MaCongTy;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SELECT 
            @SoDuAnHoanThanh = COUNT(DISTINCT d.MaDuAn),
            @DiemTrungBinh = AVG(d.DiemDanhGia)
        FROM DuAn d
        WHERE d.MaCongTy = @MaCongTy AND d.TrangThai = N'Hoàn thành';
        PRINT 'Công ty ' + CAST(@MaCongTy AS NVARCHAR(10)) + 
              ' có ' + CAST(@SoDuAnHoanThanh AS NVARCHAR(10)) + ' dự án hoàn thành, ' + 
              ' điểm trung bình: ' + CAST(@DiemTrungBinh AS NVARCHAR(10));
        FETCH NEXT FROM cur INTO @MaCongTy;
    END
    CLOSE cur;
    DEALLOCATE cur;
END;

UPDATE DuAn
SET DiemDanhGia = 9.0

UPDATE DuAn
SET TrangThai = N'Hoàn thành', DiemDanhGia = 8.5
WHERE MaDuAn = 5;

SELECT MaCongTy, TenCongTy, ThuHang
FROM CongTy;
GO
-- 134. Tạo một trigger để tự động gửi thông báo khi một chuyên gia được thăng cấp (dựa trên số năm kinh nghiệm).
CREATE TABLE ThongBao2 (
    MaThongBao INT IDENTITY(1,1) PRIMARY KEY, 
    NoiDung NVARCHAR(255) NOT NULL,           
    NgayThongBao DATETIME DEFAULT GETDATE()   
);
GO
CREATE TRIGGER trg_ThongBaoThangCap
ON ChuyenGia
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaChuyenGia INT, @HoTen NVARCHAR(255), @NamKinhNghiem INT, @NoiDung NVARCHAR(255);
    DECLARE cur CURSOR FOR
    SELECT MaChuyenGia, HoTen, NamKinhNghiem
    FROM inserted
    WHERE NamKinhNghiem IN (5, 8); 
    OPEN cur;
    FETCH NEXT FROM cur INTO @MaChuyenGia, @HoTen, @NamKinhNghiem;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @NoiDung = N'Chuyên gia ' + @HoTen + N' (ID: ' + CAST(@MaChuyenGia AS NVARCHAR(10)) + 
                       N') đã đạt mốc ' + CAST(@NamKinhNghiem AS NVARCHAR(10)) + N' năm kinh nghiệm và được thăng cấp.';
        INSERT INTO ThongBao2(NoiDung)
        VALUES (@NoiDung);
        FETCH NEXT FROM cur INTO @MaChuyenGia, @HoTen, @NamKinhNghiem;
    END;
    CLOSE cur;
    DEALLOCATE cur;
END;
SELECT * FROM ChuyenGia
INSERT INTO ChuyenGia (MaChuyenGia, HoTen, NgaySinh, GioiTinh, Email, SoDienThoai, ChuyenNganh, NamKinhNghiem)
VALUES 
(13, N'Nguyễn Văn Thành', '1990-01-01', N'Nam', 'nguyenvanthanh@email.com', '0911111111', N'Phát triển phần mềm', 8);
SELECT * FROM ThongBao2
-- 135. Tạo một trigger để tự động cập nhật trạng thái "khẩn cấp" cho dự án khi thời gian còn lại ít hơn 10% tổng thời gian dự án.
GO
CREATE TRIGGER trg_CapNhatTrangThaiDuAn
ON DuAn
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaDuAn INT, @NgayBatDau DATE, @NgayKetThuc DATE, @TrangThai NVARCHAR(50);
    DECLARE @TongThoiGian INT, @ThoiGianConLai INT;
    DECLARE cur CURSOR FOR
    SELECT MaDuAn, NgayBatDau, NgayKetThuc, TrangThai
    FROM inserted;
    OPEN cur;
    FETCH NEXT FROM cur INTO @MaDuAn, @NgayBatDau, @NgayKetThuc, @TrangThai;
    WHILE @@FETCH_STATUS = 0
    BEGIN
        SET @TongThoiGian = DATEDIFF(DAY, @NgayBatDau, @NgayKetThuc);
        SET @ThoiGianConLai = DATEDIFF(DAY, GETDATE(), @NgayKetThuc);
        IF @ThoiGianConLai > 0 AND @ThoiGianConLai <= (@TongThoiGian * 0.1) AND @TrangThai != N'Khẩn cấp'
        BEGIN
            UPDATE DuAn
            SET TrangThai = N'Khẩn cấp'
            WHERE MaDuAn = @MaDuAn;
        END;
        FETCH NEXT FROM cur INTO @MaDuAn, @NgayBatDau, @NgayKetThuc, @TrangThai;
    END;
    CLOSE cur;
    DEALLOCATE cur;
END;

GO
-- 136. Tạo một trigger để tự động cập nhật số lượng dự án đang thực hiện của mỗi chuyên gia.
ALTER TABLE ChuyenGia
ADD SoLuongDuAnDangThucHien INT DEFAULT 0;
GO
CREATE TRIGGER trg_UpdateSoLuongDuAn
ON ChuyenGia_DuAn
FOR INSERT, DELETE
AS
BEGIN
    IF EXISTS (SELECT * FROM inserted) 
    BEGIN
        UPDATE ChuyenGia
        SET SoLuongDuAnDangThucHien = (
            SELECT COUNT(*)
            FROM ChuyenGia_DuAn cd
            JOIN DuAn d ON cd.MaDuAn = d.MaDuAn
            WHERE cd.MaChuyenGia = (SELECT MaChuyenGia FROM inserted)
            AND d.TrangThai = 'Đang thực hiện'
        )
        WHERE MaChuyenGia = (SELECT MaChuyenGia FROM inserted);
    END

    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        UPDATE ChuyenGia
        SET SoLuongDuAnDangThucHien = (
            SELECT COUNT(*)
            FROM ChuyenGia_DuAn cd
            JOIN DuAn d ON cd.MaDuAn = d.MaDuAn
            WHERE cd.MaChuyenGia = (SELECT MaChuyenGia FROM deleted)
            AND d.TrangThai = 'Đang thực hiện'
        )
        WHERE MaChuyenGia = (SELECT MaChuyenGia FROM deleted);
    END
END;

-- 137. Tạo một trigger để tự động tính toán và cập nhật tỷ lệ thành công của công ty dựa trên số dự án hoàn thành và tổng số dự án.
GO
ALTER TABLE CongTy
ADD TyLeThanhCong DECIMAL(5, 2) DEFAULT 0;
GO
CREATE TRIGGER trg_UpdateTyLeThanhCong
ON DuAn
FOR INSERT, DELETE, UPDATE
AS
BEGIN
    DECLARE @MaCongTy INT;
    IF EXISTS (SELECT * FROM inserted) 
    BEGIN
        SELECT @MaCongTy = MaCongTy FROM inserted;
    END
    IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @MaCongTy = MaCongTy FROM deleted;
    END
    UPDATE CongTy
    SET TyLeThanhCong = (
        SELECT 
            CAST(COUNT(CASE WHEN TrangThai = 'Hoàn thành' THEN 1 END) AS DECIMAL(5, 2)) / 
            COUNT(*) * 100
        FROM DuAn
        WHERE MaCongTy = @MaCongTy
    )
    WHERE MaCongTy = @MaCongTy;
END;

INSERT INTO CongTy (MaCongTy, TenCongTy, DiaChi, LinhVuc, SoNhanVien)
VALUES 
(6, N'TechXperts', N'789 Đường Lê Lợi, Hà Nội', N'Phát triển phần mềm', 100);
INSERT INTO DuAn (MaDuAn, TenDuAn, MaCongTy, NgayBatDau, NgayKetThuc, TrangThai)
VALUES 
(21, N'Phát triển ứng dụng di động', 6, '2024-01-01', '2024-06-30', N'Hoàn thành'),
(22, N'Triển khai hệ thống bảo mật', 6, '2024-03-01', '2024-08-30', N'Hoàn thành'),
(24, N'Phát triển website e-commerce', 6, '2024-02-01', '2024-07-31', N'Đang thực hiện');
SELECT MaCongTy, TenCongTy, TyLeThanhCong FROM CongTy WHERE MaCongTy = 6;

-- 138. Tạo một trigger để tự động ghi log mỗi khi có thay đổi trong bảng lương của chuyên gia.
CREATE TABLE LuongLog (
    LogID INT IDENTITY PRIMARY KEY,
    MaChuyenGia INT,
    LuongCu DECIMAL(10, 2),
    LuongMoi DECIMAL(10, 2),
    ThoiGianThayDoi DATETIME DEFAULT GETDATE(),
    HanhDong NVARCHAR(50)
);
GO
CREATE TRIGGER trg_LuongLog
ON ChuyenGia
FOR UPDATE
AS
BEGIN
    DECLARE @MaChuyenGia INT, @LuongCu DECIMAL(10, 2), @LuongMoi DECIMAL(10, 2);
    SELECT @MaChuyenGia = MaChuyenGia, @LuongCu = Luong, @LuongMoi = (SELECT Luong FROM inserted)
    FROM deleted;
    INSERT INTO LuongLog (MaChuyenGia, LuongCu, LuongMoi, HanhDong)
    VALUES (@MaChuyenGia, @LuongCu, @LuongMoi, N'UPDATE');
END;
UPDATE ChuyenGia
SET Luong = 12000
WHERE MaChuyenGia = 22;
SELECT * FROM ChuyenGia
SELECT * FROM LuongLog;
-- 139. Tạo một trigger để tự động cập nhật số lượng chuyên gia cấp cao trong mỗi công ty.
ALTER TABLE CongTy
ADD SoLuongChuyenGiaCapCao INT DEFAULT 0;
GO
CREATE TRIGGER trg_UpdateSoLuongChuyenGiaCapCao
ON CongTy
FOR INSERT, UPDATE, DELETE
AS
BEGIN
    DECLARE @MaCongTy INT;
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @MaCongTy = MaCongTy FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @MaCongTy = MaCongTy FROM deleted;
    END
    UPDATE CongTy
    SET SoLuongChuyenGiaCapCao = (
        SELECT COUNT(*) 
        FROM ChuyenGia
        WHERE MaCongTy = @MaCongTy AND NamKinhNghiem >= 8
    )
    WHERE MaCongTy = @MaCongTy;
END;


-- 140. Tạo một trigger để tự động cập nhật trạng thái "cần bổ sung nhân lực" cho dự án khi số lượng chuyên gia tham gia ít hơn yêu cầu.
GO
CREATE TRIGGER trg_UpdateTrangThaiDuAn
ON ChuyenGia_DuAn
FOR INSERT, DELETE
AS
BEGIN
    DECLARE @MaDuAn INT;
    IF EXISTS (SELECT * FROM inserted)
    BEGIN
        SELECT @MaDuAn = MaDuAn FROM inserted;
    END
    ELSE IF EXISTS (SELECT * FROM deleted)
    BEGIN
        SELECT @MaDuAn = MaDuAn FROM deleted;
    END
    DECLARE @SoLuongChuyenGia INT;
    SELECT @SoLuongChuyenGia = COUNT(*) 
    FROM ChuyenGia_DuAn 
    WHERE MaDuAn = @MaDuAn;
    IF @SoLuongChuyenGia < 70
    BEGIN
        UPDATE DuAn
        SET TrangThai = N'Cần bổ sung nhân lực'
        WHERE MaDuAn = @MaDuAn;
    END
    ELSE
    BEGIN
        UPDATE DuAn
        SET TrangThai = N'Đang thực hiện'
        WHERE MaDuAn = @MaDuAn;
    END
END;


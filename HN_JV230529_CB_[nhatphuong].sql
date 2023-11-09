CREATE DATABASE IF NOT EXISTS QuanLydiemthi;

USE QuanLydiemthi;
CREATE TABLE IF NOT EXISTS Student
(
    StudentId   VARCHAR(50) NOT NULL PRIMARY KEY,
    StudentName VARCHAR(30) NOT NULL,
    birtday     DATE,
    Address     VARCHAR(50),
    Phone       VARCHAR(45),
    gender      BIT
    
);
CREATE TABLE IF NOT EXISTS Subject
(
    SubjectId VARCHAR(50) NOT NULL PRIMARY KEY,
    SubjectName VARCHAR(30) NOT NULL,
    priority int
    
);
CREATE TABLE IF NOT EXISTS Mark
(
	StudentId VARCHAR(50) NOT NULL,
    SubjectId VARCHAR(50) NOT NULL,
    point float,
    PRIMARY KEY (StudentId, SubjectId)
);
alter table Mark
add constraint fk_StudentId foreign key (StudentId) references Student(StudentId);
alter table Mark
add constraint fk_SubjectId foreign key (SubjectId) references Subject(SubjectId);


INSERT INTO Student (StudentId, StudentName, birtday, gender, Address, Phone)
VALUES ('S001','Nguyễn Thế Anh','1999-01-11',1,'Hà Nội','984678082'),
       ('S002','Đặng Bảo Trâm','1998-12-22',0,'Lào Cai','904982654'),
       ('S003','Trần Hà Phương','2000-05-05',0,'Nghệ An','947645363'),
       ('S004','Đỗ Tiến Mạnh','1999-3-26',1,'Hà Nội','983665353'),
       ('S005','Phạm Duy Nhất','1998-10-04',1,'Tuyên Quang','987242678'),
       ('S006','Mai Văn Thái','2002-6-26',1,'Nam Định','982654268'),
       ('S007','Giang Gia Hân','1996-11-10',0,'Phú Thọ','982364753'),
       ('S008','Nguyễn Ngọc Bảo My','1999-01-22',0,'Hà Nam','984567264'),
       ('S009','Nguyễn Tiến Đạt','1998-08-07',1,'Tuyên Quang','986345621'),
       ('S010','Nguyễn Thiều Quang','2000-09-18',1,'Hà Nội','9846325761');

INSERT INTO Subject (SubjectId, SubjectName, priority)
VALUES
    ('MH01', 'Toán', 2),
    ('MH02', 'Vật Lý', 2),
    ('MH03', 'Hóa Học', 1),
    ('MH04', 'Ngữ Văn', 1),
    ('MH05', 'Tiếng Anh', 2);

INSERT INTO MARK (SubjectId, StudentId, point)
VALUES ('MH01', 'S001', 8.5),
('MH02', 'S001', 7),
('MH03', 'S001', 9),
('MH04', 'S001', 9),
('MH05', 'S001', 5),
('MH01', 'S002', 9),
('MH02', 'S002', 8),
('MH03', 'S002', 6.5),
('MH04', 'S002', 8),
('MH05', 'S002', 6),
('MH01', 'S003', 7.5),
('MH02', 'S003', 6.5),
('MH03', 'S003', 8),
('MH04', 'S003', 7),
('MH05', 'S003', 7),
('MH01', 'S004', 6),
('MH02', 'S004', 7),
('MH03', 'S004', 5),
('MH04', 'S004', 6.5),
('MH05', 'S004', 8),
('MH01', 'S005', 5.5),
('MH02', 'S005', 8),
('MH03', 'S005', 7.5),
('MH04', 'S005', 8.5),
('MH05', 'S005', 9),
('MH01', 'S006', 8),
('MH02', 'S006', 10),
('MH03', 'S006', 9),
('MH04', 'S006', 7.5),
('MH05', 'S006', 6.5),
('MH01', 'S007', 9.5),
('MH02', 'S007', 9),
('MH03', 'S007', 6),
('MH04', 'S007', 9),
('MH05', 'S007', 4),
('MH01', 'S008', 10),
('MH02', 'S008', 8.5),
('MH03', 'S008', 8.5),
('MH04', 'S008', 6),
('MH05', 'S008', 9.5),
('MH01', 'S009', 7.5),
('MH02', 'S009', 7),
('MH03', 'S009', 9),
('MH04', 'S009', 5),
('MH05', 'S009', 10),
('MH01', 'S010', 6.5),
('MH02', 'S010', 8),
('MH03', 'S010', 5.5),
('MH04', 'S010', 4),
('MH05', 'S010', 7);

/*bai2*/
-- Sửa tên sinh viên có mã `S004` thành “Đỗ Đức Mạnh”.
UPDATE Student
SET StudentName = 'Đỗ Đức Mạnh'
WHERE StudentId = 'S004';
-- Sửa tên và hệ số môn học có mã `MH05` thành “NgoạiNgữ” và hệ số là 1.
UPDATE Subject
SET SubjectName = 'Ngoại Ngữ', priority = 1
WHERE SubjectId = 'MH05';
-- Cập nhật lại điểm của học sinh có mã `S009` thành (MH01 : 8.5, MH02 : 7,MH03 : 5.5, MH04 : 6,MH05 : 9).
-- Cập nhật điểm cho môn Toán (MH01)
UPDATE Mark
SET point = 8.5
WHERE StudentId = 'S009' AND SubjectId = 'MH01';
-- Cập nhật điểm cho môn Vật Lý (MH02)
UPDATE Mark
SET point = 7
WHERE StudentId = 'S009' AND SubjectId = 'MH02';
-- Cập nhật điểm cho môn Hóa Học (MH03)
UPDATE Mark
SET point = 5.5
WHERE StudentId = 'S009' AND SubjectId = 'MH03';
-- Cập nhật điểm cho môn Ngữ Văn (MH04)
UPDATE Mark
SET point = 6
WHERE StudentId = 'S009' AND SubjectId = 'MH04';
-- Cập nhật điểm cho môn Tiếng Anh (MH05)
UPDATE Mark
SET point = 9
WHERE StudentId = 'S009' AND SubjectId = 'MH05';
-- bài3 
-- Xoá toàn bộ thông tin của học sinh có mã `S010` bao gồm điểm thi ở bảng MARK và thông tin học sinh này ở bảng STUDENT.
DELETE FROM Mark
WHERE StudentId = 'S010';
DELETE FROM Student
WHERE StudentId = 'S010';

-- bài 3
-- Lấy ra tất cả thông tin của sinh viên trong bảng Student .
SELECT * FROM student;
-- Hiển thị tên và mã môn học của những môn có hệ số bằng 1.
SELECT SubjectId, SubjectName
FROM Subject
WHERE priority = 1;
/*Hiển thị thông tin học sinh bào gồm: mã học sinh, tên học sinh, tuổi (bằng năm hiện tại trừ
năm sinh) , giới tính (hiển thị nam hoặc nữ) và quê quán của tất cả học sinh.*/
SELECT
    StudentId,
    StudentName,
    YEAR(CURDATE()) - YEAR(birthday) AS Tuoi,
    CASE
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
        ELSE 'Không xác định'
    END AS GioiTinh,
    Address AS QueQuan
FROM Student;
/* Hiển thị thông tin bao gồm: tên học sinh, tên môn học , điểm thi của tất cả học sinh của môn
Toán và sắp xếp theo điểm giảm dần.*/
SELECT
    Student.StudentName AS TenHocSinh,
    Subject.SubjectName AS TenMonHoc,
    Mark.point AS DiemThi
FROM Mark
JOIN Student ON Mark.StudentId = Student.StudentId
JOIN Subject ON Mark.SubjectId = Subject.SubjectId
WHERE Subject.SubjectName = 'Toán'
ORDER BY Mark.point DESC;

-- Thống kê số lượng học sinh theo giới tính ở trong bảng (Gồm 2 cột: giới tính và số lượng).
SELECT
    CASE
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
        ELSE 'Không xác định'
    END AS GioiTinh,
    COUNT(*) AS SoLuong
FROM Student
GROUP BY GioiTinh;

/*Tính tổng điểm và điểm trung bình của các môn học theo từng học sinh (yêu cầu sử dụng hàm
để tính toán) , bảng gồm mã học sinh, tên hoc sinh, tổng điểm và điểm trung bình.*/
SELECT
    Student.StudentId AS MaHocSinh,
    Student.StudentName AS TenHocSinh,
    SUM(Mark.point) AS TongDiem,
    AVG(Mark.point) AS DiemTrungBinh
FROM Mark
JOIN Student ON Mark.StudentId = Student.StudentId
GROUP BY Student.StudentId, Student.StudentName;

-- bài 4
/* Tạo VIEW có tên STUDENT_VIEW lấy thông tin sinh viên bao gồm : mã học sinh, tên học
sinh, giới tính , quê quán .*/
CREATE VIEW STUDENT_VIEW AS
SELECT
    StudentId AS MaHocSinh,
    StudentName AS TenHocSinh,
    CASE
        WHEN gender = 1 THEN 'Nam'
        WHEN gender = 0 THEN 'Nữ'
        ELSE 'Không xác định'
    END AS GioiTinh,
    Address AS QueQuan
FROM Student;
/* Tạo VIEW có tên AVERAGE_MARK_VIEW lấy thông tin gồm:mã học sinh, tên học sinh,
điểm trung bình các môn học */
CREATE VIEW AVERAGE_MARK_VIEW AS
SELECT
    Mark.StudentId AS MaHocSinh,
    Student.StudentName AS TenHocSinh,
	AVG(Mark.point) AS DiemTrungBinh
FROM Mark
JOIN Student ON Mark.StudentId = Student.StudentId
GROUP BY Mark.StudentId, Student.StudentName;

-- Đánh Index cho trường `phoneNumber` của bảng STUDENT.
CREATE INDEX index_phoneNumber ON Student (Phone);

/*- Tạo PROC_INSERTSTUDENT dùng để thêm mới 1 học sinh bao gồm tất cả
thông tin học sinh đó.*/

DELIMITER &&
CREATE PROCEDURE PROC_INSERTSTUDENT(
    IN p_StudentId VARCHAR(50),
    IN p_StudentName VARCHAR(30),
    IN p_birtday DATE,
    IN p_Address VARCHAR(50),
    IN p_Phone VARCHAR(45),
    IN p_gender BIT
)
BEGIN
    INSERT INTO Student (StudentId, StudentName, birtday, Address, Phone, gender)
    VALUES (p_StudentId, p_StudentName, p_birtday, p_Address, p_Phone, p_gender);
END &&
DELIMITER ;
CALL PROC_INSERTSTUDENT('S011', 'Nguyễn Thế Afnh', '1999-01-11', 'Hà Nội', '984678082', 1);
-- Tạo PROC_UPDATESUBJECT dùng để cập nhật tên môn học theo mã môn học.
DELIMITER &&
CREATE PROCEDURE PROC_UPDATESUBJECT(
    IN p_SubjectId VARCHAR(50),
    IN p_NewSubjectName VARCHAR(30)
)
BEGIN
    UPDATE Subject
    SET SubjectName = p_NewSubjectName
    WHERE SubjectId = p_SubjectId;
END &&
DELIMITER ;
CALL PROC_UPDATESUBJECT('MH05', 'GDCD');

-- Tạo PROC_DELETEMARK dùng để xoá toàn bộ điểm các môn học theo mã học sinh và trả về số bản ghi đã xóa.
DELIMITER &&
CREATE PROCEDURE PROC_DELETEMARK(IN Student_Id int)
BEGIN
    DELETE from Student WHERE StudentId = Student_Id;
END &&
CALL PROC_DELETEMARK();

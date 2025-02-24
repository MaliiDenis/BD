-- =============================================
-- 1 �������� ���� ������ "Virtual_Museum", ���� ��� ����������
-- =============================================
IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'Virtual_Museum')
BEGIN
    ALTER DATABASE [Virtual_Museum] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    PRINT '���� ������ Artifact_DB ���������� � ����� SINGLE_USER � ��� ���������� ���������.';
END;
GO

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'Virtual_Museum')
BEGIN
    DROP DATABASE [Virtual_Museum];
    PRINT '���� ������ Virtual_Museum ���� ������� �������.';
END;
ELSE
BEGIN
    PRINT '���� ������ Virtual_Museum �� ����������.';
END;
GO

-- =============================================
-- 1.1 �������� ���� ������ "Virtual_Museum"
-- =============================================
CREATE DATABASE [Virtual_Museum];
GO
ALTER DATABASE [Virtual_Museum] SET MULTI_USER;
PRINT '���� ������ Virtual_Museum ���� ������� �������.';
GO

-- =============================================
-- ������������� ���� ������ "Virtual_Museum"
-- =============================================
USE Virtual_Museum;
GO

-- =============================================
-- 1.2 �������� ������
-- =============================================
-- ������� ���������
CREATE TABLE Artifacts (
    ID_��������� INT PRIMARY KEY,
    �������� VARCHAR(100) NOT NULL,
    �������� TEXT NOT NULL,
    ����_�������� DATE NOT NULL,
    ������_������������� VARCHAR(50) NOT NULL,
    ���_��������� VARCHAR(50) NOT NULL
);

-- ������� ��������
CREATE TABLE Exhibitions (
    ID_�������� INT PRIMARY KEY,
    ��������_�������� VARCHAR(100) NOT NULL,
    ����_������ DATE NOT NULL,
    ����_��������� DATE NOT NULL,
    ID_�������� INT NOT NULL
);

-- ������� ������������_��������
CREATE TABLE Exhibited_Artifacts (
    ID_��������� INT,
    ID_�������� INT,
    ����_���������� DATE NOT NULL,
    PRIMARY KEY (ID_���������, ID_��������)
);

-- ������� �������
CREATE TABLE Curators (
    ID_�������� INT PRIMARY KEY,
    ��� VARCHAR(100) NOT NULL,
    ������������� VARCHAR(100) NOT NULL,
    ����������_���������� VARCHAR(100) NOT NULL
);

-- ������� ����������
CREATE TABLE Visitors (
    ID_���������� INT PRIMARY KEY,
    ��� VARCHAR(100) NOT NULL,
    ����_��������� DATE NOT NULL,
    ����_��������� DATE NOT NULL,
    ID_�������� INT NOT NULL
);

-- =============================================
-- 1.3 ���������� �������� ������ 
-- =============================================

-- ������� ������ � ������� ���������
INSERT INTO Artifacts (ID_���������, ��������, ��������, ����_��������, ������_�������������, ���_���������)
VALUES
(1, '������� ���', '��� ����� ��������, ���������������� � ������ ���������.', '0900-01-01', '�����', '������'),
(2, '���������� �����', '����������, ������������ ���� ����� �����, ��������� �� �������.', '1500-06-15', '������', '����������'),
(3, '�������� � ����������', '������� ��������� �������� � �������� �� ���������.', '2000-04-23', '�����������', '��������'),
(4, '������� ����', '����, ������������� � ������� �������, ���������� ������������� �����������.', '0200-01-01', '������', '������'),
(5, '���������� ���������', '��������� ��������� �������, ��������� �� ������ � ������.', '3000-01-01', '������', '�����������'),
(6, '������������� �����', '����� ����� �������������, ���������� ������������ �������.', '1300-09-05', '�������', '���������'),
(7, '��������� ������', '����� �� ���������� ������� � ������������ �������.', '1000-11-22', '�����', '������'),
(8, '��������� ��������', '���� � ������������� �������������� ����, ��������� � ������� ������.', '0500-02-17', '������', '������'),
(9, '���������� ����', '���� � ���������� ������, ������������ � ������.', '1500-07-10', '����', '�����'),
(10, '������� ������', '������� ������ ������� ������� � ������������ ����������.', '0200-03-20', '������', '������'),
(11, '��������� ���', '���, ���������������� �������� � ����.', '0300-03-10', '��������', '������'),
(12, '��������� �����', '���������� ����� � ��������� �����������.', '1200-09-01', '�������', '�����������'),
(13, '��������� ���������', '��������� ���� ����, ��������� �� ������.', '0900-06-15', '�����', '�����������'),
(14, '�������� ������', '������ ������ � ������������ ������.', '1400-05-01', '������', '��������'),
(15, '��������� �����', '�������� �����, ��������� � ������ �������� ��������� �����������.', '1500-02-12', '�������', '�����������');

-- ������� ������ � ������� ��������
INSERT INTO Exhibitions (ID_��������, ��������_��������, ����_������, ����_���������, ID_��������)
VALUES
(1, '��������� �������� ����', '2024-01-01', '2025-06-20', 1),
(2, '��������� � ����������', '2024-02-05', '2024-12-31', 2),
(3, '������� ������� ������', '2024-03-10', '2024-12-31', 3),
(4, '������� ������', '2024-04-15', '2024-12-31', 4),
(5, '�������� �������� � ������������', '2024-05-20', '2024-12-31', 5),
(6, '�������� ������������', '2024-06-25', '2024-12-31', 6),
(7, '��������� � �������������', '2024-07-30', '2024-12-31', 7),
(8, '����������� � ���������� ����������', '2024-09-05', '2024-12-31', 8),
(9, '������� ���������', '2024-10-10', '2024-12-31', 9),
(10, '������� ������������ � ���������', '2024-11-15', '2024-12-15', 10),
(11, '��������� �������� �������', '2025-01-01', '2025-02-01', 11),
(12, '������������� ���������', '2025-02-05', '2025-03-05', 12),
(13, '����� ��������', '2025-03-10', '2025-04-10', 13),
(14, '������� �����������', '2025-04-15', '2025-05-15', 14),
(15, '�������� � �������', '2025-05-20', '2025-06-20', 15);

-- ������� ������ � ������� ������������_��������
INSERT INTO Exhibited_Artifacts (ID_���������, ID_��������, ����_����������)
VALUES
(1, 1, '2024-01-01'),
(2, 1, '2024-01-01'),
(3, 2, '2024-02-06'),
(4, 3, '2024-03-12'),
(5, 4, '2024-04-18'),
(6, 5, '2024-05-22'),
(7, 6, '2024-06-28'),
(8, 7, '2024-07-10'),
(9, 8, '2024-08-15'),
(10, 9, '2024-09-01'),
(11, 10, '2024-10-15'),
(12, 11, '2025-01-01'),
(13, 12, '2025-02-06'),
(14, 13, '2025-03-12'),
(15, 14, '2025-04-18');

-- ������� ������ � ������� �������
INSERT INTO Curators (ID_��������, ���, �������������, ����������_����������)
VALUES
(1, '���� ������', '�������', 'ivan.petrov@example.com'),
(2, '����� �������', '��������', 'maria.ivanova@example.com'),
(3, '������� �������', '�����������', 'dmitriy.sidorov@example.com'),
(4, '���� ���������', '��������', 'anna.mikhaylova@example.com'),
(5, '���� ��������', '����������', 'oleg.kuznetsov@example.com'),
(6, '����� ������', '�������� �������', 'elena.orlova@example.com'),
(7, '������� �������', '����������� �� ���������', 'aleksey.smirnov@example.com'),
(8, '������� ��������', '�����������', 'natalya.borisova@example.com'),
(9, '�������� �������', '������� �� ����������', 'vladimir.fedorov@example.com'),
(10, '�������� �������', '�������������', 'svetlana.zaytseva@example.com'),
(11, '������� ��������', '������� �� ������� ���������', 'tatiana.romanova@example.com'),
(12, '������ ��������', '�������������� ������', 'maxim.alekseev@example.com'),
(13, '��������� ������', '������������� �������', 'ekaterina.belova@example.com'),
(14, '������� �������', '������� �� ��������', 'nikolay.zaharov@example.com'),
(15, '��������� ��������', '��������', 'margarita.kovaleva@example.com');

-- ������� ������ � ������� ����������
INSERT INTO Visitors (ID_����������, ���, ����_���������, ����_���������, ID_��������)
VALUES
(1, '������� ������', '2024-01-01', '2024-01-10', 1),
(2, '������ ��������', '2024-02-06', '2024-02-15', 2),
(3, '���� ��������', '2024-03-12', '2024-03-20', 3),
(4, '�������� ��������', '2024-04-18', '2024-04-25', 4),
(5, '����� �������', '2024-05-22', '2024-05-30', 5),
(6, '������� �������', '2024-06-28', '2024-07-05', 6),
(7, '������� �������', '2024-07-10', '2024-07-18', 7),
(8, '�������� ������', '2024-08-15', '2024-08-22', 8),
(9, '��������� ��������', '2024-09-01', '2024-09-10', 9),
(10, 'ϸ�� �������', '2024-10-15', '2024-10-25', 10),
(11, '���� ������', '2025-01-01', '2025-01-10', 11),
(12, '������� ���������', '2025-02-06', '2025-02-15', 12),
(13, '����� �������', '2025-03-12', '2025-03-20', 13),
(14, '������ ��������', '2025-04-18', '2025-04-25', 14),
(15, '��������� ���������', '2025-05-22', '2025-05-30', 15);

-- =============================================
-- 6. ������ ���� ������������ �������
-- =============================================

-- ������� 1.1.1
-- ������� �������������, ���� ��� ��� ����������
IF OBJECT_ID('v_ExhibitedArtifacts', 'V') IS NOT NULL
    DROP VIEW v_ExhibitedArtifacts;
GO

-- ������ �������������
CREATE VIEW v_ExhibitedArtifacts AS
SELECT 
    e.ID_��������,
    e.��������_��������,
    a.ID_���������,
    a.��������,
    a.��������,
    ea.����_����������
FROM Exhibitions e
JOIN Exhibited_Artifacts ea ON e.ID_�������� = ea.ID_��������
JOIN Artifacts a ON ea.ID_��������� = a.ID_���������;
GO

-- ��������� �������������
SELECT * FROM v_ExhibitedArtifacts;

-- ������� 1.1.2
-- ������� ������ �������������
IF OBJECT_ID('v_ExhibitedArtifacts', 'V') IS NOT NULL
    DROP VIEW v_ExhibitedArtifacts;
GO

-- ������ ���������� �������������
CREATE VIEW v_ExhibitedArtifacts AS
SELECT 
    e.ID_��������,
    e.��������_��������,
    a.ID_���������,
    a.��������,
    a.��������,
    ea.����_����������
FROM Exhibitions e
JOIN Exhibited_Artifacts ea ON e.ID_�������� = ea.ID_��������
JOIN Artifacts a ON ea.ID_��������� = a.ID_���������;
GO

-- ��������� �������������
SELECT * FROM v_ExhibitedArtifacts;

-- ������� 1.2.1
-- ������ ���� �������������� (���� � ���)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'administrator')
    CREATE ROLE administrator;
GO

-- ������ ���� ������������ (���� � ���)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'user')
    CREATE ROLE [user];
GO

-- ���� �������������� ������ ������ (CONTROL = ������ ������ � SQL Server)
GRANT CONTROL ON DATABASE::Virtual_Museum TO administrator;
GO

-- ���� ������������ ����� ������ �� �������� ���� ������ � dbo
GRANT SELECT ON SCHEMA::dbo TO [user];
GO

-- ��������� ��������� ����
SELECT * FROM sys.database_principals WHERE type = 'R';
GO

-- ������� 1.3.1
-- ������ ������������-�������������� (���� ����� �� ����������)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'admin_user')
    CREATE LOGIN admin_user WITH PASSWORD = 'AdminPass123';
GO

-- ������ ������������ � ������� ���� (���� ��� ���)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'admin_user')
    CREATE USER admin_user FOR LOGIN admin_user;
GO

-- ��������� ������������ � ���� ��������������
ALTER ROLE administrator ADD MEMBER admin_user;
GO

-- ������ ������������ � ������� ������ �� ������ (���� ����� �� ����������)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'read_only_user')
    CREATE LOGIN read_only_user WITH PASSWORD = 'UserPass123';
GO

-- ������ ������������ � ������� ���� (���� ��� ���)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'read_only_user')
    CREATE USER read_only_user FOR LOGIN read_only_user;
GO

-- ��������� ������������ � ���� [user]
ALTER ROLE [user] ADD MEMBER read_only_user;
GO

-- ��������� ��������� �������������
SELECT * FROM sys.database_principals WHERE type = 'S';
GO

-- ������� 1.3.2
-- ������ ������������-��������� (���� ����� �� ����������)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'editor_user')
    CREATE LOGIN editor_user WITH PASSWORD = 'EditPass123';
GO

-- ������ ������������ � ������� ���� (���� ��� ���)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'editor_user')
    CREATE USER editor_user FOR LOGIN editor_user;
GO

-- ��������� ������������ ���������, ������� � ������������� ������
GRANT INSERT, SELECT ON SCHEMA::dbo TO editor_user;
GO

-- ��������� �������� ������
REVOKE DELETE ON SCHEMA::dbo FROM editor_user;
GO

-- ��������� ��������� ������ � ������� Artifacts
DENY SELECT, INSERT, UPDATE, DELETE ON Artifacts TO editor_user;
GO

-- ��������� ����� editor_user
SELECT * FROM sys.database_permissions WHERE grantee_principal_id = DATABASE_PRINCIPAL_ID('editor_user');
GO

-- ������� 1.4.1
-- ������ ������� ��� ������� Exhibitions
CREATE SYNONYM MyExhibitions FOR Virtual_Museum.dbo.Exhibitions;
GO

-- ���������� �������
SELECT * FROM MyExhibitions;
GO

-- ������� 1.4.2
-- ������ �������� ���������
CREATE PROCEDURE GetExhibitionArtifacts
    @ExhibitionID INT
AS
BEGIN
    SELECT a.ID_���������, a.��������, a.��������
    FROM Artifacts a
    JOIN Exhibited_Artifacts ea ON a.ID_��������� = ea.ID_���������
    WHERE ea.ID_�������� = @ExhibitionID;
END;
GO

-- ������ ������� ��� ���������
CREATE SYNONYM MyGetExhibitionArtifacts FOR Virtual_Museum.dbo.GetExhibitionArtifacts;
GO

-- ���������� ������� ��� ������ ���������
EXEC MyGetExhibitionArtifacts @ExhibitionID = 1;
GO

-- ������� 1.5.1
-- ������ ����� �������� �������
CREATE TABLE Visitors_Test (
    ID_���������� INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED, -- ������ PK ������������������
    ��� VARCHAR(100) NOT NULL,
    ����_��������� DATE NOT NULL,
    ����_��������� DATE NOT NULL,
    ID_�������� INT NOT NULL
);
GO

-- ��������� ��������� �������
INSERT INTO Visitors_Test (���, ����_���������, ����_���������, ID_��������)
VALUES 
    ('������� ������', '2024-01-01', '2024-01-10', 1),
    ('������ ��������', '2024-02-06', '2024-02-15', 2),
    ('���� ��������', '2024-03-12', '2024-03-20', 3),
    ('�������� ��������', '2024-04-18', '2024-04-25', 4),
    ('����� �������', '2024-05-22', '2024-05-30', 5);
GO

-- ������ ���������������� ������ �� ����_���������
CREATE CLUSTERED INDEX IX_Visitors_Test_VisitDate
ON Visitors_Test (����_���������);
GO

-- ���������, �������� �� ������
SELECT * FROM Visitors_Test ORDER BY ����_���������;
GO

-- ������ ������������������ ������ �� ���
CREATE NONCLUSTERED INDEX IX_Visitors_Test_Name
ON Visitors_Test (���);
GO

-- ������� 1.5.2
-- =======================
-- 1. ��������� ���������� ��� ������� (�������� ����� ����������)
-- =======================
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT * FROM Visitors_Test ORDER BY ���;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- =======================
-- 2. ������ ������������������ ������ �� ���
-- =======================
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Visitors_Test_Name' AND object_id = OBJECT_ID('Visitors_Test'))
    DROP INDEX IX_Visitors_Test_Name ON Visitors_Test;
GO

CREATE NONCLUSTERED INDEX IX_Visitors_Test_Name
ON Visitors_Test (���);
GO

-- =======================
-- 3. ��������� ���������� �����, ������ � ��������
-- =======================
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT * FROM Visitors_Test ORDER BY ���;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- =======================
-- 4. ������������� ����� ����������
-- =======================
SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('Visitors_Test'), NULL, NULL, 'DETAILED');
GO
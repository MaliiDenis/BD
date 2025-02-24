-- =============================================
-- 1 Удаление базы данных "Virtual_Museum", если она существует
-- =============================================
IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'Virtual_Museum')
BEGIN
    ALTER DATABASE [Virtual_Museum] SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    PRINT 'База данных Artifact_DB переведена в режим SINGLE_USER и все соединения завершены.';
END;
GO

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE Name = 'Virtual_Museum')
BEGIN
    DROP DATABASE [Virtual_Museum];
    PRINT 'База данных Virtual_Museum была успешно удалена.';
END;
ELSE
BEGIN
    PRINT 'База данных Virtual_Museum не существует.';
END;
GO

-- =============================================
-- 1.1 Создание базы данных "Virtual_Museum"
-- =============================================
CREATE DATABASE [Virtual_Museum];
GO
ALTER DATABASE [Virtual_Museum] SET MULTI_USER;
PRINT 'База данных Virtual_Museum была успешно создана.';
GO

-- =============================================
-- Использование базы данных "Virtual_Museum"
-- =============================================
USE Virtual_Museum;
GO

-- =============================================
-- 1.2 Создание таблиц
-- =============================================
-- Таблица Артефакты
CREATE TABLE Artifacts (
    ID_Артефакта INT PRIMARY KEY,
    Название VARCHAR(100) NOT NULL,
    Описание TEXT NOT NULL,
    Дата_создания DATE NOT NULL,
    Страна_происхождения VARCHAR(50) NOT NULL,
    Тип_артефакта VARCHAR(50) NOT NULL
);

-- Таблица Выставки
CREATE TABLE Exhibitions (
    ID_Выставки INT PRIMARY KEY,
    Название_выставки VARCHAR(100) NOT NULL,
    Дата_начала DATE NOT NULL,
    Дата_окончания DATE NOT NULL,
    ID_Куратора INT NOT NULL
);

-- Таблица Выставленный_Артефакт
CREATE TABLE Exhibited_Artifacts (
    ID_Артефакта INT,
    ID_Выставки INT,
    Дата_добавления DATE NOT NULL,
    PRIMARY KEY (ID_Артефакта, ID_Выставки)
);

-- Таблица Куратор
CREATE TABLE Curators (
    ID_Куратора INT PRIMARY KEY,
    Имя VARCHAR(100) NOT NULL,
    Специализация VARCHAR(100) NOT NULL,
    Контактная_информация VARCHAR(100) NOT NULL
);

-- Таблица Посетители
CREATE TABLE Visitors (
    ID_Посетителя INT PRIMARY KEY,
    Имя VARCHAR(100) NOT NULL,
    Дата_посещения DATE NOT NULL,
    Дата_окончания DATE NOT NULL,
    ID_Выставки INT NOT NULL
);

-- =============================================
-- 1.3 Добавление тестовых данных 
-- =============================================

-- Вставка данных в таблицу Артефакты
INSERT INTO Artifacts (ID_Артефакта, Название, Описание, Дата_создания, Страна_происхождения, Тип_артефакта)
VALUES
(1, 'Древний меч', 'Меч эпохи викингов, использовавшийся в боевых действиях.', '0900-01-01', 'Дания', 'Оружие'),
(2, 'Скульптура Амура', 'Скульптура, изображающая бога любви Амура, сделанная из мрамора.', '1500-06-15', 'Италия', 'Скульптура'),
(3, 'Табличка с клинописью', 'Древняя шумерская табличка с надписью на клинописи.', '2000-04-23', 'Месопотамия', 'Документ'),
(4, 'Римская чаша', 'Чаша, изготовленная в Римской империи, украшенная традиционными орнаментами.', '0200-01-01', 'Италия', 'Посуда'),
(5, 'Египетская статуэтка', 'Маленькая статуэтка фараона, сделанная из дерева и золота.', '3000-01-01', 'Египет', 'Иконография'),
(6, 'Средневековая брошь', 'Брошь эпохи Средневековья, украшенная драгоценными камнями.', '1300-09-05', 'Франция', 'Украшение'),
(7, 'Китайский фарфор', 'Чашка из китайского фарфора с изображением дракона.', '1000-11-22', 'Китай', 'Посуда'),
(8, 'Греческая керамика', 'Чаша с изображениями мифологических сцен, созданная в Древней Греции.', '0500-02-17', 'Греция', 'Посуда'),
(9, 'Персидский ковёр', 'Ковёр с уникальным узором, произведённый в Персии.', '1500-07-10', 'Иран', 'Ткани'),
(10, 'Золотая монета', 'Золотая монета Римской империи с изображением императора.', '0200-03-20', 'Италия', 'Монеты'),
(11, 'Кельтский щит', 'Щит, использовавшийся кельтами в боях.', '0300-03-10', 'Ирландия', 'Оружие'),
(12, 'Романский крест', 'Деревянный крест с латунными украшениями.', '1200-09-01', 'Испания', 'Иконография'),
(13, 'Индийская статуэтка', 'Статуэтка бога Шивы, сделанная из бронзы.', '0900-06-15', 'Индия', 'Иконография'),
(14, 'Японский свиток', 'Ручной свиток с изображением сакуры.', '1400-05-01', 'Япония', 'Документ'),
(15, 'Ацтекская маска', 'Каменная маска, созданная в период расцвета ацтекской цивилизации.', '1500-02-12', 'Мексика', 'Иконография');

-- Вставка данных в таблицу Выставки
INSERT INTO Exhibitions (ID_Выставки, Название_выставки, Дата_начала, Дата_окончания, ID_Куратора)
VALUES
(1, 'Искусство Древнего Мира', '2024-01-01', '2025-06-20', 1),
(2, 'Мифология и археология', '2024-02-05', '2024-12-31', 2),
(3, 'История Древней Греции', '2024-03-10', '2024-12-31', 3),
(4, 'Секреты языков', '2024-04-15', '2024-12-31', 4),
(5, 'Народные традиции и антропология', '2024-05-20', '2024-12-31', 5),
(6, 'Музейные исследования', '2024-06-25', '2024-12-31', 6),
(7, 'Искусство и современность', '2024-07-30', '2024-12-31', 7),
(8, 'Консервация и сохранение артефактов', '2024-09-05', '2024-12-31', 8),
(9, 'Секреты коллекций', '2024-10-10', '2024-12-31', 9),
(10, 'Научные исследования в искусстве', '2024-11-15', '2024-12-15', 10),
(11, 'Искусство Древнего Востока', '2025-01-01', '2025-02-01', 11),
(12, 'Средневековые сокровища', '2025-02-05', '2025-03-05', 12),
(13, 'Магия текстиля', '2025-03-10', '2025-04-10', 13),
(14, 'Забытые цивилизации', '2025-04-15', '2025-05-15', 14),
(15, 'Традиции и ремесла', '2025-05-20', '2025-06-20', 15);

-- Вставка данных в таблицу Выставленный_Артефакт
INSERT INTO Exhibited_Artifacts (ID_Артефакта, ID_Выставки, Дата_добавления)
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

-- Вставка данных в таблицу Куратор
INSERT INTO Curators (ID_Куратора, Имя, Специализация, Контактная_информация)
VALUES
(1, 'Иван Петров', 'Историк', 'ivan.petrov@example.com'),
(2, 'Мария Иванова', 'Археолог', 'maria.ivanova@example.com'),
(3, 'Дмитрий Сидоров', 'Культуролог', 'dmitriy.sidorov@example.com'),
(4, 'Анна Михайлова', 'Лингвист', 'anna.mikhaylova@example.com'),
(5, 'Олег Кузнецов', 'Антрополог', 'oleg.kuznetsov@example.com'),
(6, 'Елена Орлова', 'Музейный эксперт', 'elena.orlova@example.com'),
(7, 'Алексей Смирнов', 'Консультант по искусству', 'aleksey.smirnov@example.com'),
(8, 'Наталья Борисова', 'Консерватор', 'natalya.borisova@example.com'),
(9, 'Владимир Федоров', 'Эксперт по коллекциям', 'vladimir.fedorov@example.com'),
(10, 'Светлана Зайцева', 'Исследователь', 'svetlana.zaytseva@example.com'),
(11, 'Татьяна Романова', 'Эксперт по древним культурам', 'tatiana.romanova@example.com'),
(12, 'Максим Алексеев', 'Художественный критик', 'maxim.alekseev@example.com'),
(13, 'Екатерина Белова', 'Исследователь религий', 'ekaterina.belova@example.com'),
(14, 'Николай Захаров', 'Эксперт по текстилю', 'nikolay.zaharov@example.com'),
(15, 'Маргарита Ковалева', 'Антиквар', 'margarita.kovaleva@example.com');

-- Вставка данных в таблицу Посетители
INSERT INTO Visitors (ID_Посетителя, Имя, Дата_посещения, Дата_окончания, ID_Выставки)
VALUES
(1, 'Алексей Иванов', '2024-01-01', '2024-01-10', 1),
(2, 'Марина Смирнова', '2024-02-06', '2024-02-15', 2),
(3, 'Иван Кузнецов', '2024-03-12', '2024-03-20', 3),
(4, 'Светлана Тихонова', '2024-04-18', '2024-04-25', 4),
(5, 'Ольга Петрова', '2024-05-22', '2024-05-30', 5),
(6, 'Дмитрий Яковлев', '2024-06-28', '2024-07-05', 6),
(7, 'Наталья Семёнова', '2024-07-10', '2024-07-18', 7),
(8, 'Анатолий Волков', '2024-08-15', '2024-08-22', 8),
(9, 'Екатерина Соколова', '2024-09-01', '2024-09-10', 9),
(10, 'Пётр Федоров', '2024-10-15', '2024-10-25', 10),
(11, 'Олег Иванов', '2025-01-01', '2025-01-10', 11),
(12, 'Людмила Гаврилова', '2025-02-06', '2025-02-15', 12),
(13, 'Павел Ефремов', '2025-03-12', '2025-03-20', 13),
(14, 'Ксения Андреева', '2025-04-18', '2025-04-25', 14),
(15, 'Анастасия Трофимова', '2025-05-22', '2025-05-30', 15);

-- =============================================
-- 6. Запуск всех лабораторных заданий
-- =============================================

-- Задание 1.1.1
-- Удаляем представление, если оно уже существует
IF OBJECT_ID('v_ExhibitedArtifacts', 'V') IS NOT NULL
    DROP VIEW v_ExhibitedArtifacts;
GO

-- Создаём представление
CREATE VIEW v_ExhibitedArtifacts AS
SELECT 
    e.ID_Выставки,
    e.Название_выставки,
    a.ID_Артефакта,
    a.Название,
    a.Описание,
    ea.Дата_добавления
FROM Exhibitions e
JOIN Exhibited_Artifacts ea ON e.ID_Выставки = ea.ID_Выставки
JOIN Artifacts a ON ea.ID_Артефакта = a.ID_Артефакта;
GO

-- Запускаем представление
SELECT * FROM v_ExhibitedArtifacts;

-- Задание 1.1.2
-- Удаляем старое представление
IF OBJECT_ID('v_ExhibitedArtifacts', 'V') IS NOT NULL
    DROP VIEW v_ExhibitedArtifacts;
GO

-- Создаём обновлённое представление
CREATE VIEW v_ExhibitedArtifacts AS
SELECT 
    e.ID_Выставки,
    e.Название_выставки,
    a.ID_Артефакта,
    a.Название,
    a.Описание,
    ea.Дата_добавления
FROM Exhibitions e
JOIN Exhibited_Artifacts ea ON e.ID_Выставки = ea.ID_Выставки
JOIN Artifacts a ON ea.ID_Артефакта = a.ID_Артефакта;
GO

-- Запускаем представление
SELECT * FROM v_ExhibitedArtifacts;

-- Задание 1.2.1
-- Создаём роль администратора (если её нет)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'administrator')
    CREATE ROLE administrator;
GO

-- Создаём роль пользователя (если её нет)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'user')
    CREATE ROLE [user];
GO

-- Даем администратору полный доступ (CONTROL = полный доступ в SQL Server)
GRANT CONTROL ON DATABASE::Virtual_Museum TO administrator;
GO

-- Даем пользователю право только на просмотр всех таблиц в dbo
GRANT SELECT ON SCHEMA::dbo TO [user];
GO

-- Проверяем созданные роли
SELECT * FROM sys.database_principals WHERE type = 'R';
GO

-- Задание 1.3.1
-- Создаём пользователя-администратора (если логин не существует)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'admin_user')
    CREATE LOGIN admin_user WITH PASSWORD = 'AdminPass123';
GO

-- Создаём пользователя в текущей базе (если его нет)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'admin_user')
    CREATE USER admin_user FOR LOGIN admin_user;
GO

-- Добавляем пользователя в роль администратора
ALTER ROLE administrator ADD MEMBER admin_user;
GO

-- Создаём пользователя с правами только на чтение (если логин не существует)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'read_only_user')
    CREATE LOGIN read_only_user WITH PASSWORD = 'UserPass123';
GO

-- Создаём пользователя в текущей базе (если его нет)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'read_only_user')
    CREATE USER read_only_user FOR LOGIN read_only_user;
GO

-- Добавляем пользователя в роль [user]
ALTER ROLE [user] ADD MEMBER read_only_user;
GO

-- Проверяем созданных пользователей
SELECT * FROM sys.database_principals WHERE type = 'S';
GO

-- Задание 1.3.2
-- Создаём пользователя-редактора (если логин не существует)
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'editor_user')
    CREATE LOGIN editor_user WITH PASSWORD = 'EditPass123';
GO

-- Создаём пользователя в текущей базе (если его нет)
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'editor_user')
    CREATE USER editor_user FOR LOGIN editor_user;
GO

-- Разрешаем пользователю добавлять, удалять и просматривать данные
GRANT INSERT, SELECT ON SCHEMA::dbo TO editor_user;
GO

-- Запрещаем удаление данных
REVOKE DELETE ON SCHEMA::dbo FROM editor_user;
GO

-- Полностью запрещаем доступ к таблице Artifacts
DENY SELECT, INSERT, UPDATE, DELETE ON Artifacts TO editor_user;
GO

-- Проверяем права editor_user
SELECT * FROM sys.database_permissions WHERE grantee_principal_id = DATABASE_PRINCIPAL_ID('editor_user');
GO

-- Задание 1.4.1
-- Создаём синоним для таблицы Exhibitions
CREATE SYNONYM MyExhibitions FOR Virtual_Museum.dbo.Exhibitions;
GO

-- Используем синоним
SELECT * FROM MyExhibitions;
GO

-- Задание 1.4.2
-- Создаём хранимую процедуру
CREATE PROCEDURE GetExhibitionArtifacts
    @ExhibitionID INT
AS
BEGIN
    SELECT a.ID_Артефакта, a.Название, a.Описание
    FROM Artifacts a
    JOIN Exhibited_Artifacts ea ON a.ID_Артефакта = ea.ID_Артефакта
    WHERE ea.ID_Выставки = @ExhibitionID;
END;
GO

-- Создаём синоним для процедуры
CREATE SYNONYM MyGetExhibitionArtifacts FOR Virtual_Museum.dbo.GetExhibitionArtifacts;
GO

-- Используем синоним для вызова процедуры
EXEC MyGetExhibitionArtifacts @ExhibitionID = 1;
GO

-- Задание 1.5.1
-- Создаём новую тестовую таблицу
CREATE TABLE Visitors_Test (
    ID_Посетителя INT IDENTITY(1,1) PRIMARY KEY NONCLUSTERED, -- Делаем PK некластеризованным
    Имя VARCHAR(100) NOT NULL,
    Дата_посещения DATE NOT NULL,
    Дата_окончания DATE NOT NULL,
    ID_Выставки INT NOT NULL
);
GO

-- Заполняем тестовыми данными
INSERT INTO Visitors_Test (Имя, Дата_посещения, Дата_окончания, ID_Выставки)
VALUES 
    ('Алексей Иванов', '2024-01-01', '2024-01-10', 1),
    ('Марина Смирнова', '2024-02-06', '2024-02-15', 2),
    ('Иван Кузнецов', '2024-03-12', '2024-03-20', 3),
    ('Светлана Тихонова', '2024-04-18', '2024-04-25', 4),
    ('Ольга Петрова', '2024-05-22', '2024-05-30', 5);
GO

-- Создаём кластеризованный индекс на Дата_посещения
CREATE CLUSTERED INDEX IX_Visitors_Test_VisitDate
ON Visitors_Test (Дата_посещения);
GO

-- Проверяем, работает ли индекс
SELECT * FROM Visitors_Test ORDER BY Дата_посещения;
GO

-- Создаём некластеризованный индекс по Имя
CREATE NONCLUSTERED INDEX IX_Visitors_Test_Name
ON Visitors_Test (Имя);
GO

-- Задание 1.5.2
-- =======================
-- 1. Выполняем сортировку без индекса (замеряем время выполнения)
-- =======================
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT * FROM Visitors_Test ORDER BY Имя;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- =======================
-- 2. Создаём некластеризованный индекс по Имя
-- =======================
IF EXISTS (SELECT * FROM sys.indexes WHERE name = 'IX_Visitors_Test_Name' AND object_id = OBJECT_ID('Visitors_Test'))
    DROP INDEX IX_Visitors_Test_Name ON Visitors_Test;
GO

CREATE NONCLUSTERED INDEX IX_Visitors_Test_Name
ON Visitors_Test (Имя);
GO

-- =======================
-- 3. Выполняем сортировку снова, теперь с индексом
-- =======================
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
GO

SELECT * FROM Visitors_Test ORDER BY Имя;
GO

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
GO

-- =======================
-- 4. Просматриваем планы выполнения
-- =======================
SELECT * FROM sys.dm_db_index_physical_stats(DB_ID(), OBJECT_ID('Visitors_Test'), NULL, NULL, 'DETAILED');
GO
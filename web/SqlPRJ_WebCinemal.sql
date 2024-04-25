CREATE DATABASE webcinemal
USE webcinemal
-- Tạo bảng User

CREATE TABLE [User] (
    [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [username] VARCHAR(50) UNIQUE NOT NULL,
    [password] VARCHAR(50) NOT NULL,
    [name] VARCHAR(100) NOT NULL,
    [Gender] NVARCHAR(50) NULL,
    [PhoneNumber] NVARCHAR(50) NOT  NULL,
    [email] NVARCHAR(50) NOT NULL,
    [BirthDay] NVARCHAR(50) not NULL,
	role int not null
);


CREATE TABLE Category (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    Name VARCHAR(100)
);
-- Tạo bảng Phim
CREATE TABLE [Phim] (
    [id] INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    [tenPhim] VARCHAR(100) NOT NULL,
    [hinhAnh] VARCHAR(255) NULL,
	[hinhAnh2] VARCHAR(255) NULL,
	[introduce] VARCHAR(1000),
	[actor] VARCHAR(1000),
	[Length] INT,
	[Premiere] VARCHAR(1000),
	CategoryId1 INT FOREIGN KEY REFERENCES Category(CategoryID),
	CategoryId2 INT FOREIGN KEY REFERENCES Category(CategoryID),
	Directors VARCHAR(1000),
);

CREATE TABLE [DonHang] (
    [id] INT NOT NULL IDENTITY(100000,1) PRIMARY KEY,
    [id_User] INT FOREIGN KEY REFERENCES [User]([id]), -- Liên kết với bảng User
    [id_Phim] INT FOREIGN KEY REFERENCES [Phim]([id]), -- Liên kết với bảng Phim
    [xuatChieu] INT FOREIGN KEY REFERENCES Schedule(ScheduleID) NOT NULL,
	[maPhong] varchar(100) Not NULL,
    [soLuongVe] INT NOT NULL,
	[trangthai] bit NOT NULL,
	totalPrice INT NOT NULL,
	thoigian DATETIME NOT NULL,
    -- Các cột khác của đơn hàng
);


-- Tạo bảng lịch chiếu
CREATE TABLE Schedule (
    ScheduleID INT IDENTITY(1,1) PRIMARY KEY,
    MovieID INT,
    TimeSlot VARCHAR(50),
    Theater VARCHAR(10),
    Date VARCHAR(10),
    FOREIGN KEY (MovieID) REFERENCES Phim(ID)
);

CREATE TABLE seat (
PRIMARY KEY(id_Schedule,nameSeat),
nameSeat VARCHAR(50),
id_Schedule INT,
idSeat int,
trangThai bit not null,
FOREIGN KEY (id_Schedule) REFERENCES Schedule(ScheduleID),
);

-- Thêm dữ liệu vào bảng User
INSERT INTO [User] ([username], [password], [name], [Gender], [PhoneNumber], [email], [BirthDay],role)
VALUES
    ('trung', '123', 'trubg', 'Female', '123456789', 'trung@gmail.com', '20032-05-15',1),
    ('thanh', '456', 'thanhlor', 'male', '987654321', 'Simlor@gmail.com', '2003-09-20',1),
	('xuanhai', '12122003', 'Dang Vinh Xuan Hai', 'male', '0900001001', 'dangvinhxuanhai@gmail.com', '2003-12-12',1),
	('admin1', 'admin1', 'AdminNo1', 'male', '000000000', 'adminno1@gmail.com', '2003-11-20',0)

-- Thêm dữ liệu vào bảng Phim
INSERT INTO [Phim] ([tenPhim], [hinhAnh],[hinhAnh2] ,introduce,actor,Length,Premiere,CategoryId1,CategoryId2,Directors)
VALUES 
    ('Mai', 'dummy/mai3.jpg','dummy/mai2.jpg', 'MAI revolves around the story of the life of a woman of the same name as the 
	film. On the First-look Poster, Phuong Anh Dao makes a strong impression with her quiet, penetrating look,
	especially, on the actress lips is the image of her lying on her side on the water. Covered in a mist,
	Mais artistic poster arouses curiosity with the caption: "The past is not yet asleep, will tomorrow come?',
	'Phuong Anh Dao, Tuan Tran, Tran Thanh, Hong Dao, Uyen n, Ngoc Giau, Viet Anh, Quoc Khanh, Quynh Ly, Kha Nhu,
	Anh Duc, Thanh Hang, Ngoc Nga, Lo Lo, Kieu Linh, Ngoc Nguyen, Quynh Anh, Anh Thu.' ,
	'130','10 February 2024 (VietNam)',6,9,'Tran Thanh'),


    ('Ice Age', 'dummy/thekibangha2.png','dummy/ice-age-3.jpg','During the transition to the ice age, every animal on earth 
	searched for a warm place to live. Manny, Sid and Diego must follow in human footsteps to bring a lost boy 
	back to his family... But Diego has another plot to capture the boy because Diego is a tiger tasked with 
	capturing the boy alive. The baby returned to Soto. But during the process of going through difficulties 
	together, the three friends gained feelings for each other and then worked together to fight the evil tigers.',
	'Shameik Moore',
	'140',' 2 March 2024 (USA)',3,2,' Lecter Ches'),

	('Spiderman', 'dummy/spiderman1.jpg','dummy/spiderMan3.webp', 'Countless Spider-Mans from across universes are facing each other?!',
	'Shameik Moore','140','5 February 2024 (VietNam)',1,2,'Joaquim Dos Santos, Justin K. Thompson, Kemp Powers'),

	('Fast and Furious','dummy/fast.jpg', 'dummy/fast1.jpg', 'Dom Toretto and his family are targeted by the vengeful son of drug lord Hernan Reyes.',
	'Shameik Moore','140','5 February 2024 (USA)',1,5,'Louis Leterrier'),

	('Sniper','dummy/tayxathu.jpg', 'dummy/tayxathu1.jpg','The Marksman is an action movie mixed with light psychology. The film exploits a lot 
	of character psychology and evenly distributes action scenes. A work you can consider going to theaters to enjoy if you 
	are a fan of Liam Neeson or psychological action movies.','Way HomStone','110','7 February 2024 (VietNam)',1,4,'Liam Neeson'),
	   
	('John Wick: Chapter 3 - Parabellum', 'dummy/johnwick3.jpg', 'dummy/john_wick_2.jpg', 'Super-assassin John Wick is on the run after
	   killing a member of the international assassin guild, and with a $14 million price tag on his head, he
	   is the target of hitmen and hitwomen everywhere.',
	   'Keanu Reeves, Halle Berry, Ian McShane, Laurence Fishburne', '130', '17 May 2019 (USA)',1,6, 'Chad Stahelski'),

    ('Mad Max: Fury Road', 'dummy/mad_max_fury_road.jpg','dummy/mad_max_fury_road1.jpg', 'In a post-apocalyptic wasteland, Max teams up with a mysterious woman,
	Furiosa, to escape a tyrannical warlord and his army of followers.',
	'Tom Hardy, Charlize Theron, Nicholas Hoult, Hugh Keays-Byrne', '120', '15 May 2015 (USA)',1,2, 'George Miller'),

    ('Die Hard', 'dummy/die_hard.jpg','dummy/die_hard1.jpg', 'NYPD officer John McClane tries to save his wife and several others taken hostage by German
	terrorists during a Christmas party at the Nakatomi Plaza in Los Angeles.',
	'Bruce Willis, Alan Rickman, Bonnie Bedelia', '132', '20 July 1988 (USA)',1,11, 'John McTiernan'),

    ('The Dark Knight', 'dummy/dark_knight.jpg','dummy/dark_knight1.jpg','"The Dark Knight" is a superhero action and psychological thriller film directed
	by Christopher Nolan. The movie depicts the battle between Batman and the villainous Joker, portrayed brilliantly by Christian Bale
	and Heath Ledger, respectively. With its complex storyline and outstanding performances, the film has become one of the most beloved
	works in the superhero genre.',
	'Christian Bale, Heath Ledger, Aaron Eckhart, Michael Caine', '152', '18 July 2008 (USA)',1,5, 'Christopher Nolan'),

    ('Inception', 'dummy/inception.jpg','dummy/inception1.jpg', 'A thief who steals corporate secrets through the use of dream-sharing technology
	is given the inverse task of planting an idea into the mind of a C.E.O.',
	'Leonardo DiCaprio, Joseph Gordon-Levitt, Ellen Page, Tom Hardy', '148', '16 July 2010 (USA)',1,10, 'Christopher Nolan'),

    ('The Bourne Identity', 'dummy/bourne_identity.jpg','dummy/bourne_identity1.jpg', 'A man is picked up by a fishing boat, bullet-riddled and without memory,
	then races to elude assassins and recover from amnesia.',
	'Matt Damon, Franka Potente, Chris Cooper, Clive Owen', '119', '14 June 2002 (USA)',1,8, 'Doug Liman'),

    ('Kill Bill: Vol. 1', 'dummy/kill_bill_vol_1.jpg', 'dummy/kill_bill_vol_2.jpg', 'After awakening from a four-year coma, a former assassin seeks vengeance 
	against those who betrayed her.',
	'Uma Thurman, David Carradine, Daryl Hannah, Lucy Liu', '111', '10 October 2003 (USA)',1,5, 'Quentin Tarantino'),

    ('The Matrix', 'dummy/matrix.jpg','dummy/matrix1.jpg', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his
	role in the war against its controllers.',
	'Keanu Reeves, Laurence Fishburne, Carrie-Anne Moss, Hugo Weaving', '136', '31 March 1999 (USA)',1,10, 'Lana Wachowski, Lilly Wachowski'),

	('The Dark Knight Rises', 'dummy/TheDarkKnightRises.jpg','dummy/TheDarkKnightRises1.webp', '"The Dark Knight Rises" is the sequel to Christopher Nolans Batman series.
	Amidst various dramatic events, the film continues the adventure of Batman, featuring Tom Hardy as the enigmatic villain Bane and Anne
	Hathaway as Catwoman. With its grandiose scenes and profound mood, this film has captured the attention of audiences worldwide.',
	'Christian Bale, Tom Hardy, Anne Hathaway', '164', '15 May 2012 (USA)',1,11, 'Christopher Nolan'),

	('The Dark Tower', 'dummy/TheDarkTower.jpg','dummy/TheDarkTower1.jpg', '"The Dark Tower" is a fantasy adventure film based on the book series of the same name
	by Stephen King. Led by Idris Elba and Matthew McConaughey, the movie follows the journey of the Gunslinger in his quest to find the
	Dark Tower, which holds the promise of balance between good and evil in the universe.',
	' Idris Elba, Matthew McConaughey, Tom Taylor', '95', '15 May  2017 (USA)',7,2, 'Nikolaj Arcel'),

	('The Dark Crystal', 'dummy/The_Dark_Crystal.jpg','dummy/The_Dark_Crystal1.jpg', 'On another planet in the distant past, a Gelfling embarks on a quest 
	to find the missing shard of a magical crystal, and so restore order to his world.',
	'Jim Henson, Kathryn Mullen, Frank Oz' ,
	'93','10 February 1982 (VietNam)',7,2,' Jim Henson'),


    ('The Dark Knight of the Soul ', 'dummy/TheDarkKnightoftheSoul.jpg','dummy/TheDarkKnightoftheSoul1.jpg','The heart-wrenching journey of a playwright 
	grappling with his fading glory, and the haunting experience that forever alters his perspective on life.',
	'Shameik Moore',
	'95',' 2 March 2011 (USA)',6,1,'Owen Long'),

	('The Dark Half', 'dummy/TheDarkHalf.jpg','dummy/TheDarkHalf1.jpg', 'A writers fictional alter ego wants to take over his life...at any price.',
	'Timothy Hutton, Amy Madigan, Michael Rooker','122','5 February 1993 (USA)',1,2,'George A. Romero')



-- Thêm dữ liệu vào bảng DonHang
INSERT INTO [DonHang] ([id_User], [id_Phim], [xuatChieu], [maPhong], [soLuongVe], [trangthai],totalPrice, [thoigian])
VALUES
    (1, 1, 1, 'B1', 3, 0,210000, '2023-06-03 03:40:16'),
    (2, 5, 5, 'B2', 2, 1,140000,'2023-04-02 06:50:11'),
	(3, 3, 3, 'B1', 2, 1, 140000,'2023-07-08 14:30:12'),
	(1, 12, 12, 'B4', 1, 0, 70000,'2023-03-06 20:10:15'),
	(2, 3, 17, 'B6', 2, 1, 140000,'2023-08-13 13:20:11'),
	(3, 5, 20, 'B7', 4, 1, 280000,'2023-01-23 18:30:18');

INSERT INTO Category (Name) VALUES
('Action'),
('Adventure'),
('Animation'),
('Comedy'),--4
('Crime'),
('Drama'),--6
('Fantasy'),--7
('Mystery'),
('Romance'),
('Sci-Fi'),
('Thriller');

INSERT INTO Schedule (MovieID, TimeSlot, Theater, Date) VALUES
(1, '2h-5h', 'B1', 'T2'),  --T2
(2, '5h30-8h30', 'B1', 'T4'), --T4
(3, '9h-12h', 'B1', 'T3'),  
(4, '2h-5h', 'B2', 'T3'), 
(5, '5h30-8h30', 'B2', 'T5'),
(6, '9h-12h', 'B2', 'T2'), --T2
(7, '2h-5h', 'B3', 'T4'),  --T4
(8, '5h30-8h30', 'B3', 'T6'), 
(9, '9h-12h', 'B3', 'CN'), 
(10, '2h-5h', 'B4', 'T5'), 
(11, '5h30-8h30', 'B4', 'T7'), 
(12, '9h-12h', 'B4', 'T4'),  --T4
(13, '2h-5h', 'B5', 'T6'),  
(14, '5h30-8h30', 'B5', 'T5'), 
(15, '9h-12h', 'B5', 'T7'),  
(10, '2h-5h', 'B6', 'CN'), 
(3, '5h30-8h30', 'B6', 'T6'), 
(8, '9h-12h', 'B6', 'T7'), 
(9, '2h-5h', 'B7', 'T3'), 
(5, '5h30-8h30', 'B7', 'CN'),  
(1, '9h-12h', 'B7', 'T4'),  --T4
(2, '2h-5h', 'B8', 'CN'), --CN
(4, '5h30-8h30', 'B8', 'T5')

    

INSERT INTO seat(id_Schedule,idSeat,nameSeat,trangThai)
VALUES 
(1,1,'A1',0),(1,2,'A2',0),(1,3,'A3',0),(1,4,'A4',0),(1,5,'A5',0),(1,6,'A6',0),(1,7,'A7',0),(1,8,'A8',0),(1,9,'A9',0),
(1,10,'B1',0),(1,11,'B2',0),(1,12,'B3',0),(1,13,'B4',0),(1,14,'B5',0),(1,15,'B6',0),(1,16,'B7',0),(1,17,'B8',0),(1,18,'B9',0),
(1,19,'C1',0),(1,20,'C2',0),(1,21,'C3',0),(1,22,'C4',0),(1,23,'C5',0),(1,24,'C6',0),(1,25,'C7',1),(1,26,'C8',1),(1,27,'C9',0),
(1,28,'D1',1),(1,29,'D2',1),(1,30,'D3',1),(1,31,'D4',0),(1,32,'D5',0),(1,33,'D6',1),(1,34,'D7',0),(1,35,'D8',0),(1,36,'D9',0),
(1,37,'E1',0),(1,38,'E2',0),(1,39,'E3',0),(1,40,'E4',0),(1,41,'E5',0),(1,42,'E6',0),(1,43,'E7',0),(1,44,'E8',0),(1,45,'E9',0),
(1,46,'F1',0),(1,47,'F2',0),(1,48,'F3',0),(1,49,'F4',0),(1,50,'F5',1),(1,51,'F6',1),(1,52,'F7',0),(1,53,'F8',0),(1,54,'F9',0),
(1,55,'G1',0),(1,56,'G2',1),(1,57,'G3',1),(1,58,'G4',0),(1,59,'G5',0),(1,60,'G6',0),(1,61,'G7',1),(1,62,'G8',1),(1,63,'G9',0),

(2,1,'A1',0),(2,2,'A2',0),(2,3,'A3',0),(2,4,'A4',0),(2,5,'A5',0),(2,6,'A6',0),(2,7,'A7',0),(2,8,'A8',0),(2,9,'A9',0),
(2,10,'B1',0),(2,11,'B2',0),(2,12,'B3',0),(2,13,'B4',0),(2,14,'B5',0),(2,15,'B6',0),(2,16,'B7',0),(2,17,'B8',0),(2,18,'B9',0),
(2,19,'C1',0),(2,20,'C2',0),(2,21,'C3',0),(2,22,'C4',0),(2,23,'C5',0),(2,24,'C6',0),(2,25,'C7',0),(2,26,'C8',0),(2,27,'C9',0),
(2,28,'D1',0),(2,29,'D2',0),(2,30,'D3',0),(2,31,'D4',0),(2,32,'D5',0),(2,33,'D6',0),(2,34,'D7',0),(2,35,'D8',0),(2,36,'D9',0),
(2,37,'E1',0),(2,38,'E2',0),(2,39,'E3',0),(2,40,'E4',0),(2,41,'E5',0),(2,42,'E6',0),(2,43,'E7',0),(2,44,'E8',0),(2,45,'E9',0),
(2,46,'F1',0),(2,47,'F2',0),(2,48,'F3',0),(2,49,'F4',0),(2,50,'F5',0),(2,51,'F6',0),(2,52,'F7',0),(2,53,'F8',0),(2,54,'F9',0),
(2,55,'G1',0),(2,56,'G2',0),(2,57,'G3',0),(2,58,'G4',0),(2,59,'G5',0),(2,60,'G6',0),(2,61,'G7',0),(2,62,'G8',0),(2,63,'G9',0)

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 3, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 4, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 5, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 6, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 7, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 8, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 9, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 10, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 11, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 12, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 13, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 14, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 15, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 16, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 17, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 18, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 19, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 20, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 21, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 22, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

INSERT INTO seat(id_Schedule,idSeat, nameSeat, trangThai)
SELECT 23, idSeat,nameSeat, trangThai FROM seat WHERE id_Schedule = 1;

SELECT * FROM [User];
SELECT * FROM [Phim];
SELECT * FROM [DonHang];

SELECT * FROM Schedule;
SELECT * FROM Category;
SELECT * FROM seat;
Drop Table [User];
Drop Table Phim;
Drop Table DonHang;
Drop Table Category;
Drop Table Schedule;
Drop TABLE seat;

DELETE FROM DonHang
WHERE id_Phim = 3;
DELETE FROM Schedule
WHERE MovieID = 3;
DELETE FROM Phim
WHERE id = 3;


SELECT TOP 1 * FROM Schedule ORDER BY ScheduleID DESC;
delete from seat where id_Schedule=43;
DELETE FROM Schedule WHERE ScheduleID=43
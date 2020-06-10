----------- INSERT publisher --------------
insert into publisher values('1', N'NXB Trẻ', N'161B Lý Chinh Thắng, TP Hồ Chí Minh');
insert into publisher values('2', N'Giáo Dục', N'81 Trần Hưng Đạo, Hà Nội');
insert into publisher values('3', N'Trí Thức', N'45 Nguyễn Du, Hà Nội');
insert into publisher values('4', N'Phụ Nữ', N'39 Hàng Chuối, Hà Nội');
insert into publisher values('5', N'Kim Đồng', N'55 Quang Trung, Hà Nội');
insert into publisher values('6', N'Lao Động', N'175 Giảng Võ, Hà Nội');
insert into publisher values('7', N'Mỹ Thuật', N'44B Hàm Long, Hà Nội');
insert into publisher values('8', N'NXB Hà Nội', N'4 Tống Duy Tân, Hà Nội');
insert into publisher values('9', N'NXB TP Hồ Chí Minh', N'62 Nguyễn Thị Minh Khai, TP Hồ Chí Minh');
insert into publisher values('10', N'Thanh Niên', N'62 Bà Triệu, Hà Nội');
insert into publisher values('11', N'Thế Giới', N'46 Trần Hưng Đạo, Hà Nội');
insert into publisher values('12', N'Văn Học', N'18 Nguyễn Trường Tộ, Hà Nội');
insert into publisher values('13', N'Hội Nhà Văn', N'65 Nguyễn Du, Hà Nội');
insert into publisher values('14', N'Tư Pháp', N'35 Trần Quốc Toản, Hà Nội');
insert into publisher values('15', N'Giao Thông Vận Tải', N'80B Trần Hưng Đạo, Hà Nội');

----------- INSERT book --------------
-- book_id: 21->40
-- History --
INSERT INTO book VALUES (21, 'The Silk Roads', 361000, 15, 1); -- Peter Frankopan
INSERT INTO book VALUES (22, 'Sapiens: A Brief History of Humankind', 122000, 23, 1); -- Yuval Noah Harari
INSERT INTO book VALUES (23, 'Homo Deus', 129796, 32, 2); -- Yuval Noah Harari
INSERT INTO book VALUES (24, 'Dai Viet Su Ky Toan Thu', 119900, 56, 3); -- Le Van Huu & Ngo Si Lien & Phan Phu Tien
-- Horror -- 
INSERT INTO book VALUES (25, 'Another', 111000, 65, 4); -- Yukito Ayatsuji
INSERT INTO book VALUES (26, 'Me Lo Quan', 68400, 99, 5); -- Yukito Ayatsuji
INSERT INTO book VALUES (27, 'Thuy Xa Quan', 56000, 100, 5); -- Yukito Ayatsuji
INSERT INTO book VALUES (28, 'Gia Thuyet Thu 7', 70000, 27, 6); -- Paul Halter
-- Romance -- 
INSERT INTO book VALUES (29, 'Gone With The Wind', 170000, 40, 7); -- Margaret Mitchell
INSERT INTO book VALUES (30, 'The Fault In Our Stars', 130800, 39, 8); -- John Green
INSERT INTO book VALUES (31, 'Camille', 36000, 120, 9); -- Alexandre Dumas
INSERT INTO book VALUES (32, 'Norwegian Wood', 86164, 70, 10); -- Haruki Murakami
-- Biographic -- 
INSERT INTO book VALUES (33, 'Bill Gates', 145865, 85, 11); -- James Wallace
INSERT INTO book VALUES (34, 'Eistein: The Life and Universe', 265000, 111, 12); -- Walter Isaacson
INSERT INTO book VALUES (35, 'Dai Tuong Vo Nguyen Giap', 157500, 137, 13); -- Tran Hong
INSERT INTO book VALUES (36, 'Jackie Kennedy', 97000, 92, 14); -- Maud Guillaumin
-- Essay -- 
INSERT INTO book VALUES (37, 'IELTS Handbook', 94000, 205, 15); -- Kien Tran
INSERT INTO book VALUES (38, 'Mindmap English Grammar', 132900, 170, 1); -- Do Nhung
INSERT INTO book VALUES (39, 'Ngu Phap Tieng Anh', 58000, 310, 2); -- Mai Lan Huong
INSERT INTO book VALUES (40, 'English Grammar In Use', 95900, 50, 3); -- Raymond Murphy

-- INSERT BOOK ----
-- 41 -> 55 
insert into book values(41, 'Clap When You Land', 30, 280000, 4);
insert into book values(42, 'Lets See Them Poems', 29, 25000, 6);
insert into book values(43, 'Radical Wordsworth: The Poet Who Changed the World', 30, 450000, 10 );
insert into book values(44, 'What Makes a Marriage Last', 30, 330000, 7);
insert into book values(45, 'Why Bother: Discover the Desire for What’s Next', 30, 235000, 8);
insert into book values(46, 'Fortitude: American Resilience in the Era of Outrage', 30, 343000, 11);
insert into book values(47, 'Make Your Bed: Little Things That Can Change Your Life...And Maybe the World', 30, 275000, 11);
insert into book values(48, 'The Fifth Risk: Undoing Democracy', 30, 185000, 14);
insert into book values(49, 'Talking to Strangers: What We Should Know About the People We Don’t Know', 30, 355000, 1);
insert into book values(50, 'The Princess Bride', 30, 75000, 12);
insert into book values(51, 'Ready Player One', 30, 245000, 2);
insert into book values(52, 'The Martian', 30, 190000, 3);
insert into book values(53, 'Clean Code: A Handbook of Agile Software Craftsmanship', 30, 950000, 1);
insert into book values(54, 'Code Complete', 30, 515000, 5);
insert into book values(55, 'Refactoring: Improving the Design of Existing Code', 30, 825000, 9);



----------- INSERT genre --------------
INSERT INTO genre VALUES (21, 'History'), (22, 'History'), (23, 'History'), (24, 'History');
INSERT INTO genre VALUES (25, 'Horror'), (26, 'Horror'), (27, 'Horror'), (28, 'Horror');
INSERT INTO genre VALUES (29, 'Romance'), (30, 'Romance'), (31, 'Romance'), (32, 'Romance');
INSERT INTO genre VALUES (33, 'Biographic'), (34, 'Biographic'), (35, 'Biographic'), (36, 'Biographic');
INSERT INTO genre VALUES (37, 'Essay'), (38, 'Essay'), (39, 'Essay'), (40, 'Essay');

----------- INSERT author --------------
INSERT INTO author (author_id,name,country) VALUES (1, 'Dan Brown', 'USA');
INSERT INTO author (author_id,name,country) VALUES (2, 'Sir Arthur Conan Doyle', 'England');
INSERT INTO author (author_id,name,country) VALUES (3, 'George R. R. Martin', 'USA');
INSERT INTO author (author_id,name,country) VALUES (4, 'Antoine De Saint-Exupery', 'France');
INSERT INTO author (author_id,name,country) VALUES (5, 'J. K. Rowling', 'England');
INSERT INTO author (author_id,name,country) VALUES (6, 'Eiichiro Oda', 'Japan');
INSERT INTO author (author_id,name,country) VALUES (7, 'Roald Dahl', 'England');
INSERT INTO author VALUES (8, 'Peter Frankopan', 'England');
INSERT INTO author VALUES (9, 'Raymond Murphy', 'England');
INSERT INTO author VALUES (10, 'Yuval Noah Harari', 'Israel');
INSERT INTO author VALUES (11, 'Ngo Si Lien', 'Vietnam');
INSERT INTO author VALUES (12, 'Le Van Huu', 'Vietnam');
INSERT INTO author VALUES (13, 'Phan Phu Tien', 'Vietnam');
INSERT INTO author VALUES (14, 'Kien Tran', 'Vietnam');
INSERT INTO author VALUES (15, 'Do Nhung', 'Vietnam');
INSERT INTO author VALUES (16, 'Mai Lan Huong', 'Vietnam');
INSERT INTO author VALUES (17, 'Tran Hong', 'Vietnam');
INSERT INTO author VALUES (18, 'Yukito Ayatsuji', 'Japan');
INSERT INTO author VALUES (19, 'Haruki Murakami', 'Japan');
INSERT INTO author VALUES (20, 'Paul Halter', 'France');
INSERT INTO author VALUES (21, 'Alexandre Dumas', 'France');
INSERT INTO author VALUES (22, 'Maud Guillaumin', 'France');
INSERT INTO author VALUES (23, 'Margaret Mitchell', 'USA');
INSERT INTO author VALUES (24, 'John Green', 'USA');
INSERT INTO author VALUES (25, 'James Wallace', 'USA');
INSERT INTO author VALUES (26, 'Walter Isaacson', 'USA');
insert into author values(27, 'Elizabeth Acevedo', 'USA');
insert into author values(28, 'Andrew Shaffer', 'USA');
insert into author values(29, 'Jonathan Bate', 'England');
insert into author values(30, 'Marlo Thomas', 'USA');
insert into author values(31, 'Jennifer Louden', 'USA');
insert into author values(32, 'Dan Crenshaw', 'England');
insert into author values(33, 'William H. McRaven', 'USA');
insert into author values(34, 'Michael Lewis', 'USA');
insert into author values(35, 'Malcolm Gladwell', 'Canada');
insert into author values(36, 'William Goldman', 'USA');
insert into author values(37, 'Ernest Cline', 'USA');
insert into author values(38, 'Andy Weir', 'USA');
insert into author values(39, 'Robert C. Martin', 'USA');
insert into author values(40, 'Steve McConnell', 'USA');
insert into author values(41, 'Martin Fowler', 'England');



----------- INSERT author_detail --------------
INSERT INTO author_detail (author_id,book_id) VALUES (1,1);
INSERT INTO author_detail (author_id,book_id) VALUES (1,2);
INSERT INTO author_detail (author_id,book_id) VALUES (2,3);
INSERT INTO author_detail (author_id,book_id) VALUES (2,4);
INSERT INTO author_detail (author_id,book_id) VALUES (2,5);
INSERT INTO author_detail (author_id,book_id) VALUES (3,6);
INSERT INTO author_detail (author_id,book_id) VALUES (3,7);
INSERT INTO author_detail (author_id,book_id) VALUES (3,8);
INSERT INTO author_detail (author_id,book_id) VALUES (3,9);
INSERT INTO author_detail (author_id,book_id) VALUES (3,10);
INSERT INTO author_detail (author_id,book_id) VALUES (4,11);
INSERT INTO author_detail (author_id,book_id) VALUES (5,12);
INSERT INTO author_detail (author_id,book_id) VALUES (5,13);
INSERT INTO author_detail (author_id,book_id) VALUES (5,14);
INSERT INTO author_detail (author_id,book_id) VALUES (5,15);
INSERT INTO author_detail (author_id,book_id) VALUES (5,16);
INSERT INTO author_detail (author_id,book_id) VALUES (5,17);
INSERT INTO author_detail (author_id,book_id) VALUES (5,18);
INSERT INTO author_detail (author_id,book_id) VALUES (6,19);
INSERT INTO author_detail (author_id,book_id) VALUES (7,20);
INSERT INTO author_detail VALUES (8, 21);
INSERT INTO author_detail VALUES (10, 22);
INSERT INTO author_detail VALUES (10, 23);
INSERT INTO author_detail VALUES (11, 24);
INSERT INTO author_detail VALUES (12, 24);
INSERT INTO author_detail VALUES (13, 24);
INSERT INTO author_detail VALUES (18, 25);
INSERT INTO author_detail VALUES (18, 26);
INSERT INTO author_detail VALUES (18, 27);
INSERT INTO author_detail VALUES (20, 28);
INSERT INTO author_detail VALUES (23, 29);
INSERT INTO author_detail VALUES (24, 30);
INSERT INTO author_detail VALUES (21, 31);
INSERT INTO author_detail VALUES (19, 32);
INSERT INTO author_detail VALUES (25, 33);
INSERT INTO author_detail VALUES (26, 34);
INSERT INTO author_detail VALUES (17, 35);
INSERT INTO author_detail VALUES (22, 36);
INSERT INTO author_detail VALUES (14, 37);
INSERT INTO author_detail VALUES (15, 38);
INSERT INTO author_detail VALUES (16, 39);
INSERT INTO author_detail VALUES (9, 40);
insert into author_detail values(27, 41);
insert into author_detail values(28, 42);
insert into author_detail values(29, 43);
insert into author_detail values(30, 44);
insert into author_detail values(31, 45);
insert into author_detail values(32, 46);
insert into author_detail values(33, 47);
insert into author_detail values(34, 48);
insert into author_detail values(35, 49);
insert into author_detail values(36, 50);
insert into author_detail values(37, 51);
insert into author_detail values(38, 52);
insert into author_detail values(39, 53);
insert into author_detail values(40, 54);
insert into author_detail values(41, 55);

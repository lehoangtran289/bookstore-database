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

----------- INSERT genre --------------
INSERT INTO genre VALUES (21, 'History'), (22, 'History'), (23, 'History'), (24, 'History');
INSERT INTO genre VALUES (25, 'Horror'), (26, 'Horror'), (27, 'Horror'), (28, 'Horror');
INSERT INTO genre VALUES (29, 'Romance'), (30, 'Romance'), (31, 'Romance'), (32, 'Romance');
INSERT INTO genre VALUES (33, 'Biographic'), (34, 'Biographic'), (35, 'Biographic'), (36, 'Biographic');
INSERT INTO genre VALUES (37, 'Essay'), (38, 'Essay'), (39, 'Essay'), (40, 'Essay');

----------- INSERT author --------------
-- author_id: 8->26
INSERT INTO author VALUES (8, 'Peter Frankopan', 'Britain');
INSERT INTO author VALUES (9, 'Raymond Murphy', 'Britain');
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
INSERT INTO author VALUES (23, 'Margaret Mitchell', 'US');
INSERT INTO author VALUES (24, 'John Green', 'US');
INSERT INTO author VALUES (25, 'James Wallace', 'US');
INSERT INTO author VALUES (26, 'Walter Isaacson', 'US');

----------- INSERT author_detail --------------
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
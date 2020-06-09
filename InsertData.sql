-- INSERT publisher
insert into publisher values('1', N'NXB Trẻ', N'161B Lý Chinh Thắng', N'TP Hồ Chí Minh');
insert into publisher values('2', N'Giáo Dục', N'81 Trần Hưng Đạo', N'Hà Nội');
insert into publisher values('3', N'Trí Thức', N'45 Nguyễn Du',N'Hà Nội');
insert into publisher values('4', N'Phụ Nữ', N'39 Hàng Chuối',N'Hà Nội');
insert into publisher values('5', N'Kim Đồng', N'55 Quang Trung',N'Hà Nội');
insert into publisher values('6', N'Lao Động', N'175 Giảng Võ',N'Hà Nội');
insert into publisher values('7', N'Mỹ Thuật', N'44B Hàm Long',N'Hà Nội');
insert into publisher values('8', N'NXB Hà Nội', N'4 Tống Duy Tân',N'Hà Nội');
insert into publisher values('9', N'NXB TP Hồ Chí Minh', N'62 Nguyễn Thị Minh Khai', N'TP Hồ Chí Minh');
insert into publisher values('10', N'Thanh Niên', N'62 Bà Triệu',N'Hà Nội');
insert into publisher values('11', N'Thế Giới', N'46 Trần Hưng Đạo',N'Hà Nội');
insert into publisher values('12', N'Văn Học', N'18 Nguyễn Trường Tộ',N'Hà Nội');
insert into publisher values('13', N'Hội Nhà Văn', N'65 Nguyễn Du',N'Hà Nội');
insert into publisher values('14', N'Tư Pháp', N'35 Trần Quốc Toản',N'Hà Nội');
insert into publisher values('15', N'Giao Thông Vận Tải', N'80B Trần Hưng Đạo',N'Hà Nội');

-- INSERT books
INSERT INTO book (book_id,title,price,inventory_qty, publisher_id) VALUES (NULL,NULL,NULL,NULL,NULL);

-- INSERT authors
INSERT INTO author (author_id,name,country) VALUES (NULL,NULL,NULL);
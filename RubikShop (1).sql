USE master;
ALTER DATABASE RubikShop SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE RubikShop;

-- Drop the InvoiceDetail table if it exists
IF OBJECT_ID('tblOrderDetails', 'U') IS NOT NULL
   DROP TABLE tblOrderDetails;

-- Drop the Invoice table if it exists
IF OBJECT_ID('tblOrders', 'U') IS NOT NULL
   DROP TABLE tblOrders;

-- Drop the SanPham (Product) table if it exists
IF OBJECT_ID('tblProducts', 'U') IS NOT NULL
   DROP TABLE tblProducts;

-- Drop the Category table if it exists
IF OBJECT_ID('tblCategorys', 'U') IS NOT NULL
   DROP TABLE tblCategorys;

   -- Drop the Category table if it exists
IF OBJECT_ID('tblUsers', 'U') IS NOT NULL
   DROP TABLE tblUsers;

IF OBJECT_ID('tblRoles', 'U') IS NOT NULL
   DROP TABLE tblRoles;

CREATE DATABASE RubikShop;
USE RubikShop;

CREATE TABLE tblRoles(
	roleID VARCHAR(10) NOT NULL primary key,
	roleName VARCHAR(50) NOT NULL,
);


insert into tblRoles (roleID, roleName) values ('AD', 'Admin')
insert into tblRoles (roleID, roleName) values ('US', 'User')

CREATE TABLE tblUsers(
	userID VARCHAR(30) NOT NULL primary key,
	email VARCHAR(30) NULL,
	googleID VARCHAR(40) NULL,
	password VARCHAR(50) NULL,
	fullName NVARCHAR (255) NULL,
	roleID VARCHAR(10) NOT NULL,
	address NVARCHAR(50) NULL,
	phone VARCHAR(20) NULL,
	status bit NOT NULL DEFAULT 1,
	deleted BINARY DEFAULT 0,
	FOREIGN KEY(roleID) REFERENCES tblRoles(roleID) 
);

insert into tblUsers (userID, email, googleID, password, fullName, roleID, address, phone, status) 
values ('SE173111', 'j97@gmail.com', null, '123456', N'Tuan cui', 'US', 'Bến Tre', '0987654321', 1)

insert into tblUsers (userID, email, googleID, password, fullName, roleID, address, phone, status) 
values ('SE99999', 'cr7kiempenaty@gmail.com', null,'123456', N'Cristiano Ronaldo', 'US', 'Portugal', '0987654320', 1)

insert into tblUsers (userID, email, googleID, password, fullName, roleID, address, phone, status) 
values ('admin', 'doantri2003@gmail.com', null, '123456', N'Đoàn Trí', 'AD', 'Bình Định', '0987654300', 1)

--------------------------------------TABLE CATEGORY----------------------------------------
CREATE TABLE tblCategorys(
   categoryID INT PRIMARY KEY NOT NULL,
   categoryName NVARCHAR (255) NOT NULL,
   image VARCHAR(MAX) NULL
);

/*Add data into tblCategory address??*/
INSERT INTO tblCategorys (categoryID, categoryName, image) values (1, N'3x3', 'https://moorewilsons.co.nz/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/r/u/rubixs-cube-2/rubiks-cube-3x3-31.1652182112.jpg')
INSERT INTO tblCategorys (categoryID, categoryName, image) values (2, N'4x4', 'https://rubikstore.vn/cdn/upload/images/moyu-meilong-4m-4x4x4-black.jpg')
INSERT INTO tblCategorys (categoryID, categoryName, image) values (3, N'5x5', 'https://bizweb.dktcdn.net/100/418/477/products/rubik.jpg?v=1618552603280')
INSERT INTO tblCategorys (categoryID, categoryName, image) values (4, N'Magic', 'https://rubikstore.vn/cdn/images/202107/goods_img/rubik-gan-megaminx-m-stickerless-co-nam-cham-sp005176-G923-1626016461120.jpg')
INSERT INTO tblCategorys (categoryID, categoryName, image) values (5, N'Accessories', 'https://bizweb.dktcdn.net/100/316/286/products/qiyi-timer.jpg?v=1598009213257')
--------------------------------------TABLE PRODUCT----------------------------------------
CREATE TABLE tblProducts(
   productID INT PRIMARY KEY NOT NULL,
   productName NVARCHAR(255) NOT NULL,
   description NVARCHAR(MAX) DEFAULT '',
   categoryID INT NOT NULL,
   unitPrice MONEY NOT NULL,
   unitInStock INT NOT NULL,
   image NVARCHAR(MAX) NULL,
   deleted BINARY DEFAULT 0,
   Foreign key(categoryID) references tblCategorys(categoryID),
);	

------------------------------------Add data into tblProduct----------------------------
insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (1, N'MoYu Super RS3M V2 Ball core UV', N'Nó rất mượt mà, nhanh khi vừa ra khỏi hộp và có khả năng cắt góc “kinh khủng”, thậm chí ngang với chiếc GAN 356 X có giá cả triệu đồng.',
1, 670000, 99, N'https://thegioirubik.com/wp-content/uploads/2023/08/MoYu-Super-RS3M-V2-UV-4-400x400.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (2, N'MoFang JiaoShi MF3RS', N'MF3RS tỏ rất mượt mà, độ bám tay tốt và khả năng cắt góc thực sự vượt qua ranh giới của một chiếc Rubik 3x3 giá rẻ.',
1, 340000, 99, N'https://bizweb.dktcdn.net/100/316/286/files/mf3rs-aac9585c-f380-44f5-b9c3-2e30e271c1a4.jpg?v=1561971687584')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (3, N'YZ Electroplated Metal Alloy 3x3x3 (Black)', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
1, 120000, 213, N'https://thegioirubik.com/wp-content/uploads/2022/04/YZ-Electroplated-Metal-Alloy-3x3x3-Black-2-400x400.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (4, N'Gan 356 i carry', N'Cuối tháng 11/ 2019, MoYu đã cho ra mắt phiên bản mới trong dòng Meilong là 3C. Về thiết kế, cân nặng, khối lượng hay màu sắc, 
3C đều giống hệt với bản Meilong thường. ', 1, 480000, 150, N'https://bizweb.dktcdn.net/100/316/286/products/gan-356-i-carry-1.jpg?v=1622492041337')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (5, N'QiYi Warrior W', N'Nó được ra mắt mà không có bất kỳ sự phô trương nào, rất “im hơi lặng tiếng” và thực tế nó cũng không phải một cube có gì đặc sắc. 
QiYi dường như đang cố gắng đưa dòng Warrior trở lại bằng cách cho ra mắt phiên bản thứ hai - QiYi Warrior W và có vẻ họ đã thành công.', 
1, 560000, 120, N'https://bizweb.dktcdn.net/100/316/286/files/qiyi-warrior-w.jpg?v=1561971718667')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (6, N'YuXin Little Magic', N'Nó rất mượt mà, nhanh khi vừa ra khỏi hộp và có khả năng cắt góc “kinh khủng”, thậm chí ngang với chiếc GAN 356 X có giá cả triệu đồng.',
2, 650000, 240, N'https://bizweb.dktcdn.net/100/316/286/files/yuxin-little-magic-stickerless-x700.jpg?v=1561971670348')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (7, N'Moyu weilong gts', N'MF3RS tỏ rất mượt mà, độ bám tay tốt và khả năng cắt góc thực sự vượt qua ranh giới của một chiếc Rubik 3x3 giá rẻ.',
2, 550000, 110, N'https://rubikhanoi.vn/wp-content/uploads/2021/09/33-GTS-8.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (8, N'MoFang JiaoShi Meilong', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
2, 300000, 103, N'https://bizweb.dktcdn.net/100/316/286/files/moyu-meilong.jpg?v=1561971706862')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (9, N'QiYi qiquan 4x4', N'Cuối tháng 11/ 2019, MoYu đã cho ra mắt phiên bản mới trong dòng Meilong là 3C. Về thiết kế, cân nặng, khối lượng hay màu sắc, 
3C đều giống hệt với bản Meilong thường. ', 2, 123000, 100, N'https://bizweb.dktcdn.net/thumb/1024x1024/100/316/286/products/qiyi-qiyuan-w2-4x4.jpg?v=1622606299407')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (10, N'Gan 460M', N'Nó được ra mắt mà không có bất kỳ sự phô trương nào, rất “im hơi lặng tiếng” và thực tế nó cũng không phải một cube có gì đặc sắc. 
QiYi dường như đang cố gắng đưa dòng Warrior trở lại bằng cách cho ra mắt phiên bản thứ hai - QiYi Warrior W và có vẻ họ đã thành công.', 
2, 680000, 103, N'https://bizweb.dktcdn.net/100/316/286/products/gan-460-m-4x4-cube.jpg?v=1534145234827')


insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (11, N'YuXin Little Magic', N'Nó rất mượt mà, nhanh khi vừa ra khỏi hộp và có khả năng cắt góc “kinh khủng”, thậm chí ngang với chiếc GAN 356 X có giá cả triệu đồng.',
3, 300000, 230, N'https://bizweb.dktcdn.net/100/316/286/files/yuxin-little-magic-stickerless-x700.jpg?v=1561971670348')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (12, N'QiYi QiYeng 5x5', N'MF3RS tỏ rất mượt mà, độ bám tay tốt và khả năng cắt góc thực sự vượt qua ranh giới của một chiếc Rubik 3x3 giá rẻ.',
3, 300000, 105, N'https://product.hstatic.net/200000550051/product/61.5_mm__3000___3000_px__2d29b1adaaf94259809308b465fb8bc1_master.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (13, N'C4U 5X5 Rubik cube', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
3, 87000, 130, N'https://shop.spinmaster.com/cdn/shop/products/lxp8rhedx1grprymbiwc_800x.jpg?v=1694452986')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (14, N'Gan 550M 5x5', N'Cuối tháng 11/ 2019, MoYu đã cho ra mắt phiên bản mới trong dòng Meilong là 3C. Về thiết kế, cân nặng, khối lượng hay màu sắc, 
3C đều giống hệt với bản Meilong thường. ', 3, 360000, 130, N'https://cf.shopee.vn/file/1e28b45af4d51e57f8e5a2a809752fb7')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (15, N'Magnetic stickerless 5x5', N'Nó được ra mắt mà không có bất kỳ sự phô trương nào, rất “im hơi lặng tiếng” và thực tế nó cũng không phải một cube có gì đặc sắc. 
QiYi dường như đang cố gắng đưa dòng Warrior trở lại bằng cách cho ra mắt phiên bản thứ hai - QiYi Warrior W và có vẻ họ đã thành công.', 
3, 300000, 102, N'https://m.media-amazon.com/images/I/612ozutOLSL.jpg')


insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (16, N'Gan megaminx stickerless', N'Nó rất mượt mà, nhanh khi vừa ra khỏi hộp và có khả năng cắt góc “kinh khủng”, thậm chí ngang với chiếc GAN 356 X có giá cả triệu đồng.',
4, 450000, 203, N'https://cf.shopee.vn/file/a690ccb7062b9d3e038f0267b7db7b73')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (17, N'Gan pyraminx magnetic', N'MF3RS tỏ rất mượt mà, độ bám tay tốt và khả năng cắt góc thực sự vượt qua ranh giới của một chiếc Rubik 3x3 giá rẻ.',
4, 687000, 130, N'https://rubikstore.vn/cdn/images/202107/goods_img/rubik-gan-pyraminx-m-stickerless-G1426-1625650083293.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (18, N'Gan skewb m stickerLess', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
4, 245000, 990, N'https://rubikstore.vn/cdn/images/202108/goods_img/rubik-gan-skewb-m-stickerless--sp006339-G1447-1629128939116.jpg')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (19, N'QiYi timer v2', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
5, 245000, 990, N'https://bizweb.dktcdn.net/100/316/286/products/qiyi-timer.jpg?v=1598009213257')

insert into tblProducts (productID, productName, description, categoryID, unitPrice, unitInStock, image) 
values (20, N'Qiyi Lube v2', N'Meilong sở hữu duy nhất một phiên bản Stickerless, màu sắc của nó thực sự rất đẹp và tươi tắn 
(tông màu khá giống với chiếc Flagship GTS3 M). Bên cạnh đó, bề mặt cube được làm bằng chất liệu nhựa nhám tăng khả năng chống xước so với loại nhựa thông thường. ',
5, 55000, 990, N'https://down-vn.img.susercontent.com/file/e44fb999f2c61ce1c0c4980022e3a243')


--------------------------------------TABLE BILL----------------------------------------
CREATE TABLE tblOrders (
   orderID VARCHAR(40) PRIMARY KEY,
   userID VARCHAR(30) NOT NULL,
   paymentMethod VARCHAR(30) NOT NULL,
   orderDate DATETIME NOT NULL DEFAULT GETDATE(),
   FOREIGN KEY (userID) REFERENCES tblUsers(userID)
);
--------------------------------------TABLE INVOICE DETAIL----------------------------------------
CREATE TABLE tblOrderDetails (
   orderID VARCHAR(40) NOT NULL,
   productID int NOT NULL,
   quantity INT NOT NULL,
   price MONEY NOT NULL,
   PRIMARY KEY(productID, orderID),
   FOREIGN KEY (orderID) REFERENCES tblOrders(orderID),
   FOREIGN KEY (productID) REFERENCES tblProducts(productID)
);


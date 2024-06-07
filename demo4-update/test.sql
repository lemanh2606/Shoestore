
CREATE DATABASE OnlineShop;
GO
USE [OnlineShop]
GO



-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE UserStatus (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO
INSERT INTO UserStatus VALUES (N'Active');
INSERT INTO UserStatus VALUES (N'Locked');
INSERT INTO UserStatus VALUES (N'Gmail Login');
INSERT INTO UserStatus VALUES (N'Unverified');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table [Role](
	RoleID int IDENTITY(1, 1) primary key,
	RoleName nvarchar (20),
	-- Admin,marketing, seller, customer
);
GO
INSERT INTO [Role] VALUES (N'Admin');
INSERT INTO Role VALUES (N'Seller');
INSERT INTO Role VALUES (N'Customer');
INSERT INTO Role VALUES (N'Marketing');
INSERT INTO Role VALUES (N'Shipper');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [Users] (
	UserID int PRIMARY KEY identity(1,1),
	Username nvarchar(500),
	Password varchar(1000),
	email nvarchar(1000),
	[RoleID] int,
	StatusID int,
	constraint Status_ID_in_Status FOREIGN KEY(StatusID) REFERENCES UserStatus(ID),
	constraint RoleID_in_Role FOREIGN KEY(RoleID) REFERENCES [Role](RoleID)
);
GO
INSERT INTO Users VALUES(N'admin','123456',N'admin@fpt.edu.vn',1,1);
INSERT INTO Users VALUES(N'seller','seller',N'seller@fpt.edu.vn',2,1);
INSERT INTO Users VALUES(N'mkt','mkt',N'mkt@fpt.edu.vn',4,1);
INSERT INTO Users VALUES(N'shipper','shipper',N'shipper@fpt.edu.vn',5,1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jjellico0', 'Jellico', N'wjellico0@npr.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dimpson1', 'Impson', N'simpson1@wiley.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cdahlen2', 'Dahlen', N'adahlen2@unblog.fr', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jstote3', 'Stote', N'ostote3@zimbio.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jjanku4', 'Janku', N'jjanku4@yahoo.co.jp', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'gseckom5', 'Seckom', N'pseckom5@amazon.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'nstainburn6', 'Stainburn', N'astainburn6@edublogs.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'snewlands7', 'Newlands', N'dnewlands7@intel.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mrowesby8', 'Rowesby', N'erowesby8@oracle.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'sbridgwood9', 'Bridgwood', N'sbridgwood9@businessweek.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'afranca', 'Franc', N'mfranca@hibu.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'wingyonb', 'Ingyon', N'wingyonb@oakley.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jbenallackc', 'Benallack', N'abenallackc@admin.ch', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ksellickd', 'Sellick', N'lsellickd@unicef.org', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ggurwoode', 'Gurwood', N'ngurwoode@examiner.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mallinghamf', 'Allingham', N'tallinghamf@examiner.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'hmedfordg', 'Medford', N'bmedfordg@smh.com.au', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'kelstobh', 'Elstob', N'zelstobh@accuweather.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'rnouchi', 'Nouch', N'pnouchi@msu.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ecurromj', 'Currom', N'kcurromj@mayoclinic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'nmcturkk', 'McTurk', N'lmcturkk@webeden.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'clathwoodl', 'Lathwood', N'nlathwoodl@theatlantic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'rsincockm', 'Sincock', N'isincockm@jimdo.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'drobyn', 'Roby', N'mrobyn@toplist.cz', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'awolterso', 'Wolters', N'rwolterso@google.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'criallp', 'Riall', N'kriallp@stanford.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'rscurryq', 'Scurry', N'oscurryq@who.int', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'gbadwickr', 'Badwick', N'jbadwickr@time.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'zclinkards', 'Clinkard', N'gclinkards@vinaora.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jmaberleyt', 'Maberley', N'rmaberleyt@biblegateway.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lcahanu', 'Cahan', N'dcahanu@kickstarter.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'hgowersv', 'Gowers', N'cgowersv@google.com.br', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'bdallaw', 'Dalla', N'sdallaw@360.cn', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'caubinx', 'Aubin', N'laubinx@twitter.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'wdesantosy', 'De Santos', N'ldesantosy@cyberchimps.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'abedfordz', 'Bedford', N'ebedfordz@scribd.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'bjerromes10', 'Jerromes', N'sjerromes10@cbsnews.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mbakey11', 'Bakey', N'hbakey11@huffingtonpost.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dlocke12', 'Locke', N'elocke12@princeton.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'sgabbitus13', 'Gabbitus', N'mgabbitus13@sfgate.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'tkauffman14', 'Kauffman', N'mkauffman14@thetimes.co.uk', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'kgodard15', 'Godard', N'egodard15@walmart.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'rburdess16', 'Burdess', N'eburdess16@uol.com.br', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ralejandri17', 'Alejandri', N'lalejandri17@sakura.ne.jp', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'klutwyche18', 'Lutwyche', N'slutwyche18@vk.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'gdelete19', 'Delete', N'ddelete19@businesswire.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cduns1a', 'Duns', N'aduns1a@wsj.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'bfallanche1b', 'Fallanche', N'rfallanche1b@last.fm', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mderx1c', 'Derx', N'oderx1c@ning.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lnewsome1d', 'Newsome', N'fnewsome1d@tiny.cc', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'hrhubottom1e', 'Rhubottom', N'arhubottom1e@sciencedaily.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dkofax1f', 'Kofax', N'fkofax1f@unc.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'vlandeg1g', 'Landeg', N'nlandeg1g@dailymotion.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'zlammiman1h', 'Lammiman', N'rlammiman1h@xing.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'kiverson1i', 'Iverson', N'siverson1i@amazonaws.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cnudde1j', 'Nudde', N'hnudde1j@acquirethisname.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'astempe1k', 'Stempe', N'dstempe1k@dedecms.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'craund1l', 'Raund', N'traund1l@yellowbook.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'abottleson1m', 'Bottleson', N'tbottleson1m@about.me', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'tbart1n', 'Bart', N'sbart1n@miibeian.gov.cn', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dopdenort1o', 'Opdenort', N'lopdenort1o@myspace.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dredolfi1p', 'Redolfi', N'sredolfi1p@umich.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'doldridge1q', 'Oldridge', N'soldridge1q@newsvine.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'kbarrell1r', 'Barrell', N'abarrell1r@twitpic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cscott1s', 'Scott', N'dscott1s@github.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'doman1t', 'Oman', N'moman1t@google.ca', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mdixon1u', 'Dixon', N'tdixon1u@army.mil', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'iyouthead1v', 'Youthead', N'ayouthead1v@sbwire.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'amidlar1w', 'Midlar', N'tmidlar1w@moonfruit.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ggrimmolby1x', 'Grimmolby', N'mgrimmolby1x@cocolog-nifty.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'zphilp1y', 'Philp', N'kphilp1y@google.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'mgiannini1z', 'Giannini', N'rgiannini1z@rambler.ru', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'qmersey20', 'Mersey', N'fmersey20@samsung.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'fellwood21', 'Ellwood', N'eellwood21@loc.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values ('bconstable22', 'Constable', N'fconstable22@studiopress.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'hsaffill23', 'Saffill', N'dsaffill23@huffingtonpost.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'toxbie24', 'Oxbie', N'goxbie24@webmd.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ykoppeck25', 'Koppeck', N'wkoppeck25@spiegel.de', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'raveray26', 'Averay', N'aaveray26@alibaba.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lwhitewood27', 'Whitewood', N'fwhitewood27@tinyurl.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cbilston28', 'Bilston', N'abilston28@webnode.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'ltiner29', 'Tiner', N'ptiner29@studiopress.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lgregine2a', 'Gregine', N'kgregine2a@bloglovin.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'fparsell2b', 'Parsell', N'mparsell2b@si.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'fwolfe2c', 'Wolfe', N'rwolfe2c@intel.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lbellis2d', 'Bellis', N'cbellis2d@icq.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'gwittke2e', 'Wittke', N'mwittke2e@marketwatch.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lisaacson2f', 'Isaacson', N'wisaacson2f@fc2.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'anovotni2g', 'Novotni', N'dnovotni2g@unblog.fr', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'jclough2h', 'Clough', N'cclough2h@bloglines.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'bibotson2i', 'Ibotson', N'aibotson2i@usatoday.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'drichardin2j', 'Richardin', N'lrichardin2j@businessinsider.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'lchew2k', 'Chew', N'tchew2k@hhs.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'wmackeeg2l', 'MacKeeg', N'mmackeeg2l@narod.ru', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'cgarz2m', 'Garz', N'ngarz2m@berkeley.edu', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dmanagh2n', 'Managh', N'wmanagh2n@tinypic.com', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'bgiraudoux2o', 'Giraudoux', N'agiraudoux2o@hud.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'astyan2p', 'Styan', N'bstyan2p@va.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'dgillford2q', 'Gillford', N'bgillford2q@noaa.gov', 3, 1);
insert into dbo.[Users] ([Username], [Password], [email], [RoleID], StatusID) values (N'nknappen2r', 'Knappen', N'kknappen2r@usa.gov', 3, 1);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Ship (
	id int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	CityName nvarchar(1000) ,
	ShipPrice int
) ON [PRIMARY]
GO
INSERT INTO Ship VALUES (N'An Giang', 30000);
INSERT INTO Ship VALUES (N'Bà Rịa-Vũng Tàu', 30000);
INSERT INTO Ship VALUES (N'Bạc Liêu', 30000);
INSERT INTO Ship VALUES (N'Bắc Kạn', 30000);
INSERT INTO Ship VALUES (N'Bắc Giang', 30000);
INSERT INTO Ship VALUES (N'Bắc Ninh', 30000);
INSERT INTO Ship VALUES (N'Bến Tre', 30000);
INSERT INTO Ship VALUES (N'Bình Dương', 30000);
INSERT INTO Ship VALUES (N'Bình Định', 30000);
INSERT INTO Ship VALUES (N'Bình Phước', 30000);
INSERT INTO Ship VALUES (N'Bình Thuận', 30000);
INSERT INTO Ship VALUES (N'Cà Mau', 30000);
INSERT INTO Ship VALUES (N'Cao Bằng', 30000);
INSERT INTO Ship VALUES (N'Cần Thơ', 30000);
INSERT INTO Ship VALUES (N'Đà Nẵng', 30000);
INSERT INTO Ship VALUES (N'Đắk Lắk', 30000);
INSERT INTO Ship VALUES (N'Đắk Nông', 30000);
INSERT INTO Ship VALUES (N'Điện Biên', 30000);
INSERT INTO Ship VALUES (N'Đồng Nai', 30000);
INSERT INTO Ship VALUES (N'Đồng Tháp', 30000);
INSERT INTO Ship VALUES (N'Gia Lai', 30000);
INSERT INTO Ship VALUES (N'Hà Giang', 30000);
INSERT INTO Ship VALUES (N'Hà Nam', 30000);
INSERT INTO Ship VALUES (N'Hà Nội', 20000);
INSERT INTO Ship VALUES (N'Hà Tĩnh', 30000);
INSERT INTO Ship VALUES (N'Hải Dương', 30000);
INSERT INTO Ship VALUES (N'Hải Phòng', 30000);
INSERT INTO Ship VALUES (N'Hòa Bình', 30000);
INSERT INTO Ship VALUES (N'Hồ Chí Minh', 30000);
INSERT INTO Ship VALUES (N'Hậu Giang', 30000);
INSERT INTO Ship VALUES (N'Hưng Yên', 30000);
INSERT INTO Ship VALUES (N'Khánh Hòa', 30000);
INSERT INTO Ship VALUES (N'Kiên Giang', 30000);
INSERT INTO Ship VALUES (N'Kon Tum', 30000);
INSERT INTO Ship VALUES (N'Lai Châu', 30000);
INSERT INTO Ship VALUES (N'Lào Cai', 30000);
INSERT INTO Ship VALUES (N'Lạng Sơn', 30000);
INSERT INTO Ship VALUES (N'Lâm Đồng', 30000);
INSERT INTO Ship VALUES (N'Long An', 30000);
INSERT INTO Ship VALUES (N'Nam Định', 30000);
INSERT INTO Ship VALUES (N'Nghệ An', 30000);
INSERT INTO Ship VALUES (N'Ninh Bình', 30000);
INSERT INTO Ship VALUES (N'Ninh Thuận', 30000);
INSERT INTO Ship VALUES (N'Phú Thọ', 30000);
INSERT INTO Ship VALUES (N'Phú Yên', 30000);
INSERT INTO Ship VALUES (N'Quảng Bình', 30000);
INSERT INTO Ship VALUES (N'Quảng Nam', 30000);
INSERT INTO Ship VALUES (N'Quảng Ngãi', 30000);
INSERT INTO Ship VALUES (N'Quảng Ninh', 30000);
INSERT INTO Ship VALUES (N'Quảng Trị', 30000);
INSERT INTO Ship VALUES (N'Sóc Trăng', 30000);
INSERT INTO Ship VALUES (N'Sơn La', 30000);
INSERT INTO Ship VALUES (N'Tây Ninh', 30000);
INSERT INTO Ship VALUES (N'Thái Bình', 30000);
INSERT INTO Ship VALUES (N'Thái Nguyên', 30000);
INSERT INTO Ship VALUES (N'Thanh Hóa', 30000);
INSERT INTO Ship VALUES (N'Thừa Thiên - Huế', 30000);
INSERT INTO Ship VALUES (N'Tiền Giang', 30000);
INSERT INTO Ship VALUES (N'Trà Vinh', 30000);
INSERT INTO Ship VALUES (N'Tuyên Quang', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Long', 30000);
INSERT INTO Ship VALUES (N'Vĩnh Phúc', 30000);
INSERT INTO Ship VALUES (N'Yên Bái', 30000);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE UserAddress (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ShipName nvarchar(500),
	ShipAddress nvarchar(1000),
	ShipCityID int,
	PhoneNum varchar(20),
	constraint userID_in_user_address FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint ship_city_in_ship_address FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO

insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (1, N'Tracie', N'1609 Redwing Junction', 21);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (2, N'Shellysheldon', N'80 Homewood Pass', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (3, N'Joletta', N'180 Evergreen Circle', 61);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (4, N'Tammi', N'920 Melby Trail', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID],[PhoneNum]) values (5, N'Lê Mạnh', N'Đại Học FPT', 24,'0123456789');
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (6, N'Eba', N'0 Dovetail Park', 38);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (7, N'Farica', N'39269 Calypso Place', 20);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (8, N'Vevay', N'730 Walton Crossing', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (9, N'Caitrin', N'61811 Oak Trail', 54);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (10, N'Hamlin', N'48603 Cordelia Pass', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (11, N'Hortense', N'443 Eastwood Drive', 30);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (12, N'Ilario', N'87 Luster Drive', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (13, N'Rici', N'13953 Gateway Trail', 43);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (14, N'Nola', N'79435 Pawling Center', 49);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (15, N'Sax', N'7501 Doe Crossing Place', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (16, N'Dulcie', N'266 High Crossing Way', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (17, N'Beulah', N'723 Summit Way', 18);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (18, N'Lexine', N'405 Aberg Pass', 37);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (19, N'Manfred', N'19 Village Circle', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (20, N'Calhoun', N'310 Talmadge Terrace', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (21, N'Karin', N'739 Fallview Crossing', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (22, N'Lisha', N'878 Anniversary Alley', 46);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (23, N'Minne', N'574 Hayes Road', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (24, N'Loise', N'63382 Hagan Terrace', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (25, N'Keane', N'07 Village Green Plaza', 58);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (26, N'Elden', N'196 4th Road', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (27, N'Lorette', N'26 Hoepker Crossing', 5);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (28, N'Marylou', N'9768 Monterey Terrace', 52);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (29, N'Kaiser', N'48783 Gina Terrace', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (30, N'Hermia', N'9 Dorton Point', 57);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (31, N'Eddy', N'8060 Debra Circle', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (32, N'Abram', N'649 Darwin Road', 34);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (33, N'Val', '418 Park Meadow Pass', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (34, N'Shirlee', N'7241 Drewry Way', 31);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (35, N'Cherye', N'082 Rutledge Point', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (36, N'Danica', N'574 South Parkway', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (37, N'Luca', N'14365 Northview Alley', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (38, N'Giselbert', N'62 Thackeray Trail', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (39, N'Salomon', N'3 Walton Alley', 14);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (40, N'Augustina', N'3762 Clarendon Point', 15);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (41, N'Jonell', N'443 Anderson Way', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (42, N'Otes', N'51123 Sunbrook Point', 28);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (43, N'Kienan', N'403 Welch Street', 3);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (44, N'Hubey', N'6 Barnett Trail', 49);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (45, N'Joan', N'12 Talisman Street', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (46, N'Faydra', N'2971 Algoma Court', 47);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (47, N'Joyous', N'034 Anderson Terrace', 55);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (48, N'Wang', N'70 Little Fleur Center', 26);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (49, N'Toddie', N'24706 Artisan Junction', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (50, N'Ernie', N'60612 Kings Avenue', 36);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (51, N'Steve', N'29440 Elgar Plaza', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (52, N'Derk', N'9 Summer Ridge Hill', 40);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (53, N'Marvin', N'9828 Monterey Way', 44);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (54, N'Bliss', N'5594 Jenifer Circle', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (55, N'Amabel', N'4658 Killdeer Alley', 53);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (56, N'Launce', N'060 Westridge Junction', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (57, N'Juliette', N'9003 Magdeline Circle', 45);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (58, N'Shane', N'395 Dryden Trail', 38);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (59, N'Archy', N'0 Eagle Crest Circle', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (60, N'Olive', N'06 Bashford Crossing', 23);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (61, N'Natal', N'66388 Del Mar Circle', 34);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (62, N'Kellie', N'92 Dayton Point', 11);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (63, N'Gusella', N'1 Glendale Center', 52);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (64, N'Keely', N'721 Steensland Street', 59);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (65, N'Ware', N'27 Lindbergh Circle', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (66, N'Jsandye', N'7143 Anhalt Court', 29);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (67, N'Inez', N'91 Calypso Crossing', 63);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (68, N'Bernadina', N'84 Reinke Plaza', 57);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (69, N'Cristian', N'10 Magdeline Pass', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (70, N'Lanie', N'8904 Lillian Point', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (71, N'Lynne', N'62546 Meadow Valley Junction', 50);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (72, N'Quentin', N'77437 Armistice Plaza', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (73, N'Jeanette', N'859 Del Mar Crossing', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (74, N'Anthe', N'2878 Hansons Junction', 9);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (75, N'Wolfie', N'5 Hintze Circle', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (76, N'Elaine', N'3 Comanche Avenue', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (77, N'Alejoa', N'08 Toban Crossing', 12);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (78, N'Renate', N'6 Farmco Court', 10);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (79, N'Rustin', N'96 Lillian Park', 14);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (80, N'Demetris', N'8 Rusk Street', 44);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (81, N'Monica', N'7206 Corben Pass', 26);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (82, N'Thalia', N'45 Park Meadow Plaza', 2);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (83, N'Say', N'27075 Brown Crossing', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (84, N'Babette', N'686 Oakridge Court', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (85, N'Eleonora', N'84 Roth Place', 4);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (86, N'Bailie', N'295 Lyons Road', 48);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (87, N'Adi', N'2 Gale Alley', 47);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (88, N'Tish', N'7922 Eliot Plaza', 7);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (89, N'Lester',N'22667 Jenifer Crossing', 37);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (90, N'Arthur', N'5382 Lien Trail',5);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (91, N'Vince', N'767 Esker Street', 24);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (92, N'Clerkclaude', N'58 Rigney Court', 8);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (93, N'Alanah', N'0 Mockingbird Place', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (94, N'Cybill', N'89 Duke Park', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (95, N'Darbee', N'3720 Hollow Ridge Crossing', 33);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (96, N'Hercules', N'60 Schmedeman Alley', 6);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (97, N'Deloris', N'7901 Randy Alley', 1);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (98, N'Clary', N'6 Gateway Point', 21);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (99, N'Patrizia', N'3 Melrose Center', 13);
insert into dbo.[UserAddress] ([UserID], [ShipName], [ShipAddress], [ShipCityID]) values (100, N'Maxie', N'92158 Utah Park', 7);
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Category (
	CategoryID int PRIMARY KEY identity(1,1),
	CategoryName nvarchar(1000),
) ON [PRIMARY]
GO
INSERT INTO dbo.Category(CategoryName)VALUES(N'Sneaker')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Running')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Basketball')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Soccer')
INSERT INTO dbo.Category(CategoryName)VALUES(N'Tennis');
INSERT INTO dbo.Category(CategoryName)VALUES(N'Badminton');

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[SubCategory](
	[SubCategoryID] [int] PRIMARY KEY  IDENTITY(1,1) ,
	[SubCategoryName] [nvarchar](255),
	[CategoryID] [int] ,
	constraint CategoryID FOREIGN KEY (CategoryID)  REFERENCES Category(CategoryID)
	)
GO
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Low-Tops', 1);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Mid-Top', 1);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Running Shoes', 2);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Training Shoes', 2);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Basketball Shoes', 3);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Chuyên Nghiệp', 4);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Nhân tạo', 4);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Tennis Shoes', 5);
INSERT INTO dbo.SubCategory (SubCategoryName, CategoryID) VALUES (N'Badminton Shoes', 6);

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ProductStatus (
	StatusID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	StatusName nvarchar(1000)
) ON [PRIMARY]
GO

INSERT INTO ProductStatus VALUES ( N'Available');
INSERT INTO ProductStatus VALUES ( N'StopBusiness');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Brand (
	BrandID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	BrandName nvarchar(1000)
) ON [PRIMARY]
GO

INSERT INTO dbo.Brand(BrandName)VALUES(N'Nike')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Adidas')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Converse')
INSERT INTO dbo.Brand(BrandName)VALUES(N'PUMA')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Mizuno')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Vans')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Gucci')
INSERT INTO dbo.Brand(BrandName)VALUES(N'Lining')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Product (
	ProductID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	ProductName nvarchar(1000),
	Description nvarchar(3000),
	OriginalPrice int, 
	SellPrice int,	
	SalePercent int CHECK (SalePercent>=0 AND SalePercent<=100),
	SubCategoryID int,
	SellerID int,
	Amount int,
	StatusID int,
	BrandID int,
	height float,
	width float,
	weight float,
	constraint product_in_subCategory FOREIGN KEY(SubCategoryID) REFERENCES SubCategory(SubCategoryID),
	constraint SellerID_in_Users FOREIGN KEY(SellerID) REFERENCES Users(UserID),
	constraint StatusID_in_Status FOREIGN KEY(StatusID) REFERENCES ProductStatus(StatusID),
	constraint BrandID_in_Brand FOREIGN KEY(BrandID) REFERENCES Brand(BrandID)
) ON [PRIMARY]
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Product VALUES (N'Nike Air Force 1 07 EasyOn',N'Quicker than 1, 2, 3—the original hoops shoe lets you get going. This version of the AF-1 features Nike EasyOn technology for a hands-free experience. The flexible heel collapses when you step in then snaps back into place, making it easy to slip the shoe on and off. Add that to its clean, crisp leather and you have got ultimate wearability. Yeah, its everything you love and then some.',9600000,7400000,23,1,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Nike Blazer Low 77 Vintage',N'Praised by the streets for its classic simplicity and comfort, the Nike Blazer Low 77 Vintage returns with its low-profile style and heritage b-ball looks. Featuring luscious suede details, a retro Swoosh design and a super-soft collar, its the must-have wardrobe staple that will take you everywhere.',6700000,5700000,15,1,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Nike SB Force 58',N'The latest and greatest innovation to hit the streets, the Force 58 gives you the durability of a cupsole with the flexibility of vulcanised shoes. Made from canvas and suede and finished with perforations on the toe, the whole look is infused with heritage basketball DNA.',1500000,1500000,0,1,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'ULTRABOOST LIGHT',N'Experience outstanding energy with the new Ultraboost Light shoe, our lightest version of Ultraboost. The magic lies in the Light BOOST midsole, the new generation of adidas BOOST cushions. The unique molecular design of this shoe reaches the lightest BOOST foam ever. With hundreds of energetic BOOST particles and ultimate comfort and smoothness, your feet will truly experience it all.',1700000 ,1700000 ,0,1,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'ADIZERO ADIOS 8 SHOES',N'Conquer a new personal record with this Adizero Adios 8 Shoe model. The new-style shoe body is made of ultra-light and breathable mesh fabric, and underneath is a combination of LIGHTSTRIKE 2.0 foam and ultra-light LIGHTSTRIKE PRO. That combination helps these shoes speed enough for competition day, while also durable with you to practice every day.',1700000 ,1700000 ,0,1,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Converse Weapon Leather',N'Want some 90s flair? Throw on this Converse Weapon that pays homage to our basketball and skate shoes from that era. A durable, leather upper in retro colors gives it the look of a pre-Y2K favorite.',2850000,2850000,0,2,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'Chuck Taylor All Star Canvas',N'Edgy this week, sporty next. Ten years from now? TBD. No matter how (or when) your style changes, you can always come back to the classic. The original Chuck Taylor All Star—an icon for every era.',4000000 ,3800000,5,2,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'Star Player 76 Monochrome',N'Watch your tones in these sporty, color-focused low-tops. Key details on this classic icon deliver on reliable fashion and function, while easy-to-style, allover color helps you nail the monochrome look',5500000 ,4950000 ,10,1,2,100,1,3,0,0,0)
INSERT INTO Product VALUES (N'DURAMO SL SHOES',N'Resolve to accelerate after each running session. The mesh body and soft neoprene rubber heel give this running shoe a technical look and a comfortable, supportive hug. When youre ready to get up to speed, the ultralight Lightmotion midstand is also ready to respond.',2500000 ,2500000 ,0,3,2,100,1, 2,0,0,0)
INSERT INTO Product VALUES (N'SUPERNOVA PRIMA RUNNING SHOES',N'From your first stride to your first 5K run, these adidas running shoes provide comfort and confidence on your journey to your personal running goals. The ultra-lightweight Dreamstrike+ cushioning absorbs impact on every step of the run, and a fine-tuned support system for smooth movement as you work on endurance. The technical mesh shoe body feels cool and breathable from the beginning to the end of the run.',2950000 ,2950000 ,0,3,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Air Jordan 9 G',N'MJs baseball tenure brought an incomparable buzz to the sport world. Every swing, shag and stolen base was scrutinised. In addition to the baseball pitches of Birmingham, he created fascinating moments on the courts of Chicago and numerous golf courses around the world. This special AJ9 threads together all three sports and celebrates MJs minor-league stint with pinstriped insoles, classic club colours and, of course, the iconic #45 decal on the heel.',190000,133000,30,5,2,100,1, 1,0,0,0)
INSERT INTO Product VALUES (N'Nike Court Vision Low',N'In love with the classic look of 80s basketball but have a thing for the fast-paced style of today game? Meet the Nike Court Vision. Crisp leather and suede overlays create an old-school look, while a plush collar keeps the shoe sleek, modern and comfortable.',250000 ,250000,0,2,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'PUMA x PALOMO Palermo Sneakers',N'Founded in 2015, Palomo Spain is known for designs that combine the dramatic spirit of southern Spain with the sophisticated street style of London. The latest PUMA x PALOMO SPAIN collab draws inspiration from the early ‘80s roller skate scene.',250000,25000,0,2,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'Rebound V6 Low Sneakers',N'Inspired by basketball, the Rebound Low is back to change the game. V6 offers a low-cut silhouette for daily wear on and off the court, a soft, tumbled leather look on the upper, and colourblocked PUMA branding for impact.',190000,190000,0,5,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'LOVE MARATHON Suede',N'Show your pride with the Love Marathon collection from PUMA. Created to celebrate and honor the LGBTQ+ community, these designs are modern, positive, with patterns inspired by the colors of the Progress Pride flag. The legendary PUMA Suede is ready to take on a new challenge, as it always has since its iconic release in 1968.',190000,57000 ,70,4,2,100,1,4,0,0,0)
INSERT INTO Product VALUES (N'WAVE LIGHTNING Z8 MID',N'Play at the top of your game with this comfortable shoe packed with features customized for volleyball. Enjoy soft cushioning and high energy return with the MIZUNO ENERZY NEXT and SOCKLINER at the forefoot, plus the MIZUNO ENERZY midsole. You will jump faster and higher than ever with the support from the new MIZUNO WAVE plus the rounded heel structure. All these features come at a remarkably light weight thanks to the monofilament mesh.',350000,350000,0,4,2,100,1,5,0,0,0)
INSERT INTO Product VALUES (N'LIGHTNING STAR Z7 JR',N'Newly remade from upper to sole, the Lightning Star Z7 Jr is the optimal model for comfort and lightness in junior players. The stress free upper construction coupled with a soft injection EVA and lightweight designed outsole allows you to focus on the moment. The wide outrigger forefoot and TPU stabilizer in the midfoot provides stability in key areas.',350000,350000,0,1,2,100,1,5,0,0,0)
INSERT INTO Product VALUES (N'VANS SPORT LOW MARSHMALLOW WHITE',N'Inspired by VANS classics of the 90s, the Sport Low is the new incarnation of the Skate Vans Sport shoe line. With a change to the lower neck, a longer blade, a striking "V" Sidestripe and color accents with unique retro details, the shoes are sure to be a highlight for any situation wherever you are.',450000,450000,0,1,2,100,1,6,0,0,0)
INSERT INTO Product VALUES (N'VANS SK8-HI CLASSIC TRUE WHITE',N'VANS SK8 HI is one of the classic and trademark shoes of VANS OFF THE WALL. The styling of the SK8 HI still focuses on developing simplicity and comfort from the design as well as the color, VANS SK8 is also favorably called a pair of high-necked OLD SKOOL, the neck of the shoe is specially padded to make them smooth.',450000 ,450000 ,0 ,2 ,2 ,100 ,1 ,6 ,0,0,0)
INSERT INTO Product VALUES (N'VANS MOMA CLAUDE MONET AUTHENTIC',N'VANS MoMA collection was born by the handshake of two big art lovers. This is one of the handshakes that has created a year-long dominance. All of that, inherently, proves the value of both innovators in their own marketplace and a combination that couldnt be more discerning.',390000,312000,20,9,2,100,1,6,0,0,0)
INSERT INTO Product VALUES (N'Soundwave II Womens Li-Ning Badminton Shoes AYTS016-6',N'Soundwave II AYTS016-6 badminton training shoes , with a simple, simple and elegant color scheme, stylish and versatile. Corrugated midsole provides excellent cushioning. The special textured mesh fabric combined with the leather design provides excellent upholstery and a stylish and versatile appearance.',550000,275000,50,6,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'VANS AUTHENTIC FLORAL VAPOROUS GRAY',N'The special thing about this product line is the ability to maintain popularity over time, being a fashion product with Vintage colors but not losing its appeal to young people. Vans has made Authentic a symbol of personal style and creative freedom. Imbued with the values and philosophies that Vans brings, Authentic Couple is a tribute to the unity between tradition and creativity.',500000,400000,20,2,2,100,1,6,0,0,0)
INSERT INTO Product VALUES (N'Li Ning Blade MAX AYAU003-2 professional badminton shoes',N'The Li-Ning Blade MAX professional badminton professional competition shoe uses a simple, casual and versatile color combination design. The upper part is made of a material that is comfortable, soft and gives comfort to the feet. The Li Ning logo on the shoe body and meticulous workmanship accentuate the brand charm. The toe-resistant design reduces scratches or bumps in the toes and protects every step.',550000,385000 ,30,9,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'Men and Women Li-Ning Badminton Shoes II. LITE AYTT003-2',N'Men and Women Li-Ning Badminton Shoes II. LITE AYTT003-2, which uses a simple, casual color scheme. The upper part is made from comfortable, pleasant and soft material, which gives a good foot feel. The Li-Ning logo on the shoe body is meticulously machined, highlighting the brand charm. The impact-resistant design of the toe reduces scratches or bumps on the toes and cherishes every step.',1253000,1253000,0,9,2,100,1,8,0,0, 0)
INSERT INTO Product VALUES (N'Li-Ning Badminton Shoes for SAGA AYTS071-2', N'Li-Ning badminton shoes for SAGA AYTS071-2 use a simple and casual color scheme. The basic style of the zipper continued, and new colors were added. The middle sole adopts Li Ning cloud technology, which has excellent cushioning ability. The arch of the foot is strengthened and supported by a large TPU area, stable and torsion-resistant. The upper part is made of a large mesh to enhance breathability, and the back is covered with leather for the comfort of the feet.',1253000,1253000,0,9,2,100,1,8,0,0,0)
INSERT INTO Product VALUES (N'Nike Court Lite 4 Men Tennis Shoes - White',N'Whether youre closing in on your opponent, taking gentle shots or putting all your strength into a decisive shot, the Nike Court Lite 4 Mens Tennis Shoes will be a reliable on-court companion. Designed with the perfect combination of durability, flexibility and support, the Nike Court Lite 4 Men Tennis Shoes help you move quickly on the court, execute powerful shots and confidently control any situation in the match. Lets break the limits with Nike and win!',285000,285000,0,8,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Nike Zoom Vapor Pro 2 Mens Tennis Shoes - White',N'Dramatic chases, long matches require really flexible, durable tennis shoes and optimal support. Nike Zoom Vapor Pro 2 Men Tennis Shoes is the ideal companion, helping you break out the speed, dominate every match. The product inherits the outstanding advantages of its predecessor, combining modern Zoom Air technology, providing great comfort and performance.',285000,285000,0,8,2,100,1,1,0,0,0)
INSERT INTO Product VALUES (N'Adidas Barricade 13 Mens Tennis Shoes - Multi-colored',N'Master the court with these adidas Barricade tennis shoes. The Torsion System provides stability to help you turn the game, and the deflected shoelace to one side helps to secure the foot as you make quick turns and slide the ball. The REPETITOR midsole provides support and smooth movement for strides on the field. The Sensepod Geofit areas hug the natural shape of your heel, ensuring comfort and support all the way to the match point.',750000,350000,53,8,2,100,1,2,0,0,0)
INSERT INTO Product VALUES (N'Adidas Avacourt Women Tennis Shoes - White',N'AVACOURT is designed based on the preferences and average size of female athletes. The lightweight Bounce Pro midsole provides cushioning in all required positions, while the TPU Torsion System provides optimal balance, providing stability and flexibility. The material of the neck of the shoe is soft, limiting the friction that causes discomfort during training and competition.',399000 ,199000,50,8,2,100,1,2, 0, 0,0 )
INSERT INTO Product VALUES (N'Puma Future Match MG Gear Up pack Persian Blue 107373-03',N'The ultimate multi-purpose soccer shoe that has just landed in the shop is the Puma Future Match MG, part of the Puma Gear Up collection, product code 107373-03. The model of intermediate shoes but meets the needs of multi-mobility, can play football on many different types of surfaces, extremely popular with players who play artificial grass but want to use long nails.',570000,299000,47,6,2,100,1,4, 0, 0, 0)
INSERT INTO Product VALUES (N'Puma Ultra Match TF Breakthrough pack in white and red – 107521-01',N'1 Ultra shoe line, speedboot 2 Match segment – intermediate 3 Puma Breakthrough collection, launching in July 2023 4 TF nail type – artificial grass stone 5 Weight (grams) 230, size 40 6 Upper material Textile yarn combined with synthetic leather, seamless chicken blade',2929000 ,2196750 ,25 ,7 ,2 ,100 ,1 ,4 ,0,0,0)
INSERT INTO Product VALUES (N'Mizuno Alpha Pro AS TF red, orange, white soles P1GD236464',N'The latest Mizuno Alpha Pro AS football shoes, with a beautiful bright red and orange color, white sole, product code P1GD236464. The shoe line has a burning desire to compete fairly with other giants, a true speed boot',1923000 ,961500 ,50 ,7 ,2 ,100 ,1 ,5 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Mizuno Morelia Neo III Pro AS TF in turquoise – P1GD238425',N'Its a shame if you havent played football with Mizuno Morelia Neo III Pro AS TF! This is the most advanced, finest and most beautiful super product of this brand from Japan, dedicated to artificial grass in Vietnam',1569000 , 784500,50 ,7,2 ,100 ,1 ,5 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Mizuno Wave Cup Legend AS TF in bronze white – P1GD201962',N'Mizuno Wave Cup Legend AS TF in bronze white, product code P1GD201962. A model of Mizunos iconic high-end shoe with K-Leather (Kangaroo genuine leather). The main white color scheme and shiny bronze logo create a highlight to make the overall shoes exude sophistication, isotope',1450000 ,1450000 ,0 ,7 ,2 ,100 ,1 ,5 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Puma Scoot Zeros Northern Lights Genuine Basketball Shoes ',N'Puma Scoot Zeros Basketball Shoes',1850000 ,1850000 ,0,5,2,100,1,4, 0, 0, 0)
INSERT INTO Product VALUES (N'Puma MB.02 Platinum Gray Ultra Orange Basketball Shoes ',N'The traction of the Puma MB.02 are bases with many unique patterns, evenly distributed and located close to each other. The base helps to feel the pitch extremely well, the steps become solid, accelerate, change direction or stop suddenly extremely stable.',50000 ,50000 ,0 ,5 ,2 ,100 ,1 ,4 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Gucci Rhyton Leather Sneaker Logo ',N'The House Of Gucci, also known by its shorter name GUCCI, is a famous fashion brand with both Italian aristocratic style and typical French elegance.', 15000, 15000, 0, 1, 2,100 ,1 ,7 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Gucci Basket High Top White Green Purple Shoes',N'On a business trip to London and the US, the founder of this fashion brand noticed that guests here are very fond of luxurious and unique bags.',15000 ,15000 ,0 ,5 ,2 ,100 ,1 ,7 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Gucci Basket Shoe Light blue Demetra',N'Gucci Basket Shoe Light blue Demetra',15000 ,15000 ,0 ,5 ,2 ,100 ,1 ,7 ,0 ,0 ,0 )
INSERT INTO Product VALUES (N'Gucci Orignal GG Canvas',N'The House Beige and Ebony Orignal GG Canvas shoe is embellished with a bee embroidered with gold on a green and red background. The bee is a stock code first introduced in Gucci ready-to-wear in the 1970s',15000 ,15000 ,0 ,1 ,2 ,100 ,1 ,7,0 ,0 ,0 )




-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE [dbo].[ProductImg](
	[ProductID] [int]  ,
	[ProductImgURL] [varchar](255) ,
	constraint ProductImg_ID FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
	)
	go

INSERT INTO dbo.ProductImg VALUES (1,'nikearirforce107easyon.png');
INSERT INTO dbo.ProductImg VALUES (2,'nikeblazerlow77vintage.png');
INSERT INTO dbo.ProductImg VALUES (3,'nikesbforce58.png');
INSERT INTO dbo.ProductImg VALUES (4,'ultraboostlight.png');
INSERT INTO dbo.ProductImg VALUES (5,'adizeroadios8shoes.png');
INSERT INTO dbo.ProductImg VALUES (6,'converseweaponleather.jpg');
INSERT INTO dbo.ProductImg VALUES (7,'chuckallstar.jpg');
INSERT INTO dbo.ProductImg VALUES (8,'monochrome.jpg');
INSERT INTO dbo.ProductImg VALUES (9,'duramoslshoes.png');
INSERT INTO dbo.ProductImg VALUES (10,'supernovaprimarunningshoes.png');
INSERT INTO dbo.ProductImg VALUES (11,'airjordan9g.png');
INSERT INTO dbo.ProductImg VALUES (12,'nikevisionlow.png');
INSERT INTO dbo.ProductImg VALUES (13,'palomo.jpg');
INSERT INTO dbo.ProductImg VALUES (14,'v6.jpg');
INSERT INTO dbo.ProductImg VALUES (15,'love.jpg');
INSERT INTO dbo.ProductImg VALUES (16,'z8.jpg');
INSERT INTO dbo.ProductImg VALUES (17,'lightningz7.jpg');
INSERT INTO dbo.ProductImg VALUES (18,'sportlow.jpg');
INSERT INTO dbo.ProductImg VALUES (19,'hi.jpg');
INSERT INTO dbo.ProductImg VALUES (20,'moma.jpg');
INSERT INTO dbo.ProductImg VALUES (21,'soundwave.jpg');
INSERT INTO dbo.ProductImg VALUES (22,'flora.png');
INSERT INTO dbo.ProductImg VALUES (23,'liningblade.jpg');
INSERT INTO dbo.ProductImg VALUES (24,'lininglite.jpg');
INSERT INTO dbo.ProductImg VALUES (25,'liningsaga.jpg');
INSERT INTO dbo.ProductImg VALUES (26,'nikecount.jpg');
INSERT INTO dbo.ProductImg VALUES (27,'nikevapor.jpg');
INSERT INTO dbo.ProductImg VALUES (28,'barricade.jpg');
INSERT INTO dbo.ProductImg VALUES (29,'avacourt.jpg');
INSERT INTO dbo.ProductImg VALUES (30,'mg.jpg');
INSERT INTO dbo.ProductImg VALUES (31,'tf.jpg');
INSERT INTO dbo.ProductImg VALUES (32,'alphapro.jpg');
INSERT INTO dbo.ProductImg VALUES (33,'neo3.png');
INSERT INTO dbo.ProductImg VALUES (34,'wavecup.jpg');
INSERT INTO dbo.ProductImg VALUES (35,'scoot.jpg');
INSERT INTO dbo.ProductImg VALUES (36,'MB02.jpg');
INSERT INTO dbo.ProductImg VALUES (37,'rhyton.jpg');
INSERT INTO dbo.ProductImg VALUES (38,'guccibasket.jpg');
INSERT INTO dbo.ProductImg VALUES (39,'demetra.jpg');
INSERT INTO dbo.ProductImg VALUES (40,'canvas.jpg');


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Cart (
	UserID int,
	ProductID int,
	Amount int
	constraint userID_in_cart FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint productID_in_cart FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
) ON [PRIMARY]
GO
INSERT INTO Cart VALUES (4, 1, 1);
INSERT INTO Cart VALUES (4, 3, 1);
INSERT INTO Cart VALUES (5, 1, 1);
INSERT INTO Cart VALUES (5, 2, 1);
INSERT INTO Cart VALUES (6, 2, 2);


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Order_Status](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Name] [nvarchar](50) NOT NULL,
 ) ON [PRIMARY]
GO
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Waiting for Confirmation')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Packaging')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Delivering')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Canceled')
INSERT [dbo].[Order_Status] ([Name]) VALUES (N'Completed')

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Orders](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[UserID] [int] NULL,
	[TotalPrice] [int] NULL,
	[Note] [nvarchar](2000) NULL,
	[Status] [int] NULL,
	[Date] [DATETIME] NULL ,
	constraint userID_in_order_status FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint statusID_in_order_status FOREIGN KEY(Status) REFERENCES Order_Status(ID)
) ON [PRIMARY]
GO
INSERT INTO Orders VALUES (4, 270000, null, 3, '2024/01/06 04:17');
INSERT INTO Orders VALUES (5, 90000, null, 3, '2024/01/16 12:36');
INSERT INTO Orders VALUES (5, 1270000, null, 3, '2024/02/12 10:18');
INSERT INTO Orders VALUES (6, 1270000, null, 1, '2024/02/11 01:30');
INSERT INTO Orders VALUES (6, 143000, null, 5, '2024/03/11 01:30');
INSERT INTO Orders VALUES (7, 2580000, null, 1, '2024/03/14 02:30');
INSERT INTO Orders VALUES (8, 4560000, null, 1, '2024/04/18 04:30');
INSERT INTO Orders VALUES (9, 900000, null, 1, '2024/05/23 05:30');
INSERT INTO Orders VALUES (9, 1240000, null, 1, '2024/05/09 09:30');
INSERT INTO Orders VALUES (10, 1230000, null, 1, '2024/06/01 11:30');
INSERT INTO Orders VALUES (11,1470000, null, 1, '2024/06/02 03:30');
INSERT INTO Orders VALUES (12,1470000, null, 1, '2024/06/03 00:00');
INSERT INTO Orders VALUES (15,1470000, null, 1, '2024/06/04 00:00');
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE [dbo].[Order_Detail](
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	[Order_ID] [int] NOT NULL ,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](1000) NOT NULL,
	[ProductPrice] [int] NOT NULL,	
	[Quantity] [int] NOT NULL,
	constraint orderID_in_order_detail FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint productID_in_order_detail FOREIGN KEY(ProductID) REFERENCES Product(ProductID)	
) ON [PRIMARY]


GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 1, 1, N'Nike Air Force 1 07 EasyOn', 15, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 1, 2, N'Nike Blazer Low 77 Vintage', 2, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 2, 3, N'Nike SB Force 58', 5, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 3, 4, N'ULTRABOOST LIGHT', 6, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 4, 5, N'ADIZERO ADIOS 8 SHOES', 150, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 5, 6, N'Converse Weapon Leather', 270000, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 6, 7, N'Chuck Taylor All Star Canvas', 90000, 2)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (7, 8, N'Star Player 76 Monochrome', 1270000, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 8, 9, N'DURAMO SL SHOES', 163000, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 9, 10, N'SUPERNOVA PRIMA RUNNING SHOES', 163000, 1)
GO

-- This month
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 11, N'Air Jordan 9 G', 15, 5)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 40, N'Gucci Orignal GG Canvas', 2, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 39, N'Gucci Basket Shoe Light blue Demetra', 5, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 25, N'Li-Ning Badminton Shoes for SAGA AYTS071-2', 6, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 35, N'Puma Scoot Zeros Northern Lights Genuine Basketball Shoes ', 150, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 15, N'LOVE MARATHON Suede', 270000, 4)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 30, N'Puma Future Match MG Gear Up pack Persian Blue 107373-03', 90000, 3)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES (12, 8, N'Star Player 76 Monochrome', 1270000, 1)
GO
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 16, N'WAVE LIGHTNING Z8 MID', 163000, 2)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 12, 17, N'LIGHTNING STAR Z7 JR', 163000, 1)
GO
-- Last month
INSERT [dbo].[Order_Detail] ( [Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 13, 1,N'Nike Air Force 1 07 EasyOn' , 15, 1)
GO
INSERT [dbo].[Order_Detail] ([Order_ID], [ProductID], [ProductName], [ProductPrice], [Quantity]) VALUES ( 13, 10, N'SUPERNOVA PRIMA RUNNING SHOES', 163000, 1)
GO
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ShipInfo (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Order_ID int,
	CustomerName nvarchar(1000), --Real name of the Customer
	ShippingAddress nvarchar(1000), 
	ShipCityID int,
	PhoneNum varchar(20),
	Note nvarchar(2000),
	constraint order_id_in_ship_info FOREIGN KEY(Order_ID) REFERENCES Orders(ID),
	constraint ship_city_in_ship_info FOREIGN KEY(ShipCityID) REFERENCES Ship(id)
) ON [PRIMARY]
GO


-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Notifications(
	
	ID int PRIMARY KEY identity (1,1),
	UserID int,
	OrderID int,
	Content nvarchar(1000),
	status int,
	time datetime,
	constraint UserID_in_Users FOREIGN KEY(UserID) REFERENCES Users(userId),
	constraint OrderID_in_Orders FOREIGN KEY(OrderID) REFERENCES Orders(ID)

);
GO
INSERT INTO Notifications VALUES (5,1,N'Test Checked',1,GETDATE())
INSERT INTO Notifications VALUES (5,1,N'Test Unchecked',0,GETDATE())
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Feedback (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	UserID int,
	ProductID int,
	OrderID int,
	Star int, --min 1- max 5
	FeedbackDetail nvarchar(2000),
	constraint userID_in_user_3 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint orderID_in_orders_6 FOREIGN KEY(OrderID) REFERENCES Orders(ID),
	constraint productID_in_feedback FOREIGN KEY(ProductID) REFERENCES Product(ProductID),
	constraint valid_star CHECK (Star < 6 AND Star > 0)
) ON [PRIMARY]
GO
INSERT INTO Feedback VALUES (4, 1, 1, 5, N'Very good');
INSERT INTO Feedback VALUES (5, 2, 2, 4, N'Good');
INSERT INTO Feedback VALUES (5, 1, 3,5, N'Sản phẩm rất tốt');
INSERT INTO Feedback VALUES (6, 1, 4,1, N'Gửi sai sản phẩm');







-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE Feedback_Replies (
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	FeedbackID int,
	UserID int,
	RepliesText nvarchar(2000),
	constraint userID_in_user_4 FOREIGN KEY(UserID) REFERENCES Users(UserID),
	constraint feedbackID_in_feedback FOREIGN KEY(FeedbackID) REFERENCES Feedback(ID),
) ON [PRIMARY]
GO
INSERT INTO Feedback_Replies VALUES (1, 5, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (2, 4, N'Xin Cám Ơn!');
INSERT INTO Feedback_Replies VALUES (3, 6, N'Xin Cám Ơn!');


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create TABLE Blog(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Author nvarchar(100),
Title nvarchar(2500),
Content nvarchar(2500),
imageLink nvarchar(1000),
)ON [PRIMARY]
GO
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'linhzd',N'Giày Nike từ A - Z',N'Sau hơn 50 năm hình thành và phát triển, chất lượng, mẫu mã sản phẩm của Nikekhông ngừng thay đổi. Giờ đây, Nike đã trở thành thương hiệu “quyền lực nhất trong vương quốc thể thao”. Một điều chắc chắn ai trong chúng ta cũng đã từng tận mắt nhìn thấy hoặc đã từng sở hữu một đôi Nike cho riêng mình. Giày Nike được chăm chút tỉ mỉ từng đường kim, mũi chỉ đầy tinh tế nhờ đôi bàn tay lão luyện của những người thợ hàng đầu ngành thời trang. Đặc biệt, giày Nike còn sử dụng các chất liệu có độ bền cao, rất khó bị bong tróc, hư hỏng. Một đôi giày Nike có tuổi thọ rất lâu, sử dụng có thể đến trên 3 năm vẫn giữ được chất lượng ban đầu. ',N'giaynike.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'manhle',   N'Giày Adidas chuẩn phong cách, ấn tượng',N'Adidas là một thương hiệu thời trang thể thao dành cho mọi đối tượng, mọi giới tính, mọi độ tuổi, tầng lớp khác nhau. Dù bạn là ai thì đều có thể mang trên mình hãng thời trang này. Vì lẽ đó mà giày Adidas có khá nhiều thể loại (dòng), với nhiều mức khác nhau giúp cho bạn thoải mái lựa chọn theo nhu cầu và tiêu chí của mình. Một sản phẩm Adidas thông thường thuộc loại rẻ nhất cũng dao động từ 2 đến 4 triệu đồng. Còn đối với những đôi phong cách hơn thì giá cũng dao động từ 5 đến 10 triệu đồng. Adidas còn ra thêm một dòng sản phẩm nữa là loại siêu Vip dành cho các tay chơi sành điệu có mức giá được đưa ra là không hề nhỏ.',N'giayadidas.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'danduy',  N'Converse, xu thế giày 2024',N'Với sự thay đổi liên tục, xu hướng giày luôn được cập nhật mới mẻ hơn, độc đáo, hiện đại và thu hút hơn. Những phong cách mới, xu thế giày hot luôn được mọi người quan tâm, đặc biệt là giới trẻ. Không thể phủ nhận ngành công nghiệp giày dép đang phát triển rất mạnh mẽ. Không chỉ đơn giản là cách đi, cách mix&match giày hay đi giày theo phong cách yêu thích, đi giày còn là sự đổi mới, phá cách và tràn đầy sức sáng tạo ấn tượng. Vậy bạn đã có ý tưởng gì cho mình chưa? Cùng mình khám phá ngay nhé.',N'giayconverse.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'sonle',   N'Mix giày cho chàng ngày hè',N'Bạn có thể chọn những gam màu sáng như trắng, cam, be,.. để tạo sự trẻ trung, tươi mới hoặc những gam màu trầm tối như đen, nâu, xanh rêu,... vừa đem đến sự tinh tế vừa phong cách, thời trang.',N'giaypuma.jpg')
INSERT INTO dbo.Blog(Author,Title,Content,imageLink)VALUES(N'tuananh',  N'Giày Mizuno cho anh em cầu lông',N'Là một người đam mê cầu lông, bạn không thể bỏ qua những đôi giày Mizuno - thương hiệu giày cầu lông hàng đầu Nhật Bản được tin dùng bởi các vận động viên chuyên nghiệp và cả người chơi nghiệp dư.',N'giaymizuno.jpg')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Create table PostCategory(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
CategoryName nvarchar(1000)
)
ON [PRIMARY]
GO
SET IDENTITY_INSERT  PostCategory ON
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(1,N'public')
INSERT [dbo].[PostCategory]([ID], [CategoryName]) VALUES(2,N'hide')
SET IDENTITY_INSERT PostCategory OFF
go
Create TABLE Post(
ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
Description nvarchar(2500),
UserID int,
date nvarchar(2500),
CategoryID int,
PostImgURL varchar(255),
constraint userID_in_user_5 FOREIGN KEY(UserID) REFERENCES Users(UserID),
constraint CategoryID_in_PostCategory FOREIGN KEY(CategoryID) REFERENCES PostCategory(ID)
)ON [PRIMARY]
go
SET IDENTITY_INSERT Post ON
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (1, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster1.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (2, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster2.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (3, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 2, N'poster3.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (4, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 2, N'poster4.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (5, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster5.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (6, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster6.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (7, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster7.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (8, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster8.jpg')
INSERT [dbo].[Post] ([ID], [Description], [UserID], [date], [CategoryID], [PostImgURL]) VALUES (9, N' GIÀY MỚI VỀ ĐẸP KHÔNG THỂ CƯỠNG LẠI ĐƯỢC!” Bạn sẽ có khả năng sở hữu mẫu giày siêu đẹp này chỉ với giá 1xxk/ hàng hóa. Chất liệu hàng đầu, thoải mái, giúp người đi năng động, tự tin hơn. Đặc biệt khuyến mãi ưu đãi vào những dịp lễ lớn', 1, N'15/04/2024', 1, N'poster9.jpg')
SET IDENTITY_INSERT Post OFF

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE CBanner
(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Img VARCHAR(2500),
	Title NVARCHAR(2500),
	[desc] NVARCHAR(2500)
)
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('nike.png',  N'NIKE',  N'Just Do It !'  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('adidas.jpg',  N'ADIDAS',  N'Boost your run ! '  )
INSERT INTO dbo.CBanner(Img,Title,[desc])VALUES('converse.png',  N'CONVERSE',  N'Make it your own !'  )
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE Banner
(
	ID int NOT NULL IDENTITY(1, 1) PRIMARY KEY,
	Img VARCHAR(2500),
)
INSERT INTO dbo.Banner VALUES('banner10.jpg')
INSERT INTO dbo.Banner VALUES('banner35.jpg')
INSERT INTO dbo.Banner VALUES('banner40.jpg')
INSERT INTO dbo.Banner VALUES('banner60.jpg')
INSERT INTO dbo.Banner VALUES('banner80.png')
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE dbo.[ChatFriend](
	[uId] [int] NOT NULL,
	[friendId] [int] NOT NULL,
	FOREIGN KEY ([uId]) REFERENCES dbo.[Users](UserID),
	FOREIGN KEY (friendId) REFERENCES dbo.[Users](UserID),
)
go
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 1);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 2);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (6, 3);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (1, 6);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (2, 6);
INSERT [dbo].[ChatFriend] ([uId], [friendId]) VALUES (3, 6);
---------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE dbo.[ChatMessage](
	[mId] [int] IDENTITY(1,1) NOT NULL,
	[fromId] [int] NOT NULL,
	[toId] [int] NOT NULL,
	[content] [nvarchar](200) NOT NULL,
	[dateCreated] [datetime] DEFAULT GETDATE() NOT NULL,
	[status] [int] DEFAULT 1 NULL,
	FOREIGN KEY ([fromId]) REFERENCES dbo.[Users](UserID),
	FOREIGN KEY ([toId]) REFERENCES dbo.[Users](UserID),
)
go
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Hi', CAST(N'2024-4-26 22:38:21.373' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Nice to meet you', CAST(N'2024-4-26 22:38:30.103' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (1, 6, N'Thanks', CAST(N'2024-4-26 22:38:36.727' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (1, 6, N'Thanks', CAST(N'2024-4-26 22:38:43.073' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 2, N'Hello', CAST(N'2024-4-27 10:39:30.800' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 2, N'How do you do', CAST(N'2024-4-27 10:39:42.200' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (2, 6, N'How do you do', CAST(N'2024-4-27 10:39:47.860' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (2, 6, N'See you later', CAST(N'2024-4-27 10:39:56.893' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'how are you', CAST(N'2024-4-28 08:51:27.353' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'good, thanks', CAST(N'2024-4-29 13:48:07.780' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'great', CAST(N'2024-4-29 13:53:25.967' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 3, N'how are you', CAST(N'2024-4-29 14:00:21.740' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 3, N'fine, thanks', CAST(N'2024-4-29 14:00:36.213' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (3, 6, N'Hello', CAST(N'2024-4-29 14:00:56.170' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (3, 6, N'hi', CAST(N'2024-4-29 14:01:33.273' AS DateTime), 1);
INSERT [dbo].[ChatMessage] ([fromId], [toId], [content], [dateCreated], [status]) VALUES (6, 1, N'Hey', CAST(N'2024-4-29 14:15:11.593' AS DateTime), 1);
---------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE TABLE ShipStatus(
ID INT IDENTITY(1,1) NOT NULL,
[Name] NVARCHAR(100),
);
go
CREATE TABLE Delivery(
ID INT IDENTITY(1,1) NOT NULL,
ShipInfoID INT,
UserID INT,
[Status] INT,
FOREIGN KEY (ShipInfoID) REFERENCES dbo.ShipInfo(ID),
FOREIGN KEY (UserID) REFERENCES dbo.Users(UserID),
);
go

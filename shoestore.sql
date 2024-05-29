CREATE DATABASE ShoeShop
USE ShoeShop


CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(500),
    Status NVARCHAR(50)
)

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Description NVARCHAR(500),
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT,
    StockQuantity INT,
    Image NVARCHAR(255),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID)
)

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    PhoneNumber VARCHAR(20),
    Email VARCHAR(255)
)

CREATE TABLE Store (
    StoreID INT PRIMARY KEY,
    StoreName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255)
)

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    PhoneNumber VARCHAR(20),
    Position NVARCHAR(50),
    StoreID INT,
    Status VARCHAR(50),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
)

CREATE TABLE Account (
    AccountID INT PRIMARY KEY,
    Username NVARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL,
	DateofBirth DATE,
	Age INT,
	Gender VARCHAR(10),
    Role VARCHAR(50),
    Status NVARCHAR(50),
    EmployeeID INT,
    CustomerID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)



CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    InventoryName NVARCHAR(255) NOT NULL,
    Address NVARCHAR(255),
    StoreID INT,
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID)
)

CREATE TABLE InventoryProduct (
    InventoryID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (InventoryID, ProductID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderStatus VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    CustomerID INT,
    EmployeeID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)

CREATE TABLE OrderProduct (
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

CREATE TABLE Bill (
    BillID INT PRIMARY KEY,
    OrderID INT,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(50),
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
)

CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    Content TEXT,
    Rating INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
)

CREATE TABLE Report (
    ReportID INT PRIMARY KEY,
    ReportType NVARCHAR(50),
    TimePeriod DATE,
    ReportContent NVARCHAR(255),
    StoreID INT,
    EmployeeID INT,
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
)

CREATE TABLE Statistic (
    StatisticID INT PRIMARY KEY,
    StatisticType NVARCHAR(50),
    TimePeriod DATE,
    StatisticContent NVARCHAR(255),
    ProductID INT,
    OrderID INT,
    InventoryID INT,
    CategoryID INT,
    EmployeeID INT,
    StoreID INT,
    CustomerID INT,
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
)

CREATE TABLE Promotion (
    PromotionID INT PRIMARY KEY,
    PromotionName NVARCHAR(255) NOT NULL,
    Discount DECIMAL(5, 2) NOT NULL,  
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
)

CREATE TABLE ProductPromotion (
    ProductID INT,
    PromotionID INT,
    PRIMARY KEY (ProductID, PromotionID),
    FOREIGN KEY (ProductID) REFERENCES Product(ProductID),
    FOREIGN KEY (PromotionID) REFERENCES Promotion(PromotionID)
)

INSERT INTO Category (CategoryID, CategoryName, Description, Status) VALUES
(1, 'Sneakers', ' Sneaker, hay còn được gọi là "giày thể thao", là loại giày được thiết kế đặc biệt cho các hoạt động thể thao như chạy bộ, tập gym, và nhiều hoạt động khác. Điểm đặc trưng của sneaker là đế giày được làm từ chất liệu cao su mềm, trong khi phần trên thường được làm từ vải hoặc da bạt, tạo cảm giác êm ái và mềm mại khi sử dụng. ', 'Active'),
(2, 'Running Shoes', ' Running shoes là loại giày phù hợp cho các hoạt động chạy bộ trên máy, ngoài trời, các hoạt động đi bộ nhẹ nhàng và các hoạt động thể thao khác mang tính bền bỉ hoặc đi đường dài.', 'Active'),
(3, 'Boots', 'Giày boots là một trong những loại giày được thiết kế để che phủ từ phần mắt cá chân trở lên đến đùi. Việc phân loại cổ boot theo nhiều kích thước khác nhau tạo nên sự đa dạng và đáp ứng đa dạng nhu cầu sử dụng.', 'Active'),
(4, 'Sandals', ' Sandal là một loại giày có cấu trúc mở, bao gồm một đế được giữ vào chân người mang bằng một hệ thống đai và dây vòng qua mu bàn chân và cổ chân.', 'Active'),
(5, 'Loafers', ' Giày Loafer còn được gọi là giày lười làm bằng chất liệu da cao cấp thường được đóng bộ cùng với vest, suits hoặc blazer. ', 'Active'),
(6, 'Dress Shoes', 'Dress Shoes là một tên gọi khác của giày tây công sở chuyên dùng để đi tiệc, dành cho cả phong cách nghiêm túc (Formal) hay phong cách thường nhật (Casual).', 'Active'),
(7, 'High Heels', 'Women’s shoes with a raised heel.', 'Active')
GO 

INSERT INTO Product (ProductID, ProductName, Description, Price, CategoryID, StockQuantity, Image) VALUES
(1, 'Air Max', 'Popular sneaker with excellent cushioning.', 120.00, 1, 50, 'air_max.jpg'),
(2, 'Classic Chucks', 'Timeless canvas sneakers.', 60.00, 1, 100, 'classic_chucks.jpg'),
(3, 'Stan Smith', 'Iconic white leather sneakers.', 80.00, 1, 70, 'stan_smith.jpg'),
(4, 'Old Skool', 'Classic skate shoes.', 70.00, 1, 90, 'old_skool.jpg'),
(5, 'Superstar', 'Adidas’ legendary shell toe sneakers.', 85.00, 1, 60, 'superstar.jpg'),
(6, 'Blazer', 'Retro basketball shoes turned lifestyle.', 95.00, 1, 55, 'blazer.jpg'),
(7, '574', 'New Balance’s classic running-inspired sneakers.', 80.00, 1, 85, '574.jpg'),
(8, 'Gazelle', 'Sleek and stylish sneakers from Adidas.', 75.00, 1, 65, 'gazelle.jpg'),
(9, 'Cortez', 'Nike’s original running shoe.', 70.00, 1, 80, 'cortez.jpg'),
(10, 'RS-X', 'Puma’s chunky and bold sneakers.', 110.00, 1, 45, 'rs_x.jpg'),

(11, 'Gel Kayano', 'High-performance running shoes.', 130.00, 2, 40, 'gel_kayano.jpg'),
(12, 'Pegasus', 'Versatile running shoes from Nike.', 120.00, 2, 50, 'pegasus.jpg'),
(13, 'Ultraboost', 'Responsive and comfortable running shoes.', 180.00, 2, 30, 'ultraboost.jpg'),
(14, 'Zoom Fly', 'Lightweight and fast running shoes.', 150.00, 2, 35, 'zoom_fly.jpg'),
(15, 'Wave Rider', 'Cushioned running shoes from Mizuno.', 140.00, 2, 25, 'wave_rider.jpg'),
(16, 'FuelCell', 'High-energy return running shoes.', 160.00, 2, 20, 'fuelcell.jpg'),
(17, 'Hoka One', 'Maximalist cushioned running shoes.', 170.00, 2, 25, 'hoka_one.jpg'),
(18, 'Cloudflow', 'Light and agile running shoes.', 130.00, 2, 40, 'cloudflow.jpg'),
(19, 'Ghost', 'Balanced and soft running shoes from Brooks.', 140.00, 2, 30, 'ghost.jpg'),
(20, 'Fresh Foam', 'Comfortable running shoes from New Balance.', 150.00, 2, 35, 'fresh_foam.jpg'),

(21, 'Chelsea Boots', 'Stylish and versatile ankle boots.', 150.00, 3, 50, 'chelsea_boots.jpg'),
(22, 'Work Boots', 'Durable boots for heavy-duty work.', 200.00, 3, 40, 'work_boots.jpg'),
(23, 'Hiking Boots', 'Rugged boots for outdoor adventures.', 180.00, 3, 30, 'hiking_boots.jpg'),
(24, 'Combat Boots', 'Tough and trendy boots.', 170.00, 3, 35, 'combat_boots.jpg'),
(25, 'Ankle Boots', 'Chic boots for everyday wear.', 140.00, 3, 50, 'ankle_boots.jpg'),
(26, 'Rain Boots', 'Waterproof boots for wet weather.', 120.00, 3, 45, 'rain_boots.jpg'),
(27, 'Snow Boots', 'Insulated boots for cold conditions.', 160.00, 3, 40, 'snow_boots.jpg'),
(28, 'Motorcycle Boots', 'Protective and stylish riding boots.', 190.00, 3, 25, 'motorcycle_boots.jpg'),
(29, 'Cowboy Boots', 'Western-style boots.', 200.00, 3, 20, 'cowboy_boots.jpg'),
(30, 'Dress Boots', 'Elegant boots for formal occasions.', 170.00, 3, 35, 'dress_boots.jpg'),

(31, 'Flip Flops', 'Casual sandals for the beach.', 20.00, 4, 100, 'flip_flops.jpg'),
(32, 'Gladiator Sandals', 'Trendy sandals with straps.', 50.00, 4, 60, 'gladiator_sandals.jpg'),
(33, 'Slide Sandals', 'Easy slip-on sandals.', 30.00, 4, 80, 'slide_sandals.jpg'),
(34, 'Sport Sandals', 'Comfortable and durable sandals.', 60.00, 4, 70, 'sport_sandals.jpg'),
(35, 'Thong Sandals', 'Simple and classic sandals.', 25.00, 4, 90, 'thong_sandals.jpg'),
(36, 'Wedge Sandals', 'Stylish sandals with a wedge heel.', 70.00, 4, 50, 'wedge_sandals.jpg'),
(37, 'Fisherman Sandals', 'Comfortable and protective sandals.', 65.00, 4, 55, 'fisherman_sandals.jpg'),
(38, 'Espadrilles', 'Light and casual sandals.', 45.00, 4, 65, 'espadrilles.jpg'),
(39, 'Platform Sandals', 'Sandals with a thick sole.', 55.00, 4, 60, 'platform_sandals.jpg'),
(40, 'Dress Sandals', 'Elegant sandals for formal events.', 80.00, 4, 40, 'dress_sandals.jpg'),

(41, 'Penny Loafers', 'Classic slip-on shoes.', 100.00, 5, 80, 'penny_loafers.jpg'),
(42, 'Tassel Loafers', 'Stylish loafers with tassels.', 110.00, 5, 70, 'tassel_loafers.jpg'),
(43, 'Horsebit Loafers', 'Elegant loafers with metal decoration.', 120.00, 5, 60, 'horsebit_loafers.jpg'),
(44, 'Suede Loafers', 'Soft and comfortable loafers.', 130.00, 5, 50, 'suede_loafers.jpg'),
(45, 'Moccasin Loafers', 'Casual and comfortable loafers.', 90.00, 5, 90, 'moccasin_loafers.jpg'),
(46, 'Driving Loafers', 'Loafers designed for driving comfort.', 100.00, 5, 80, 'driving_loafers.jpg'),
(47, 'Dress Loafers', 'Formal loafers for business attire.', 140.00, 5, 60, 'dress_loafers.jpg'),
(48, 'Casual Loafers', 'Relaxed and comfortable loafers.', 80.00, 5, 100, 'casual_loafers.jpg'),
(49, 'Velvet Loafers', 'Luxurious and stylish loafers.', 150.00, 5, 40, 'velvet_loafers.jpg'),
(50, 'Leather Loafers', 'Durable and elegant loafers.', 120.00, 5, 70, 'leather_loafers.jpg'),

(51, 'Oxford Shoes', 'Classic formal shoes.', 150.00, 6, 50, 'oxford_shoes.jpg'),
(52, 'Derby Shoes', 'Elegant and versatile shoes.', 140.00, 6, 60, 'derby_shoes.jpg'),
(53, 'Brogue Shoes', 'Formal shoes with decorative perforations.', 160.00, 6, 40, 'brogue_shoes.jpg'),
(54, 'Monk Strap Shoes', 'Shoes with a buckle strap.', 170.00, 6, 35, 'monk_strap_shoes.jpg'),
(55, 'Wholecut Shoes', 'Seamless and elegant shoes.', 180.00, 6, 30, 'wholecut_shoes.jpg'),
(56, 'Cap Toe Shoes', 'Formal shoes with a toe cap.', 150.00, 6, 50, 'cap_toe_shoes.jpg'),
(57, 'Patent Leather Shoes', 'Shiny and formal shoes.', 160.00, 6, 45, 'patent_leather_shoes.jpg'),
(58, 'Wingtip Shoes', 'Shoes with wingtip detailing.', 140.00, 6, 55, 'wingtip_shoes.jpg'),
(59, 'Tuxedo Shoes', 'Formal shoes for black tie events.', 200.00, 6, 25, 'tuxedo_shoes.jpg'),
(60, 'Velvet Dress Shoes', 'Luxurious and formal shoes.', 210.00, 6, 20, 'velvet_dress_shoes.jpg'),

(61, 'Stiletto Heels', 'High heels with a thin heel.', 100.00, 7, 60, 'stiletto_heels.jpg'),
(62, 'Block Heels', 'Heels with a thick, block-like heel.', 90.00, 7, 70, 'block_heels.jpg'),
(63, 'Wedge Heels', 'Heels with a wedge shape.', 110.00, 7, 50, 'wedge_heels.jpg'),
(64, 'Kitten Heels', 'Short and slender heels.', 80.00, 7, 80, 'kitten_heels.jpg'),
(65, 'Platform Heels', 'Heels with a thick platform.', 120.00, 7, 40, 'platform_heels.jpg'),
(66, 'Peep Toe Heels', 'Heels with an open toe.', 90.00, 7, 70, 'peep_toe_heels.jpg'),
(67, 'Slingback Heels', 'Heels with a strap at the back.', 100.00, 7, 60, 'slingback_heels.jpg'),
(68, 'Ankle Strap Heels', 'Heels with a strap around the ankle.', 110.00, 7, 50, 'ankle_strap_heels.jpg'),
(69, 'Mule Heels', 'Heels without a back.', 95.00, 7, 65, 'mule_heels.jpg'),
(70, 'Cone Heels', 'Heels with a cone shape.', 105.00, 7, 55, 'cone_heels.jpg')


INSERT INTO Customer (CustomerID, CustomerName, Address, PhoneNumber, Email) VALUES
(1, 'John Doe', '123 Elm St', '555-1234', 'john@example.com'),
(2, 'Jane Smith', '456 Oak St', '555-5678', 'jane@example.com'),
(3, 'Alice Johnson', '789 Pine St', '555-8765', 'alice@example.com'),
(4, 'Bob Brown', '101 Maple St', '555-3456', 'bob@example.com'),
(5, 'Charlie Davis', '202 Spruce St', '555-6789', 'charlie@example.com'),
(6, 'Dana Evans', '303 Cedar St', '555-9876', 'dana@example.com'),
(7, 'Eve Foster', '404 Birch St', '555-5432', 'eve@example.com'),
(8, 'Frank Green', '505 Walnut St', '555-6543', 'frank@example.com'),
(9, 'Grace Harris', '606 Poplar St', '555-7654', 'grace@example.com'),
(10, 'Hank Irwin', '707 Chestnut St', '555-8765', 'hank@example.com'),
(11, 'Ivy James', '808 Beech St', '555-9876', 'ivy@example.com'),
(12, 'Jack Knight', '909 Ash St', '555-1234', 'jack@example.com'),
(13, 'Kara Long', '1010 Fir St', '555-2345', 'kara@example.com'),
(14, 'Leo Moore', '1111 Cypress St', '555-3456', 'leo@example.com'),
(15, 'Mona Nichols', '1212 Hickory St', '555-4567', 'mona@example.com'),
(16, 'Nina Owens', '1313 Sycamore St', '555-5678', 'nina@example.com'),
(17, 'Oscar Perez', '1414 Willow St', '555-6789', 'oscar@example.com'),
(18, 'Pam Quinn', '1515 Redwood St', '555-7890', 'pam@example.com'),
(19, 'Quincy Roberts', '1616 Pine St', '555-8901', 'quincy@example.com'),
(20, 'Rachel Stone', '1717 Cedar St', '555-9012', 'rachel@example.com');

INSERT INTO Store (StoreID, StoreName, Address) VALUES
(1, 'Downtown Store', '101 Main St'),
(2, 'Mall Store', '202 Mall Rd'),
(3, 'Suburban Store', '303 Suburb Ave'),
(4, 'East Side Store', '404 East St'),
(5, 'West Side Store', '505 West St'),
(6, 'North Side Store', '606 North St'),
(7, 'South Side Store', '707 South St')

INSERT INTO Employee (EmployeeID, EmployeeName, Address, PhoneNumber, Position, StoreID, Status) VALUES
(1, 'Emily Brown', '321 Maple St', '555-4321', 'Sales Associate', 1, 'Active'),
(2, 'Michael Green', '654 Spruce St', '555-6543', 'Store Manager', 2, 'Active'),
(3, 'Sarah Blue', '987 Cedar St', '555-9876', 'Sales Associate', 3, 'Active'),
(4, 'Tom White', '111 Birch St', '555-2345', 'Sales Associate', 4, 'Active'),
(5, 'Anna Black', '222 Walnut St', '555-3456', 'Store Manager', 5, 'Active'),
(6, 'David Yellow', '333 Poplar St', '555-4567', 'Sales Associate', 6, 'Active'),
(7, 'Jessica Purple', '444 Chestnut St', '555-5678', 'Sales Associate', 7, 'Active'),
(8, 'Daniel Orange', '555 Beech St', '555-6789', 'Store Manager', 6, 'Active'),
(9, 'Megan Pink', '666 Ash St', '555-7890', 'Sales Associate', 1, 'Active'),
(10, 'Chris Grey', '777 Fir St', '555-8901', 'Sales Associate', 7, 'Active'),
(11, 'Kate Violet', '888 Cypress St', '555-9012', 'Store Manager', 1, 'Active'),
(12, 'James Red', '999 Hickory St', '555-0123', 'Sales Associate', 2, 'Active'),
(13, 'Samantha Brown', '1010 Sycamore St', '555-1234', 'Sales Associate', 3, 'Active'),
(14, 'Joshua Green', '1111 Willow St', '555-2345', 'Sales Associate', 4, 'Active'),
(15, 'Olivia Blue', '1212 Redwood St', '555-3456', 'Sales Associate', 5, 'Active'),
(16, 'Liam White', '1313 Pine St', '555-4567', 'Sales Associate', 6, 'Active'),
(17, 'Sophia Black', '1414 Cedar St', '555-5678', 'Store Manager', 7, 'Active'),
(18, 'Benjamin Yellow', '1515 Maple St', '555-6789', 'Store Manager', 3, 'Active'),
(19, 'Isabella Purple', '1616 Spruce St', '555-7890', 'Sales Associate', 5, 'Active'),
(20, 'Ethan Orange', '1717 Birch St', '555-8901', 'Store Manager', 4, 'Active')

INSERT INTO Account (AccountID, Username, Password, DateofBirth, Age, Gender, Role, Status, EmployeeID, CustomerID) VALUES 
(1, 'admin', 'admin', '1980-01-01', 44, 'Male', 'Admin', 'Active', NULL, NULL), 
(2, 'ebrown', 'password123', '1985-02-15', 39, 'Male', 'Sales Associate', 'Active', 1, NULL), 
(3, 'mgreen', 'password123', '1978-03-20', 46, 'Female', 'Store Manager', 'Active', 2, NULL), 
(4, 'sblue', 'password123', '1990-04-25', 34, 'Male', 'Sales Associate', 'Active', 3, NULL), 
(5, 'twhite', 'password123', '1983-05-30', 41, 'Female', 'Sales Associate', 'Active', 4, NULL), 
(6, 'ablack', 'password123', '1975-06-10', 49, 'Male', 'Store Manager', 'Active', 5, NULL), 
(7, 'dyellow', 'password123', '1988-07-15', 36, 'Female', 'Sales Associate', 'Active', 6, NULL), 
(8, 'jpurple', 'password123', '1992-08-20', 32, 'Male', 'Sales Associate', 'Active', 7, NULL), 
(9, 'dorange', 'password123', '1981-09-25', 43, 'Female', 'Store Manager', 'Active', 8, NULL), 
(10, 'mpink', 'password123', '1995-10-30', 29, 'Male', 'Sales Associate', 'Active', 9, NULL), 
(11, 'cgrey', 'password123', '1984-11-10', 40, 'Female', 'Sales Associate', 'Active', 10, NULL), 
(12, 'kviolet', 'password123', '1979-12-05', 45, 'Male', 'Store Manager', 'Active', 11, NULL), 
(13, 'jred', 'password123', '1990-01-15', 34, 'Female', 'Sales Associate', 'Active', 12, NULL), 
(14, 'sbrown', 'password123', '1982-02-10', 42, 'Male', 'Sales Associate', 'Active', 13, NULL), 
(15, 'jgreen', 'password123', '1976-03-25', 48, 'Female', 'Store Manager', 'Active', 14, NULL), 
(16, 'oblue', 'password123', '1993-04-14', 31, 'Male', 'Sales Associate', 'Active', 15, NULL), 
(17, 'lwhite', 'password123', '1986-05-22', 38, 'Female', 'Sales Associate', 'Active', 16, NULL), 
(18, 'sblack', 'password123', '1977-06-18', 47, 'Male', 'Store Manager', 'Active', 17, NULL), 
(19, 'byellow', 'password123', '1989-07-07', 35, 'Female', 'Sales Associate', 'Active', 18, NULL), 
(20, 'ipurple', 'password123', '1991-08-19', 33, 'Male', 'Sales Associate', 'Active', 19, NULL), 
(21, 'eorange', 'password123', '1980-09-11', 44, 'Female', 'Store Manager', 'Active', 20, NULL), 
(22, 'johndoe', 'customerpass', '1980-05-15', 44, 'Male', 'Customer', 'Active', NULL, 1), 
(23, 'janesmith', 'customerpass', '1985-07-20', 38, 'Female', 'Customer', 'Active', NULL, 2), 
(24, 'alicejohnson', 'customerpass', '1990-11-30', 33, 'Female', 'Customer', 'Active', NULL, 3), 
(25, 'bobbrown', 'customerpass', '1975-03-25', 49, 'Male', 'Customer', 'Active', NULL, 4), 
(26, 'charliedavis', 'customerpass', '1988-09-10', 35, 'Male', 'Customer', 'Active', NULL, 5), 
(27, 'danaevans', 'customerpass', '1992-12-05', 31, 'Female', 'Customer', 'Active', NULL, 6), 
(28, 'evefoster', 'customerpass', '1995-04-22', 29, 'Female', 'Customer', 'Active', NULL, 7), 
(29, 'frankgreen', 'customerpass', '1978-08-13', 45, 'Male', 'Customer', 'Active', NULL, 8), 
(30, 'graceharris', 'customerpass', '1999-02-14', 25, 'Female', 'Customer', 'Active', NULL, 9), 
(31, 'hankirwin', 'customerpass', '1983-06-28', 41, 'Male', 'Customer', 'Active', NULL, 10);


INSERT INTO Inventory (InventoryID, InventoryName, Address, StoreID) VALUES
(1, 'Main Warehouse', '111 Warehouse St', 1),
(2, 'Mall Warehouse', '222 Warehouse Rd', 2),
(3, 'Suburban Warehouse', '333 Warehouse Ave', 3),
(4, 'East Side Warehouse', '444 East Warehouse St', 4),
(5, 'West Side Warehouse', '555 West Warehouse Rd', 5),
(6, 'North Side Warehouse', '666 North Warehouse Ave', 6),
(7, 'South Side Warehouse', '777 South Warehouse St', 7)

INSERT INTO InventoryProduct (InventoryID, ProductID, Quantity) VALUES
(1, 1, 50),
(1, 2, 100),
(1, 3, 70),
(1, 4, 90),
(1, 5, 60),
(1, 6, 55),
(1, 7, 85),
(1, 8, 65),
(1, 9, 80),
(1, 10, 45),
(2, 11, 40),
(2, 12, 50),
(2, 13, 30),
(2, 14, 35),
(2, 15, 25),
(2, 16, 20),
(2, 17, 25),
(2, 18, 40),
(2, 19, 30),
(2, 20, 35),
(3, 21, 50),
(3, 22, 40),
(3, 23, 30),
(3, 24, 35),
(3, 25, 50),
(3, 26, 45),
(3, 27, 40),
(3, 28, 25),
(3, 29, 20),
(3, 30, 35),
(4, 31, 100),
(4, 32, 60),
(4, 33, 80),
(4, 34, 70),
(4, 35, 90),
(4, 36, 50),
(4, 37, 55),
(4, 38, 65),
(4, 39, 60),
(4, 40, 40),
(5, 41, 80),
(5, 42, 70),
(5, 43, 60),
(5, 44, 50),
(5, 45, 90),
(5, 46, 80),
(5, 47, 60),
(5, 48, 100),
(5, 49, 40),
(5, 50, 70),
(6, 51, 50),
(6, 52, 60),
(6, 53, 40),
(6, 54, 35),
(6, 55, 30),
(6, 56, 50),
(6, 57, 45),
(6, 58, 55),
(6, 59, 25),
(6, 60, 20),
(7, 61, 60),
(7, 62, 70),
(7, 63, 50),
(7, 64, 80),
(7, 65, 40),
(7, 66, 70),
(7, 67, 60),
(7, 68, 50),
(7, 69, 65),
(7, 70, 55)

INSERT INTO Orders (OrderID, OrderDate, OrderStatus, TotalAmount, CustomerID, EmployeeID) VALUES
(1, '2023-05-01', 'Completed', 300.00, 1, 1),
(2, '2023-05-02', 'Processing', 180.00, 2, 2),
(3, '2023-05-03', 'Cancelled', 120.00, 3, 3),
(4, '2023-05-04', 'Completed', 250.00, 4, 4),
(5, '2023-05-05', 'Processing', 200.00, 5, 5),
(6, '2023-05-06', 'Completed', 150.00, 6, 6),
(7, '2023-05-07', 'Cancelled', 220.00, 7, 7),
(8, '2023-05-08', 'Completed', 300.00, 8, 8),
(9, '2023-05-09', 'Processing', 180.00, 9, 9),
(10, '2023-05-10', 'Cancelled', 120.00, 10, 10),
(11, '2023-05-11', 'Completed', 250.00, 11, 11),
(12, '2023-05-12', 'Processing', 200.00, 12, 12),
(13, '2023-05-13', 'Completed', 150.00, 13, 13),
(14, '2023-05-14', 'Cancelled', 220.00, 14, 14),
(15, '2023-05-15', 'Completed', 300.00, 15, 15),
(16, '2023-05-16', 'Processing', 180.00, 16, 16),
(17, '2023-05-17', 'Cancelled', 120.00, 17, 17),
(18, '2023-05-18', 'Completed', 250.00, 18, 18),
(19, '2023-05-19', 'Processing', 200.00, 19, 19),
(20, '2023-05-20', 'Completed', 150.00, 20, 20)

INSERT INTO OrderProduct (OrderID, ProductID, Quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 2),
(2, 4, 1),
(3, 5, 2),
(3, 6, 1),
(4, 7, 2),
(4, 8, 1),
(5, 9, 2),
(5, 10, 1),
(6, 11, 2),
(6, 12, 1),
(7, 13, 2),
(7, 14, 1),
(8, 15, 2),
(8, 16, 1),
(9, 17, 2),
(9, 18, 1),
(10, 19, 2),
(10, 20, 1),
(11, 1, 2),
(11, 2, 1),
(12, 3, 2),
(12, 4, 1),
(13, 5, 2),
(13, 6, 1),
(14, 7, 2),
(14, 8, 1),
(15, 9, 2),
(15, 10, 1),
(16, 11, 2),
(16, 12, 1),
(17, 13, 2),
(17, 14, 1),
(18, 15, 2),
(18, 16, 1),
(19, 17, 2),
(19, 18, 1),
(20, 19, 2),
(20, 20, 1)

INSERT INTO Bill (BillID, OrderID, PaymentDate, PaymentMethod, TotalAmount) VALUES
(1, 1, '2023-05-01', 'Credit Card', 300.00),
(2, 2, '2023-05-02', 'Cash', 180.00),
(3, 3, '2023-05-03', 'Credit Card', 120.00),
(4, 4, '2023-05-04', 'Cash', 250.00),
(5, 5, '2023-05-05', 'Credit Card', 200.00),
(6, 6, '2023-05-06', 'Cash', 150.00),
(7, 7, '2023-05-07', 'Credit Card', 220.00),
(8, 8, '2023-05-08', 'Cash', 300.00),
(9, 9, '2023-05-09', 'Credit Card', 180.00),
(10, 10, '2023-05-10', 'Cash', 120.00),
(11, 11, '2023-05-11', 'Credit Card', 250.00),
(12, 12, '2023-05-12', 'Cash', 200.00),
(13, 13, '2023-05-13', 'Credit Card', 150.00),
(14, 14, '2023-05-14', 'Cash', 220.00),
(15, 15, '2023-05-15', 'Credit Card', 300.00),
(16, 16, '2023-05-16', 'Cash', 180.00),
(17, 17, '2023-05-17', 'Credit Card', 120.00),
(18, 18, '2023-05-18', 'Cash', 250.00),
(19, 19, '2023-05-19', 'Credit Card', 200.00),
(20, 20, '2023-05-20', 'Cash', 150.00);

INSERT INTO Feedback (FeedbackID, CustomerID, ProductID, Content, Rating) VALUES
(1, 1, 1, 'Great sneakers, very comfortable!', 5),
(2, 2, 2, 'High quality and stylish!', 4),
(3, 3, 3, 'A bit expensive but worth it.', 4),
(4, 4, 4, 'Good sandals, very comfortable.', 4),
(5, 5, 5, 'Elegant and fits well.', 5),
(6, 6, 6, 'Love the retro style!', 5),
(7, 7, 7, 'Very warm and cozy.', 5),
(8, 8, 8, 'Perfect for the beach.', 5),
(9, 9, 9, 'Classic sneakers, always reliable.', 4),
(10, 10, 10, 'Great support for running.', 5),
(11, 11, 11, 'Stylish and durable.', 4),
(12, 12, 12, 'Great for skating.', 4),
(13, 13, 13, 'Very comfortable for running.', 5),
(14, 14, 14, 'Love the style and fit.', 5),
(15, 15, 15, 'Very durable and stylish.', 4),
(16, 16, 16, 'Comfortable for long walks.', 5),
(17, 17, 17, 'Great for dressy occasions.', 5),
(18, 18, 18, 'Perfect for walking.', 4),
(19, 19, 19, 'High quality and durable.', 5),
(20, 20, 20, 'Comfortable and stylish.', 4);

INSERT INTO Report (ReportID, ReportType, TimePeriod, ReportContent, StoreID, EmployeeID) VALUES
(1, 'Sales', '2023-05-01', 'Monthly sales report', 1, 1),
(2, 'Inventory', '2023-05-02', 'Monthly inventory report', 2, 2),
(3, 'Sales', '2023-05-03', 'Monthly sales report', 3, 3),
(4, 'Inventory', '2023-05-04', 'Monthly inventory report', 4, 4),
(5, 'Sales', '2023-05-05', 'Monthly sales report', 5, 5),
(6, 'Inventory', '2023-05-06', 'Monthly inventory report', 6, 6),
(7, 'Sales', '2023-05-07', 'Monthly sales report', 7, 7)


INSERT INTO Statistic (StatisticID, StatisticType, TimePeriod, StatisticContent, ProductID, OrderID, InventoryID, CategoryID, EmployeeID, StoreID, CustomerID) VALUES
(1, 'Sales', '2023-05-01', 'Daily sales statistic', 1, 1, 1, 1, 1, 1, 1),
(2, 'Inventory', '2023-05-02', 'Daily inventory statistic', 2, 2, 2, 2, 2, 2, 2),
(3, 'Sales', '2023-05-03', 'Daily sales statistic', 3, 3, 3, 3, 3, 3, 3),
(4, 'Inventory', '2023-05-04', 'Daily inventory statistic', 4, 4, 4, 4, 4, 4, 4),
(5, 'Sales', '2023-05-05', 'Daily sales statistic', 5, 5, 5, 5, 5, 5, 5),
(6, 'Inventory', '2023-05-06', 'Daily inventory statistic', 6, 6, 6, 6, 6, 6, 6),
(7, 'Sales', '2023-05-07', 'Daily sales statistic', 7, 7, 7, 7, 7, 7, 7) 



INSERT INTO Promotion (PromotionID, PromotionName, Discount, StartDate, EndDate) VALUES
(1, 'Summer Sale', 10.00, '2023-06-01', '2023-06-30'),
(2, 'Back to School', 15.00, '2023-08-01', '2023-08-31'),
(3, 'Black Friday', 20.00, '2023-11-24', '2023-11-24'),
(4, 'Cyber Monday', 25.00, '2023-11-27', '2023-11-27'),
(5, 'Christmas Sale', 30.00, '2023-12-20', '2023-12-25'),
(6, 'New Year Sale', 10.00, '2024-01-01', '2024-01-07'),
(7, 'Valentine Sale', 15.00, '2024-02-14', '2024-02-14'),
(8, 'Spring Sale', 20.00, '2024-03-01', '2024-03-31'),
(9, 'Easter Sale', 25.00, '2024-04-01', '2024-04-15'),
(10, 'Memorial Day Sale', 30.00, '2024-05-27', '2024-05-27'),
(11, 'Independence Day Sale', 10.00, '2024-07-04', '2024-07-04'),
(12, 'Labor Day Sale', 15.00, '2024-09-02', '2024-09-02'),
(13, 'Halloween Sale', 20.00, '2024-10-31', '2024-10-31'),
(14, 'Veterans Day Sale', 25.00, '2024-11-11', '2024-11-11'),
(15, 'Thanksgiving Sale', 30.00, '2024-11-28', '2024-11-28'),
(16, 'Winter Sale', 10.00, '2024-12-01', '2024-12-31'),
(17, 'Presidents Day Sale', 15.00, '2024-02-19', '2024-02-19'),
(18, 'St. Patricks Day Sale', 20.00, '2024-03-17', '2024-03-17'),
(19, 'Earth Day Sale', 25.00, '2024-04-22', '2024-04-22'),
(20, 'Mothers Day Sale', 30.00, '2024-05-12', '2024-05-12');

INSERT INTO ProductPromotion (ProductID, PromotionID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 2),
(22, 3),
(23, 4),
(24, 5),
(25, 6),
(26, 7),
(27, 8),
(28, 9),
(29, 10),
(30, 11),
(31, 12),
(32, 13),
(33, 14),
(34, 15),
(35, 16),
(36, 17),
(37, 18),
(38, 19),
(39, 20),
(40, 1);


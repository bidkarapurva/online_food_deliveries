CREATE database FOOD_DELIVERIES;
USE FOOD_DELIVERIES;
CREATE TABLE Customers (
  CustomerID INT PRIMARY KEY,
  Name VARCHAR(100),
  Email VARCHAR(100) UNIQUE,
  Phone VARCHAR(15),
  Address VARCHAR(255),
  RegistrationDate DATE
);

CREATE TABLE Restaurants (
  RestaurantID INT PRIMARY KEY,
  Name VARCHAR(100),
  Address VARCHAR(255),
  Phone VARCHAR(15),
  Rating DECIMAL(2,1)
);

CREATE TABLE MenuItems (
  ItemID INT PRIMARY KEY,
  RestaurantID INT,
  Name VARCHAR(100),
  Description TEXT,
  Price DECIMAL(6,2),
  Category VARCHAR(50),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE Orders (
  OrderID INT PRIMARY KEY,
  CustomerID INT,
  RestaurantID INT,
  OrderDate DATETIME,
  Status VARCHAR(50), -- e.g. 'Pending', 'Preparing', 'Delivering', 'Completed'
  TotalAmount DECIMAL(8,2),
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);

CREATE TABLE OrderItems (
  OrderItemID INT PRIMARY KEY,
  OrderID INT,
  ItemID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (ItemID) REFERENCES MenuItems(ItemID)
);

CREATE TABLE DeliveryPersons (
  DeliveryPersonID INT PRIMARY KEY,
  Name VARCHAR(100),
  Phone VARCHAR(15),
  VehicleDetails VARCHAR(100)
);

CREATE TABLE Deliveries (
  DeliveryID INT PRIMARY KEY,
  OrderID INT,
  DeliveryPersonID INT,
  DeliveryTime DATETIME,
  FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
  FOREIGN KEY (DeliveryPersonID) REFERENCES DeliveryPersons(DeliveryPersonID)
);

CREATE TABLE Reviews (
  ReviewID INT PRIMARY KEY,
  CustomerID INT,
  RestaurantID INT,
  Rating INT CHECK (Rating BETWEEN 1 AND 5),
  Comment TEXT,
  ReviewDate DATE,
  FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
  FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID)
);
INSERT INTO Customers VALUES
(1, 'Akash Verma', 'akash1@example.com', '9000000001', '12 MG Road, Delhi', '2025-10-01'),
(2, 'Priya Singh', 'priya2@example.com', '9000000002', '24 Park Lane, Mumbai', '2025-10-02'),
(3, 'Rahul Khanna', 'rahul3@example.com', '9000000003', '56 GT Road, Kolkata', '2025-10-03'),
(4, 'Sneha Patil', 'sneha4@example.com', '9000000004', '18 Fraser Town, Bangalore', '2025-10-04'),
(5, 'Vivek Sethi', 'vivek5@example.com', '9000000005', '27 MG Road, Hyderabad', '2025-10-05'),
(6, 'Kavita Desai', 'kavita6@example.com', '9000000006', '2 Anna Salai, Chennai', '2025-10-06'),
(7, 'Alok Jaiswal', 'alok7@example.com', '9000000007', '45 Peter Road, Pune', '2025-10-07'),
(8, 'Garima Sharma', 'garima8@example.com', '9000000008', '19 Sector 21, Chandigarh', '2025-10-08'),
(9, 'Rohan Gupta', 'rohan9@example.com', '9000000009', '77 FC Road, Pune', '2025-10-09'),
(10, 'Deepa Iyer', 'deepa10@example.com', '9000000010', '33 Jubilee Hills, Hyderabad', '2025-10-10'),
(11, 'Manoj Mehta', 'manoj11@example.com', '9000000011', '53 Palace Road, Bangalore', '2025-10-11'),
(12, 'Nisha Lal', 'nisha12@example.com', '9000000012', '22 Eliot Lane, Delhi', '2025-10-12'),
(13, 'Suresh Nair', 'suresh13@example.com', '9000000013', '85 North Street, Chennai', '2025-10-13'),
(14, 'Divya Kumar', 'divya14@example.com', '9000000014', '36 Salt Lake, Kolkata', '2025-10-14'),
(15, 'Amit Tyagi', 'amit15@example.com', '9000000015', '101 Hill Road, Mumbai', '2025-10-15'),
(16, 'Priyanka Jain', 'priyanka16@example.com', '9000000016', '29 MG Road, Pune', '2025-10-16'),
(17, 'Arjun Singh', 'arjun17@example.com', '9000000017', '77 Brigade Road, Bangalore', '2025-10-17'),
(18, 'Shweta Kapoor', 'shweta18@example.com', '9000000018', '67 Banjara Hills, Hyderabad', '2025-10-18'),
(19, 'Ravi Deshmukh', 'ravi19@example.com', '9000000019', '36 Koregaon Park, Pune', '2025-10-19'),
(20, 'Ishita Das', 'ishita20@example.com', '9000000020', '22 Kalighat, Kolkata', '2025-10-20'),
(21, 'Neha Mishra', 'neha21@example.com', '9000000021', '14 Gariahat, Kolkata', '2025-10-21'),
(22, 'Ritesh Sharma', 'ritesh22@example.com', '9000000022', '19 Aundh, Pune', '2025-10-22'),
(23, 'Tanya Agarwal', 'tanya23@example.com', '9000000023', '10 Jubilee Hills, Hyderabad', '2025-10-23'),
(24, 'Gagan Chawla', 'gagan24@example.com', '9000000024', '28 Alwarpet, Chennai', '2025-10-24'),
(25, 'Meena Pillai', 'meena25@example.com', '9000000025', '16 Juhu, Mumbai', '2025-10-25'),
(26, 'Rajesh Menon', 'rajesh26@example.com', '9000000026', '52 Powai, Mumbai', '2025-10-26'),
(27, 'Snehal Joshi', 'snehal27@example.com', '9000000027', '14 MG Road, Bangalore', '2025-10-27'),
(28, 'Mohit Arora', 'mohit28@example.com', '9000000028', '13 Saket, Delhi', '2025-10-28'),
(29, 'Riya Sinha', 'riya29@example.com', '9000000029', '19 Panvel, Mumbai', '2025-10-29'),
(30, 'Jatin Mittal', 'jatin30@example.com', '9000000030', '48 Jubilee Hills, Hyderabad', '2025-10-30'),
(31, 'Rachna Saxena', 'rachna31@example.com', '9000000031', '112 Colaba, Mumbai', '2025-11-01'),
(32, 'Yash Gupta', 'yash32@example.com', '9000000032', '33 Kothrud, Pune', '2025-11-02'),
(33, 'Simran Puri', 'simran33@example.com', '9000000033', '45 GT Road, Delhi', '2025-11-03'),
(34, 'Siddharth Patil', 'siddharth34@example.com', '9000000034', '26 CMH Road, Bangalore', '2025-11-04'),
(35, 'Pooja Anand', 'pooja35@example.com', '9000000035', '88 Brigade Road, Bangalore', '2025-11-05'),
(36, 'Madhav Pandey', 'madhav36@example.com', '9000000036', '17 Kirti Nagar, Delhi', '2025-11-06'),
(37, 'Lakshmi Narayan', 'lakshmi37@example.com', '9000000037', '75 Abids, Hyderabad', '2025-11-07'),
(38, 'Tanvi Kapoor', 'tanvi38@example.com', '9000000038', '50 Adyar, Chennai', '2025-11-08'),
(39, 'Harshita Mehra', 'harshita39@example.com', '9000000039', '91 Salt Lake, Kolkata', '2025-11-09'),
(40, 'Aabha Rai', 'aabha40@example.com', '9000000040', '37 Baner, Pune', '2025-11-10'),
(41, 'Sara Seth', 'sara41@example.com', '9000000041', '29 MG Road, Bangalore', '2025-11-11'),
(42, 'Dhruv Nanda', 'dhruv42@example.com', '9000000042', '65 Nungambakkam, Chennai', '2025-11-12'),
(43, 'Arnav Yadav', 'arnav43@example.com', '9000000043', '63 Andheri West, Mumbai', '2025-11-13'),
(44, 'Mitali Agarwal', 'mitali44@example.com', '9000000044', '45 Alipore, Kolkata', '2025-11-14'),
(45, 'Sunny Bhatt', 'sunny45@example.com', '9000000045', '6 Park Street, Kolkata', '2025-11-15'),
(46, 'Rekha Raj', 'rekha46@example.com', '9000000046', '40 BTM Layout, Bangalore', '2025-11-16'),
(47, 'Parag Shah', 'parag47@example.com', '9000000047', '20 HBR Layout, Bangalore', '2025-11-17'),
(48, 'Tarun Lamba', 'tarun48@example.com', '9000000048', '34 Jubilee Hills, Hyderabad', '2025-11-18'),
(49, 'Nandini Tiwari', 'nandini49@example.com', '9000000049', '12 Sion, Mumbai', '2025-11-19'),
(50, 'Soham Kulkarni', 'soham50@example.com', '9000000050', '83 Banashankari, Bangalore', '2025-11-20');
INSERT INTO Restaurants VALUES
(1, 'The Spice House', '99 Connaught Place, Delhi', '9810001001', 4.5),
(2, 'Taste of Mumbai', '77 Marine Drive, Mumbai', '9810001002', 4.2),
(3, 'Noodle Junction', '45 Sector 18, Noida', '9810001003', 4.3),
(4, 'Chennai Delights', '12 Anna Salai, Chennai', '9810001004', 4.4),
(5, 'Hyderabad Curries', '56 Jubilee Hills, Hyderabad', '9810001005', 4.1),
(6, 'Punjabi Zaika', '18 Model Town, Ludhiana', '9810001006', 4.0),
(7, 'Kolkata Bistro', '203 Park Street, Kolkata', '9810001007', 4.2),
(8, 'Bangalore Bites', '21 MG Road, Bangalore', '9810001008', 4.6),
(9, 'Pizza Galaxy', '39 Banjara Hills, Hyderabad', '9810001009', 4.4),
(10, 'Dilli Karahi', '61 Karol Bagh, Delhi', '9810001010', 4.3),
(11, 'Coastal Flavours', '13 Queens Road, Kochi', '9810001011', 4.5),
(12, 'Rajasthan Rasoi', '74 MI Road, Jaipur', '9810001012', 4.0),
(13, 'Goan Seafood', '22 Miramar Beach, Goa', '9810001013', 4.2),
(14, 'Sardar Dhaba', '4 GT Road, Amritsar', '9810001014', 4.1),
(15, 'Lucknow Kebab House', '31 Hazratganj, Lucknow', '9810001015', 4.6),
(16, 'Surti Thali', '44 Ring Road, Surat', '9810001016', 4.3),
(17, 'Bhopal Biryani', '73 Hamidia Road, Bhopal', '9810001017', 4.2),
(18, 'Jaipur Tadka', '90 Pink City Road, Jaipur', '9810001018', 4.2),
(19, 'Patna Treat', '66 Boring Road, Patna', '9810001019', 4.1),
(20, 'Nagpur Spice', '23 Sitabuldi, Nagpur', '9810001020', 4.0),
(21, 'Ahmedabad Eats', '8 SG Highway, Ahmedabad', '9810001021', 4.4),
(22, 'Indore Swaad', '11 MG Road, Indore', '9810001022', 4.3),
(23, 'Kanpur Chaat', '87 Mall Road, Kanpur', '9810001023', 4.2),
(24, 'Vijayawada Meals', '16 Benz Circle, Vijayawada', '9810001024', 4.1),
(25, 'Mysore Masala', '14 Nazarbad, Mysore', '9810001025', 4.4),
(26, 'Agra Treats', '99 Taj Road, Agra', '9810001026', 4.2),
(27, 'Haridwar Veggie', '55 Railway Road, Haridwar', '9810001027', 4.3),
(28, 'Shillong Cafeteria', '69 Police Bazar, Shillong', '9810001028', 4.1),
(29, 'Patiala Grill', '20 Model Town, Patiala', '9810001029', 4.2),
(30, 'Shimla Heights', '101 Mall Road, Shimla', '9810001030', 4.0),
(31, 'Dehradun Dine', '46 Rajpur Road, Dehradun', '9810001031', 4.2),
(32, 'Amravati Kitchen', '77 Irwin Square, Amravati', '9810001032', 4.1),
(33, 'Bareilly Bawarchi', '54 Civil Lines, Bareilly', '9810001033', 4.3),
(34, 'Guwahati Feast', '78 MG Road, Guwahati', '9810001034', 4.2),
(35, 'Madurai Mess', '85 Tallakulam, Madurai', '9810001035', 4.3)
;

INSERT INTO MenuItems VALUES
(1, 1, 'Paneer Butter Masala', 'Rich paneer curry', 299.00, 'Main Course'),
(2, 1, 'Garlic Naan', 'Soft naan with garlic', 49.00, 'Bread'),
(3, 1, 'Kesar Kulfi', 'Traditional dessert', 80.00, 'Dessert'),

(4, 2, 'Chicken Biryani', 'Authentic biryani', 349.00, 'Main Course'),
(5, 2, 'Mumbai Vada Pav', 'Classic street food', 39.00, 'Snacks'),
(6, 2, 'Pista Falooda', 'Cold dessert', 90.00, 'Dessert'),

(7, 3, 'Veg Hakka Noodles', 'Spicy wok tossed noodles', 160.00, 'Main Course'),
(8, 3, 'Spring Roll', 'Crispy vegetable roll', 70.00, 'Snacks'),
(9, 3, 'Caramel Custard', 'Silky caramel dessert', 75.00, 'Dessert'),

(10, 4, 'Chettinad Chicken', 'Spicy South Indian chicken', 280.00, 'Main Course'),
(11, 4, 'Neer Dosa', 'Soft rice pancake', 88.00, 'Bread'),
(12, 4, 'Payasam', 'Sweet milk pudding', 62.00, 'Dessert'),

(13, 5, 'Hyderabadi Mutton', 'Traditional mutton curry', 340.00, 'Main Course'),
(14, 5, 'Rumali Roti', 'Thin roti', 42.00, 'Bread'),
(15, 5, 'Qubani ka Meetha', 'Apricot dessert', 95.00, 'Dessert'),

(16, 6, 'Dal Makhani', 'Rich black lentil curry', 210.00, 'Main Course'),
(17, 6, 'Missi Roti', 'Spicy wheat roti', 38.00, 'Bread'),
(18, 6, 'Gajar Halwa', 'Carrot pudding', 60.00, 'Dessert'),

(19, 7, 'Fish Curry', 'Bengali fish curry', 299.00, 'Main Course'),
(20, 7, 'Mughlai Paratha', 'Paratha with egg & meat', 70.00, 'Bread'),
(21, 7, 'Rasgulla', 'Spongy sweet', 50.00, 'Dessert'),

(22, 8, 'Masala Dosa', 'Stuffed rice crepe', 120.00, 'Main Course'),
(23, 8, 'Rava Idli', 'Steamed semolina cake', 45.00, 'Bread'),
(24, 8, 'Mysore Pak', 'Gram flour sweet', 65.00, 'Dessert'),

(25, 9, 'Mexican Pizza', 'Spicy pizza with vegetables', 240.00, 'Main Course'),
(26, 9, 'Cheese Garlic Bread', 'Baked bread with cheese', 60.00, 'Bread'),
(27, 9, 'Chocolate Lava Cake', 'Molten chocolate dessert', 120.00, 'Dessert'),

(28, 10, 'Butter Chicken', 'Creamy chicken curry', 315.00, 'Main Course'),
(29, 10, 'Laccha Paratha', 'Multi-layered bread', 55.00, 'Bread'),
(30, 10, 'Gulab Jamun', 'Milk solid sweet', 40.00, 'Dessert'),

(31, 11, 'Kerala Fish Curry', 'Spicy coconut fish', 390.00, 'Main Course'),
(32, 11, 'Appam', 'Fermented rice pancake', 48.00, 'Bread'),
(33, 11, 'Ada Pradhaman', 'Rice dessert with jaggery', 72.00, 'Dessert'),

(34, 12, 'Dal Baati Churma', 'Wheat balls with dal', 275.00, 'Main Course'),
(35, 12, 'Kachori', 'Stuffed fried bread', 28.00, 'Bread'),
(36, 12, 'Ghewar', 'Syrupy disc-shaped dessert', 82.00, 'Dessert'),

(37, 13, 'Goan Prawn Curry', 'Prawn in coconut gravy', 322.00, 'Main Course'),
(38, 13, 'Poi', 'Goan bread', 22.00, 'Bread'),
(39, 13, 'Bebinca', 'Goan layered dessert', 110.00, 'Dessert'),

(40, 14, 'Butter Paneer', 'Paneer in rich gravy', 299.00, 'Main Course'),
(41, 14, 'Makki Di Roti', 'Corn flatbread', 29.00, 'Bread'),
(42, 14, 'Kheer', 'Rice pudding', 50.00, 'Dessert'),

(43, 15, 'Galouti Kebab', 'Melt-in-mouth kebab', 185.00, 'Main Course'),
(44, 15, 'Roomali Roti', 'Thin bread', 32.00, 'Bread'),
(45, 15, 'Sheer Korma', 'Sweet vermicelli', 86.00, 'Dessert'),

(46, 16, 'Surti Undhiyu', 'Mixed vegetable stew', 220.00, 'Main Course'),
(47, 16, 'Thepla', 'Spicy Gujarati flatbread', 33.00, 'Bread'),
(48, 16, 'Mohanthaal', 'Gram flour fudge', 60.00, 'Dessert'),

(49, 17, 'Murgh Musallam', 'Whole chicken curry', 390.00, 'Main Course'),
(50, 17, 'Puri', 'Deep-fried bread', 20.00, 'Bread'),
(51, 17, 'Malpua', 'Syrupy pancake', 62.00, 'Dessert'),

(52, 18, 'Gatte ki Sabzi', 'Gram flour dumpling curry', 199.00, 'Main Course'),
(53, 18, 'Bajra Roti', 'Pearl millet bread', 26.00, 'Bread'),
(54, 18, 'Balushahi', 'Fried sweet dough', 40.00, 'Dessert'),

(55, 19, 'Litti Chokha', 'Baked wheat balls with brinjal', 145.00, 'Main Course'),
(56, 19, 'Sattu Paratha', 'Stuffed paratha', 39.00, 'Bread'),
(57, 19, 'Thekua', 'Wheat sweet cookie', 36.00, 'Dessert'),

(58, 20, 'Saoji Chicken', 'Spicy chicken gravy', 210.00, 'Main Course'),
(59, 20, 'Zunka Bhakri', 'Chickpea flour & bread', 36.00, 'Bread'),
(60, 20, 'Puran Poli', 'Sweet flatbread', 48.00, 'Dessert'),

(61, 21, 'Sev Tameta', 'Tomato & sev curry', 112.00, 'Main Course'),
(62, 21, 'Bhakri', 'Crispy bread', 22.00, 'Bread'),
(63, 21, 'Shrikhand', 'Sweet yogurt', 44.00, 'Dessert'),

(64, 22, 'Poha Jalebi', 'Flat rice with sweet', 77.00, 'Main Course'),
(65, 22, 'Khakra', 'Crispy wheat cracker', 25.00, 'Bread'),
(66, 22, 'Imarti', 'Syrupy sweet', 34.00, 'Dessert'),

(67, 23, 'Aloo Chaat', 'Spicy potato snack', 55.00, 'Main Course'),
(68, 23, 'Papdi', 'Crunchy flour disc', 12.00, 'Bread'),
(69, 23, 'Rabri', 'Thickened sweetened milk', 72.00, 'Dessert'),

(70, 24, 'Andhra Meals', 'Traditional Andhra thali', 240.00, 'Main Course'),
(71, 24, 'Garelu', 'Lentil doughnut', 18.00, 'Bread'),
(72, 24, 'Ariselu', 'Jaggery rice cake', 25.00, 'Dessert'),

(73, 25, 'Mysore Masala Dosa', 'Stuffed dosa', 142.00, 'Main Course'),
(74, 25, 'Akki Roti', 'Rice flour flatbread', 32.00, 'Bread'),
(75, 25, 'Kesari Bath', 'Semolina sweet', 35.00, 'Dessert'),

(76, 26, 'Bedmi Aloo', 'Spiced potato curry', 133.00, 'Main Course'),
(77, 26, 'Bedmi Puri', 'Stuffed bread', 24.00, 'Bread'),
(78, 26, 'Petha', 'Ash gourd sweet', 20.00, 'Dessert'),

(79, 27, 'Aloo Paratha', 'Stuffed potato bread', 70.00, 'Main Course'),
(80, 27, 'Tandoori Roti', 'Clay oven bread', 18.00, 'Bread'),
(81, 27, 'Moong Dal Halwa', 'Lentil pudding', 48.00, 'Dessert'),

(82, 28, 'Momos', 'Steamed dumplings', 90.00, 'Main Course'),
(83, 28, 'Jadoh', 'Rice with meat', 130.00, 'Bread'),
(84, 28, 'Pineapple Cake', 'Fruity dessert', 55.00, 'Dessert'),

(85, 29, 'Patiala Chicken', 'Spicy chicken curry', 230.00, 'Main Course'),
(86, 29, 'Amritsari Kulcha', 'Stuffed bread', 60.00, 'Bread'),
(87, 29, 'Phirni', 'Ground rice & milk sweet', 68.00, 'Dessert'),

(88, 30, 'Chana Madra', 'Chickpeas in yogurt gravy', 188.00, 'Main Course'),
(89, 30, 'Siddu', 'Steam stuffed bread', 33.00, 'Bread'),
(90, 30, 'Mittha', 'Himachali sweet', 37.00, 'Dessert'),

(91, 31, 'Kachori Sabzi', 'Spicy curry and kachori', 58.00, 'Main Course'),
(92, 31, 'Aloo Puri', 'Bread with potato curry', 28.00, 'Bread'),
(93, 31, 'Kala Jamun', 'Dry fruit sweet', 53.00, 'Dessert'),

(94, 32, 'Bharwan Baingan', 'Stuffed eggplant', 145.00, 'Main Course'),
(95, 32, 'Makki Roti', 'Corn flour flatbread', 22.00, 'Bread'),
(96, 32, 'Peda', 'Thick milk sweet', 36.00, 'Dessert'),

(97, 33, 'Seekh Kabab', 'Minced meat skewer', 165.00, 'Main Course'),
(98, 33, 'Tandoori Naan', 'Clay oven bread', 25.00, 'Bread'),
(99, 33, 'Motichoor Ladoo', 'Chickpea flour sweet', 34.00, 'Dessert'),

(100, 34, 'Bamboo Shoot Curry', 'Assamese curry', 132.00, 'Main Course'),
(101, 34, 'Rice Roti', 'Flatbread from rice', 16.00, 'Bread'),
(102, 34, 'Narikol Laru', 'Coconut sweet', 24.00, 'Dessert'),

(103, 35, 'Madurai Kari Dosai', 'Meat dosa', 182.00, 'Main Course'),
(104, 35, 'Kambu Roti', 'Pearl millet bread', 14.00, 'Bread'),
(105, 35, 'Jalebi', 'Crisp, coil-shaped sweet', 32.00, 'Dessert');
INSERT INTO Orders VALUES
(1, 2, 1, '2025-11-01 13:05:00', 'Completed', 378.00),
(2, 5, 2, '2025-11-01 14:12:00', 'Delivering', 410.00),
(3, 8, 3, '2025-11-01 15:21:00', 'Completed', 282.00),
(4, 10, 4, '2025-11-01 16:19:00', 'Pending', 430.00),
(5, 13, 5, '2025-11-01 16:41:00', 'Preparing', 396.00),
(6, 15, 6, '2025-11-01 17:00:00', 'Completed', 298.00),
(7, 18, 7, '2025-11-01 17:25:00', 'Completed', 199.00),
(8, 20, 8, '2025-11-01 17:49:00', 'Delivering', 230.00),
(9, 21, 9, '2025-11-01 18:30:00', 'Completed', 420.00),
(10, 23, 10, '2025-11-01 19:02:00', 'Preparing', 307.00),
(11, 25, 11, '2025-11-01 19:21:00', 'Completed', 385.00),
(12, 28, 12, '2025-11-01 19:43:00', 'Completed', 398.00),
(13, 30, 13, '2025-11-01 19:57:00', 'Pending', 294.00),
(14, 33, 14, '2025-11-01 20:12:00', 'Delivering', 214.00),
(15, 36, 15, '2025-11-01 20:27:00', 'Completed', 315.00),
(16, 37, 16, '2025-11-01 20:43:00', 'Completed', 305.00),
(17, 40, 17, '2025-11-01 21:00:00', 'Delivering', 361.00),
(18, 42, 18, '2025-11-01 21:13:00', 'Preparing', 185.00),
(19, 45, 19, '2025-11-01 21:21:00', 'Pending', 155.00),
(20, 47, 20, '2025-11-01 21:35:00', 'Completed', 208.00),
(21, 48, 21, '2025-11-01 21:58:00', 'Completed', 312.00),
(22, 50, 22, '2025-11-01 22:09:00', 'Completed', 392.00),
(23, 1, 23, '2025-11-01 22:20:00', 'Pending', 229.00),
(24, 3, 24, '2025-11-01 22:36:00', 'Preparing', 178.00),
(25, 6, 25, '2025-11-01 23:14:00', 'Completed', 367.00),
(26, 9, 26, '2025-11-02 11:02:00', 'Completed', 403.00),
(27, 12, 27, '2025-11-02 11:23:00', 'Delivering', 144.00),
(28, 16, 28, '2025-11-02 12:01:00', 'Completed', 314.00),
(29, 19, 29, '2025-11-02 12:25:00', 'Pending', 222.00),
(30, 22, 30, '2025-11-02 12:37:00', 'Preparing', 311.00),
(31, 24, 31, '2025-11-02 12:48:00', 'Completed', 247.00),
(32, 26, 32, '2025-11-02 13:10:00', 'Delivering', 370.00),
(33, 29, 33, '2025-11-02 13:21:00', 'Completed', 254.00),
(34, 32, 34, '2025-11-02 13:45:00', 'Completed', 167.00),
(35, 35, 35, '2025-11-02 14:00:00', 'Pending', 209.00);
INSERT INTO OrderItems VALUES
(1, 1, 1, 2),     -- Order 1, MenuItem 1
(2, 1, 2, 1),     -- Order 1, MenuItem 2
(3, 2, 4, 1),     -- Order 2, MenuItem 4
(4, 2, 5, 2),     -- Order 2, MenuItem 5
(5, 3, 7, 1),     -- Order 3, MenuItem 7
(6, 3, 9, 2),     -- Order 3, MenuItem 9
(7, 4, 10, 1),    -- Order 4, MenuItem 10
(8, 4, 11, 1),    -- Order 4, MenuItem 11
(9, 5, 13, 1),    -- Order 5, MenuItem 13
(10, 5, 14, 2),   -- Order 5, MenuItem 14
(11, 6, 16, 2),   -- Order 6, MenuItem 16
(12, 6, 18, 1),   -- Order 6, MenuItem 18
(13, 7, 19, 1),   -- Order 7, MenuItem 19
(14, 7, 21, 2),   -- Order 7, MenuItem 21
(15, 8, 22, 2),   -- Order 8, MenuItem 22
(16, 8, 24, 1),   -- Order 8, MenuItem 24
(17, 9, 25, 1),   -- Order 9, MenuItem 25
(18, 9, 26, 1),   -- Order 9, MenuItem 26
(19, 10, 28, 2),  -- Order 10, MenuItem 28
(20, 10, 29, 1),  -- Order 10, MenuItem 29
(21, 11, 31, 1),  -- Order 11, MenuItem 31
(22, 11, 33, 1),  -- Order 11, MenuItem 33
(23, 12, 34, 1),  -- Order 12, MenuItem 34
(24, 12, 36, 2),  -- Order 12, MenuItem 36
(25, 13, 37, 1),  -- Order 13, MenuItem 37
(26, 13, 39, 1),  -- Order 13, MenuItem 39
(27, 14, 40, 1),  -- Order 14, MenuItem 40
(28, 14, 42, 2),  -- Order 14, MenuItem 42
(29, 15, 43, 2),  -- Order 15, MenuItem 43
(30, 15, 45, 1),  -- Order 15, MenuItem 45
(31, 16, 46, 1),  -- Order 16, MenuItem 46
(32, 16, 47, 2),  -- Order 16, MenuItem 47
(33, 17, 49, 1),  -- Order 17, MenuItem 49
(34, 17, 51, 1),  -- Order 17, MenuItem 51
(35, 18, 52, 1),  -- Order 18, MenuItem 52
(36, 18, 53, 2),  -- Order 18, MenuItem 53
(37, 19, 55, 1),  -- Order 19, MenuItem 55
(38, 19, 57, 1),  -- Order 19, MenuItem 57
(39, 20, 58, 2),  -- Order 20, MenuItem 58
(40, 20, 60, 1),  -- Order 20, MenuItem 60
(41, 21, 61, 2),  -- Order 21, MenuItem 61
(42, 21, 63, 1),  -- Order 21, MenuItem 63
(43, 22, 64, 1),  -- Order 22, MenuItem 64
(44, 22, 66, 2),  -- Order 22, MenuItem 66
(45, 23, 67, 2),  -- Order 23, MenuItem 67
(46, 23, 69, 1),  -- Order 23, MenuItem 69
(47, 24, 70, 1),  -- Order 24, MenuItem 70
(48, 24, 71, 1),  -- Order 24, MenuItem 71
(49, 25, 73, 1),  -- Order 25, MenuItem 73
(50, 25, 75, 2),  -- Order 25, MenuItem 75
(51, 26, 76, 1),  -- Order 26, MenuItem 76
(52, 26, 78, 2),  -- Order 26, MenuItem 78
(53, 27, 79, 1),  -- Order 27, MenuItem 79
(54, 27, 81, 1),  -- Order 27, MenuItem 81
(55, 28, 82, 2),  -- Order 28, MenuItem 82
(56, 28, 84, 1),  -- Order 28, MenuItem 84
(57, 29, 85, 2),  -- Order 29, MenuItem 85
(58, 29, 87, 1),  -- Order 29, MenuItem 87
(59, 30, 88, 1),  -- Order 30, MenuItem 88
(60, 30, 90, 1),  -- Order 30, MenuItem 90
(61, 31, 91, 2),  -- Order 31, MenuItem 91
(62, 31, 93, 1),  -- Order 31, MenuItem 93
(63, 32, 94, 1),  -- Order 32, MenuItem 94
(64, 32, 95, 2),  -- Order 32, MenuItem 95
(65, 33, 97, 1),  -- Order 33, MenuItem 97
(66, 33, 99, 1),  -- Order 33, MenuItem 99
(67, 34, 100, 2), -- Order 34, MenuItem 100
(68, 34, 102, 1), -- Order 34, MenuItem 102
(69, 35, 103, 1), -- Order 35, MenuItem 103
(70, 35, 105, 2); -- Order 35, MenuItem 105
INSERT INTO DeliveryPersons VALUES
(1, 'Vikram Chauhan', '9001234501', 'Bike - DL09 XY1001'),
(2, 'Sneha Patil', '9001234502', 'Scooter - MH05 AB1002'),
(3, 'Anil Reddy', '9001234503', 'Bike - AP03 TY2003'),
(4, 'Ritu Singh', '9001234504', 'Scooter - UP16 GH4004'),
(5, 'Ramesh Kumar', '9001234505', 'Bike - MH12 QW5005'),
(6, 'Sheetal Shah', '9001234506', 'Scooter - GJ01 PL6006'),
(7, 'Nilesh Sinha', '9001234507', 'Bike - BR21 ZU7007'),
(8, 'Pooja Joshi', '9001234508', 'Bike - PB10 ER8008'),
(9, 'Sachin Sharma', '9001234509', 'Scooter - DL02 WK9009'),
(10, 'Deepak Yadav', '9001234510', 'Bike - RJ14 LM1010'),
(11, 'Meera Krishnan', '9001234511', 'Scooter - TN01 KL1111'),
(12, 'Arvind Nair', '9001234512', 'Bike - KL07 RS1212'),
(13, 'Shilpa Shetty', '9001234513', 'Scooter - KA05 TR1313'),
(14, 'Ajay Tiwari', '9001234514', 'Bike - CG10 PQ1414'),
(15, 'Harish Rawat', '9001234515', 'Bike - UK08 YU1515');
INSERT INTO Deliveries VALUES
(1, 1, 1, '2025-11-01 14:05:00'),
(2, 2, 2, '2025-11-01 15:10:00'),
(3, 3, 3, '2025-11-01 16:15:00'),
(4, 4, 4, '2025-11-01 17:25:00'),
(5, 5, 5, '2025-11-01 18:30:00'),
(6, 6, 6, '2025-11-01 19:35:00'),
(7, 7, 7, '2025-11-01 20:41:00'),
(8, 8, 8, '2025-11-01 21:05:00'),
(9, 9, 9, '2025-11-01 21:22:00'),
(10, 10, 10, '2025-11-01 21:31:00'),
(11, 11, 11, '2025-11-01 21:36:00'),
(12, 12, 12, '2025-11-01 22:03:00'),
(13, 13, 13, '2025-11-01 22:19:00'),
(14, 14, 14, '2025-11-01 22:33:00'),
(15, 15, 15, '2025-11-01 22:50:00'),
(16, 16, 1, '2025-11-01 23:05:00'),
(17, 17, 2, '2025-11-01 23:17:00'),
(18, 18, 3, '2025-11-01 23:28:00'),
(19, 19, 4, '2025-11-01 23:32:00'),
(20, 20, 5, '2025-11-01 23:44:00'),
(21, 21, 6, '2025-11-01 23:50:00'),
(22, 22, 7, '2025-11-01 23:59:00'),
(23, 23, 8, '2025-11-02 00:13:00'),
(24, 24, 9, '2025-11-02 00:29:00'),
(25, 25, 10, '2025-11-02 00:45:00'),
(26, 26, 11, '2025-11-02 01:00:00'),
(27, 27, 12, '2025-11-02 01:12:00'),
(28, 28, 13, '2025-11-02 01:33:00'),
(29, 29, 14, '2025-11-02 01:52:00'),
(30, 30, 15, '2025-11-02 02:05:00'),
(31, 31, 1, '2025-11-02 02:12:00'),
(32, 32, 2, '2025-11-02 02:25:00'),
(33, 33, 3, '2025-11-02 03:10:00'),
(34, 34, 4, '2025-11-02 03:22:00'),
(35, 35, 5, '2025-11-02 03:40:00');
INSERT INTO Reviews VALUES
(1, 2, 1, 5, 'Superb food and delivery!', '2025-11-01'),
(2, 5, 2, 4, 'Tasty and fresh, will order again.', '2025-11-01'),
(3, 8, 3, 5, 'Everything was perfect.', '2025-11-01'),
(4, 10, 4, 3, 'Good, but delivery was late.', '2025-11-01'),
(5, 13, 5, 5, 'Excellent taste.', '2025-11-01'),
(6, 15, 6, 4, 'Nice and authentic.', '2025-11-01'),
(7, 18, 7, 4, 'Liked the food variety.', '2025-11-01'),
(8, 20, 8, 5, 'Best dosas in town!', '2025-11-01'),
(9, 21, 9, 5, 'Pizza was super cheesy.', '2025-11-01'),
(10, 23, 10, 3, 'Chicken could be juicier.', '2025-11-01'),
(11, 25, 11, 5, 'Seafood was fresh.', '2025-11-01'),
(12, 28, 12, 4, 'Very good, thanks!', '2025-11-01'),
(13, 30, 13, 5, 'Tasty, friendly service.', '2025-11-01'),
(14, 33, 14, 4, 'Loved the Punjabi food.', '2025-11-01'),
(15, 36, 15, 4, 'Kebabs were awesome.', '2025-11-01'),
(16, 37, 16, 5, 'Unique dishes, well made.', '2025-11-01'),
(17, 40, 17, 3, 'Good, but could be hotter.', '2025-11-01'),
(18, 42, 18, 4, 'Fast and friendly delivery.', '2025-11-01'),
(19, 45, 19, 5, 'Really nice regional food.', '2025-11-01'),
(20, 47, 20, 4, 'Loved the flavor!', '2025-11-01'),
(21, 48, 21, 5, 'Great food and clean packaging.', '2025-11-01'),
(22, 50, 22, 4, 'Lots of options, liked it.', '2025-11-01'),
(23, 1, 23, 3, 'Chaat was okay.', '2025-11-01'),
(24, 3, 24, 4, 'Nice experience overall.', '2025-11-01'),
(25, 6, 25, 5, 'Dosa and idli were soft!', '2025-11-01'),
(26, 9, 26, 4, 'Loved the sweets.', '2025-11-02'),
(27, 12, 27, 5, 'Tasty snacks, fast delivery.', '2025-11-02'),
(28, 16, 28, 4, 'Nice and spicy!', '2025-11-02'),
(29, 19, 29, 5, 'Chicken of Patiala is best.', '2025-11-02'),
(30, 22, 30, 3, 'Good but pricey.', '2025-11-02'),
(31, 24, 31, 5, 'Traditional food vibes.', '2025-11-02'),
(32, 26, 32, 4, 'Loved the sweet dishes.', '2025-11-02'),
(33, 29, 33, 4, 'Service and food was great.', '2025-11-02'),
(34, 32, 34, 3, 'Dessert was average.', '2025-11-02'),
(35, 35, 35, 5, 'Absolutely delicious!', '2025-11-02');


## 1. LIST ALL CUSTOMERS ##

SELECT * FROM Customers;

## 2. Show all menu items for a given restaurant (e.g., RestaurantID = 5) ##

SELECT * FROM MenuItems WHERE RestaurantID = 5;

## 3. Find the details of orders placed by a specific customer (CustomerID = 10)

SELECT * FROM Orders WHERE CustomerID = 10;


## 4. Find the total number of orders placed ##

SELECT COUNT(*) AS TotalOrders FROM Orders;

## 5. Show the minimum, maximum, and average order total price ##

SELECT MIN(TotalAmount) AS MinOrder, MAX(TotalAmount) AS MaxOrder, AVG(TotalAmount) AS AvgOrder FROM Orders;


## 6. Total quantity of each menu item ever ordered ##

SELECT ItemID, SUM(Quantity)
FROM OrderItems
GROUP BY ItemID;

## 7. Show the average review score per restaurant ##

SELECT RestaurantID, AVG(Rating) 
FROM Reviews
GROUP BY RestaurantID;

## 8. List all delivery persons who have completed at least one delivery ##

SELECT DISTINCT dp.* 
FROM DeliveryPersons dp
JOIN Deliveries d ON dp.DeliveryPersonID = d.DeliveryPersonID;

## 9. Display total revenue generated by each restaurant

SELECT r.Name, SUM(o.TotalAmount) AS Revenue
FROM Orders o
JOIN Restaurants r ON o.RestaurantID = r.RestaurantID
GROUP BY r.Name
ORDER BY Revenue DESC;

## 10. Get a list of customers who have never placed an order ##
SELECT * FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID FROM Orders);

## 11. List all customers whose name starts with 'A'

SELECT * FROM Customers
WHERE Name LIKE 'A%';

## 12 . List restaurants whose name is exactly 15 characters long ##

SELECT * FROM Restaurants
WHERE LENGTH(Name) = 15;

## 13. Show all menu items with 'Chicken' in their name ##

SELECT * FROM MenuItems
WHERE Name LIKE '%Chicken%';


## 14. List each order along with all ordered menu items ##

SELECT o.OrderID, m.Name AS MenuItem, oi.Quantity
FROM Orders o
JOIN OrderItems oi ON o.OrderID = oi.OrderID
JOIN MenuItems m ON oi.ItemID = m.ItemID;

## 15. Show all customers and the number of orders they have placed ##

SELECT c.Name, COUNT(o.OrderID) AS OrdersCount
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.Name;

## 16. Show each order with a label for small or large (above ₹300 is ‘Large’, else ‘Small’) ##

SELECT OrderID, TotalAmount,
  CASE
    WHEN TotalAmount > 300 THEN 'Large'
    ELSE 'Small'
  END AS OrderSize
FROM Orders;

 ## 17. Classify orders as ‘Recent’ if after 2025-11-01, else ‘Old’ ##
 
SELECT OrderID, OrderDate,
  CASE
    WHEN OrderDate >= '2025-11-01' THEN 'Recent'
    ELSE 'Old'
  END AS Recency
FROM Orders;



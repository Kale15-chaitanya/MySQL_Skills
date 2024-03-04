#Retail Management System

#Consider a fictional retail supermarket “K-mart” situated in different cities across India. 
#This supermarket is a fast growing supermarket due to their services and variety of items they provide under a single roof. 
#They also provide good discounts and coupons to the customers from time to time. 

#In this problem, the supermarket wants to input the data in a database quickly and efficiently so that 
#they will get quick and actionable insights.

#I have been hired as a data scientist and it's your responsibility to not only create the database 
#but also get actionable business insights for the stakeholders.


CREATE TABLE CustomerDim(
Customer_Id int PRIMARY KEY,
  Name varchar(128) NOT NULL,
  emailId varchar(128) NOT NULL,
  Birthdate date DEFAULT NULL,
  Address varchar(256) DEFAULT NULL,
  City varchar(64) DEFAULT NULL,
  State varchar(64) DEFAULT NULL,
  Pincode int DEFAULT NULL,
  Customer_Since int,
  Channel varchar(16),
  Reg_Date date DEFAULT NULL
);

CREATE TABLE ProductCategory(
  Id int PRIMARY KEY,
  Name varchar(128) NOT NULL,
  DESCRIPTION varchar(1024) DEFAULT NULL,
  Return_Exchange_Days int NOT NULL
);

CREATE TABLE ProductDim(
  Product_Id varchar(128) PRIMARY KEY,
  Name varchar(128) NOT NULL,
  Description text DEFAULT NULL,
  Price int NOT NULL,
  Discount decimal NOT NULL DEFAULT 0,
  In_Inventory date NOT NULL,
  Category_Id int NOT NULL,
  Return_Or_Exchange varchar(16),
  FOREIGN KEY (`Category_Id`) REFERENCES `ProductCategory` (`Id`)
);

CREATE TABLE Complaints(
  Complaint_Id varchar(128) PRIMARY KEY,
  Complaint_Name varchar(256) NOT NULL,
  Complaint_Description text DEFAULT NULL,
  Complaint_Date date NOT NULL,
  Customer_Comments text DEFAULT  NULL,
  Resolved varchar(16)
);

CREATE TABLE ProductSalesFact(
  Product_Id varchar(128) NOT NULL,
  Customer_Id int NOT NULL,
  Quantity text DEFAULT NULL,
  Amount_Paid int NOT NULL,
  DateofPurchase date NOT NULL,
  Complaint_Id varchar(16) NULL,
  Cust_Usage varchar(16) NOT NULL,
  FOREIGN KEY (`Customer_Id`) REFERENCES `CustomerDim` (`Customer_Id`),
  FOREIGN KEY (`Product_Id`) REFERENCES `ProductDim` (`Product_Id`),
  FOREIGN KEY (`Complaint_Id`) REFERENCES `Complaints` (`Complaint_Id`)
);

INSERT INTO CustomerDim VALUES (1, 'Rakesh Kumar', 'rakesh@gmail.com', '1992-06-06', '400/p, Arya Nagar', 'Udaipur', 'Rajasthan', 12456, 2000, 'FB', '2000-01-01');
INSERT INTO CustomerDim VALUES (2, 'Abhishek Singh', 'abhisingh@yahoo.com', '1993-08-07', 'B24, HKM Nagar', 'Gurgaon', 'Haryana', 13567, 2002, 'email', '2002-02-02');
INSERT INTO CustomerDim VALUES (3, 'Anagh Bajaj Yadav', 'aby1998@outlook.com', '1994-10-08', '323, Sector 8', 'Indore', 'Madhya Pradesh', 14678, 2004, 'google ads', '2004-01-12');
INSERT INTO CustomerDim VALUES (4, 'Sukant Agarwal', 'agasukant@gmail.com', '1995-12-09', 'Kailash Chand, Holi Upar, Near Jagdish Temple', 'Hisar', 'Haryana', 15789, 2006, 'FB', '2006-05-22');
INSERT INTO CustomerDim VALUES (5, 'Chandra Balasubramnyam', 'chandrabala@gmail.com', '1997-02-08', 'F43, electronicCity Apartments, electronic City', 'Bengaluru', 'Karnataka', 16900, 2004, 'FB', '2004-07-01');
INSERT INTO CustomerDim VALUES (6, 'Aditya Arora', 'aditya1992@rediffmail.com', '1992-06-06', 'Arora mansion, House 24, Cannaught Place', 'Delhi', 'Delhi', 18011, 2002, 'FB', '2002-12-21');
INSERT INTO CustomerDim VALUES (7, 'Priya Singhal', 'psinghal@outlook.com', '1991-04-05', 'G22, Block c, Milan Vihar Apartments, patparganj ext.', 'Delhi', 'Delhi', 19122, 2000, 'email', '2000-01-17');
INSERT INTO CustomerDim VALUES (8, 'Rajesh Sahu', 'rajesh1990@gmail.com', '1990-02-01', '444/G, Friends Colony', 'Hyderabad', 'Andhara Pradesh', 20233, 2001, 'email', '2001-02-27');
INSERT INTO CustomerDim VALUES (9, 'Vaishali Bhatnagar', 'vaishalinagar@yahoo.com', '1988-11-30', 'Bhatnagar Niwas, F12, vallabhai Nagar', 'Chennai', 'Tamil Nadu', 21344, 2001, 'google ads', '2001-01-01');
INSERT INTO CustomerDim VALUES (10, 'Shalini Gupta', 'guptashalini@gmail.com', '1987-09-29', 'A14, HiSky Apartments, Abdul Kalam Nagar', 'Noida', 'Uttar Pradesh', 22455, 2003, 'FB', '2003-02-02');
INSERT INTO CustomerDim VALUES (11, 'Vidya Sailesh Lodha', 'vidyalSlodha@rediffmail.com', '1986-07-28', 'House No. 42, Guru bahadur Colony, Near golden temple', 'Amritsar', 'Punjab', 23566, 2005, 'email', '2005-02-10');
INSERT INTO CustomerDim VALUES (12, 'Sailesh Saini', 'sailesh85@gmail.com', '1985-05-26', 'saini house, L44, uday Nagar, Near IIT Jodhpur', 'Jodhpur', 'Rajasthan', 24677, 2007, 'google ads', '2007-02-28');
INSERT INTO CustomerDim VALUES (13, 'Priya Bajaj', 'bajajyadavpriya@gmail.com', '1984-03-24', '802/2, Miya Vali Colony, behind mamta hospital', 'Jaipur', 'Rajasthan', 25788, 2009, 'instagram', '2009-01-15');
INSERT INTO CustomerDim VALUES (14, 'Komal Grover', 'groverK1996@gmail.com', '1996-07-06', 'H55, Singha Saheb Colony, near Ebenezer Internation School', 'Ambala', 'Punjab', 26899, 2011, 'email', '2011-02-02');
INSERT INTO CustomerDim VALUES (15, 'Abhilasha Agarwala', 'abhiagarwala87@yahoo.com', '1997-08-09', 'House No. 896, Sector 12A, near Singha Chowk', 'Surat', 'Gujarat', 28010, 2013, 'instagram', '2013-01-10');
INSERT INTO CustomerDim VALUES (16, 'Vishal Singh', 'vishalLokesh@yahoo.com', '1998-09-12', 'M11, Arya Nagar', 'Ahmedabad', 'Gujarat', 29121, 2015, 'google ads', '2015-02-02');
INSERT INTO CustomerDim VALUES (17, 'Ram Srivastava', 'sriRam1999@rediffmail.com', '1999-10-16', '90C, Friends Colony, near MAX Life Hospital', 'Indore', 'Madhya Pradesh', 30232, 2019, 'FB', '2019-07-18');
INSERT INTO CustomerDim VALUES (18, 'Samyara Meena', 'samMeena@outlook.com', '2000-11-18', '421, Pune HiRise Apartments, near Apolo Hospital', 'Pune', 'Maharastra', 31343, 2021, 'email', '2021-02-02');
INSERT INTO CustomerDim VALUES (19, 'Amayra oberoi', 'amyoberoi2001@outlook.com', '2001-12-22', '214P, Ambe Colony, near Jagdish Temple', 'Mumbai', 'Maharastra', 32454, 2006, 'google ads', '2006-03-02');
INSERT INTO CustomerDim VALUES (20, 'Amrinder Singh', 'amysingh1988@gmail.com', '1988-03-18', '312C, Surya Nagar', 'Delhi', 'Delhi', 33565, 2000, 'instagram', '2000-04-02');

INSERT INTO ProductCategory VALUES (1, 'Electronic Appliances', 'Contains Electronic appliances, like fans, geyser, mobiles, TVs, ACs, etc.', 7);
INSERT INTO ProductCategory VALUES (2, 'Toys', 'Toy sections for kids of age 2-15', 30);
INSERT INTO ProductCategory VALUES (3, 'Home Furniture', 'Home furniture of wide variety which covers the guest room to bed room.', 15);


INSERT INTO ProductDim VALUES ('P00001', 'Usha Fan', 'Speed: 1 to 5
Blade Size: Large Blade Sizes
Motor Power: 75 watts.
Remote Control: Yes
Timer: No
Energy Efficiency: 5 star', 8000, 0.2, '2022-05-04', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00002', 'Samsun LED TV 55 inch', 'Screen Size: 55 inches (measured diagonally)
Display Technology: LED (Light-Emitting Diode)
Resolution: including Full HD (1080p), 4K Ultra HD (2160p), and 8K Ultra HD (4320p).
Picture Quality: clear and vivid picture quality, with features such as HDR (High Dynamic Range) support, color enhancers, and motion smoothing technology.
Smart TV Features: smart TV features, including built-in Wi-Fi, access to popular streaming apps such as Netflix, Amazon Prime Video, and more.
Audio: includes built-in dolby speakers and compatibility with external sound systems.
Connectivity: HDMI, USB, and Ethernet ports, among others.', 45000, 0.0, '2022-06-05', 1, 'Exchange');
INSERT INTO ProductDim VALUES ('P00003', 'Onida LED TV 32 inch', 'Screen Size: 32 inches (measured diagonally)
Display Technology: LED (Light-Emitting Diode)
Resolution: includes HD (720p) and Full HD (1080p).
Picture Quality: advanced image processing technology, color enhancers, and motion smoothing technology.
Smart TV Features: smart TV features, including built-in Wi-Fi, access to popular streaming apps such as Netflix, Amazon Prime Video, Disney+Hotstar and more.
Audio: built-in speakers or compatibility with external sound systems.
Connectivity: including HDMI, USB, and Ethernet ports, among others', 17000, 0.0, '2022-07-07', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00004', 'Hitachi AC', 'Type: split invertor AC
Cooling Capacity: 2 Ton
Energy Efficiency: 5 star
Noise Level: Hitachi ACs are designed to operate with low noise levels, ensuring a peaceful indoor environment.
Filter Technology: includes HEPA filters and anti-bacterial filters.', 40000, 0.0, '2022-08-08', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00005', 'Sony LED TV 75 inch', 'Screen Size: 75 inches (measured diagonally)
Display Technology: LED (Light-Emitting Diode)
Resolution: Full HD (1080p), 4K Ultra HD (2160p), and 8K Ultra HD (4320p).
Picture Quality: HDR (High Dynamic Range) support, advanced image processing technology, and vibrant color reproduction.
Smart TV Features: smart TV features, including built-in Wi-Fi, access to popular streaming apps such as Netflix, Amazon Prime Video, Sonyliv, Zee5 and more.
Audio: includes HDMI, USB, and Ethernet ports, among others.', 112000, 0.2, '2022-09-09', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00006', 'Bosch Refrigerator', 'Type: top-freezer refrigerator
Capacity: 20 feet
Energy Efficiency: 4 star
Temperature Control: advanced temperature control systems that ensure consistent temperatures throughout the refrigerator, keeping food fresher for longer.
Ice and Water Dispenser: built-in ice and water dispensers for convenient access to ice and filtered water.
NoFrost Technology: Bosch refrigerators come with NoFrost technology, which prevents ice buildup in the freezer, eliminating the need for manual defrosting.', 48000, 0.2, '2022-10-11', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00007', 'Motorola Mobile', 'Operating System: Google Android One operating system.
Display: 6.8 inches QHD+.
Processor: MediaTek
RAM and Storage: 8 GB
Camera: includes dual rear cameras (40 MP + 12MP), and front-facing cameras for selfies (8MP).
Battery: 5000 mAh', 22000, 0.1, '2022-11-12', 1, 'Exchange');
INSERT INTO ProductDim VALUES ('P00008', 'Iphone13 black', 'Operating System: iOS 15.
Display: high-resolution OLED display with a high refresh rate.
Processor: The iPhone 13 is expected to be powered by latest A15 chip, offering improved performance and efficiency compared to previous models.
RAM and Storage: 128 GB
Camera: The iPhone 13 have an upgraded camera system with 12 MP rear camera and 8 MP front camera, with improvements in image quality, low light performance, and more.
Battery: 3000 mAh with 21 hours of video playback and up to 79 hours of audio playback..', 75000, 0.0, '2022-12-14', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00009', 'OnePlus9', 'Operating System: The OnePlus 9 runs on the Android 11 operating system with OxygenOS 11 on top.
Display: The phone has a 6.55-inch AMOLED display with a resolution of 2400 x 1080 pixels and a refresh rate of 120Hz.
Processor: The OnePlus 9 is powered by the Qualcomm Snapdragon 888 processor.
RAM and Storage: 12 GB of RAM and 256 GB of internal storage.
Camera: The OnePlus 9 features a triple rear camera setup with a 48-megapixel main camera, a 50-megapixel ultra-wide camera, and a 2-megapixel monochrome camera.
Battery: The phone has a 4500mAh battery that supports fast charging and wireless charging.', 34000, 0.0, '2023-01-15', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00010', 'Iphone12 gold', 'Operating System: The iPhone 12 runs on iOS 14 operating system.
Display: The iPhone 12 features a Super Retina XDR display, with options for a 6.1-inch or 6.7-inch screen size, and a resolution of 2532 x 1170 pixels.
Processor: The iPhone 12 is powered by the A14 Bionic chip, offering improved performance and efficiency compared to previous models.
RAM and Storage: 512 GB of internal storage.
Camera: The iPhone 12 features a dual-camera system, with a 12-megapixel ultra-wide and wide lens.
Battery: The iPhone 12 has a battery life of up to 17 hours of video playback and up to 65 hours of audio playback.', 70000, 0.0, '2023-01-01', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00011', 'Iphone13 gold', 'Operating System: iOS 15.
Display: high-resolution OLED display with a high refresh rate.
Processor: The iPhone 13 is expected to be powered by latest A15 chip, offering improved performance and efficiency compared to previous models.
RAM and Storage: 128 GB
Camera: The iPhone 13 have an upgraded camera system with 12 MP rear camera and 8 MP front camera, with improvements in image quality, low light performance, and more.
Battery: 3000 mAh with 21 hours of video playback and up to 79 hours of audio playback..', 78000, 0.0, '2022-12-18', 1, 'Return');
INSERT INTO ProductDim VALUES ('P00012', 'Spiderman Toy', 'Age: 7+
Material: Plastic
Height: 10 inch
Remove controlled and powered by batteries', 1200, 0.0, '2022-12-04', 2, 'Exchange');
INSERT INTO ProductDim VALUES ('P00013', 'ToyTruck', 'Age: 3+
Material: Plastic
Remotely controlled and powered by batteries.', 1000, 0.0, '2022-11-20', 2, 'Exchange');
INSERT INTO ProductDim VALUES ('P00014', 'Barbie doll', 'Age: 3+
Material: Plastic
Height: 11.5 inch', 600, 0.0, '2022-11-06', 2, 'Return');
INSERT INTO ProductDim VALUES ('P00015', 'Sofa Set (4 pcs), black', 'Size: Should be good enough for a room of size 11 x 11 to 14x14.
Style: Contemporary sofas with highly comfortable seats. comes in multiple variants: black gradients, brown gradients, gray varients.
Material: cloth(66%), and microfiber(34%). Durable, ease of cleaning - vaccum cleaner', 49999, 0.2, '2022-10-23', 3, 'Return');
INSERT INTO ProductDim VALUES ('P00016', 'Sofa Set (4 pcs), gray', 'Size: Should be good enough for a room of size 11 x 11 to 14x14.
Style: Contemporary sofas with highly comfortable seats. comes in multiple variants: black gradients, brown gradients, gray varients.
Material: cloth(66%), and microfiber(34%). Durable, ease of cleaning - vaccum cleaner', 55999, 0.0, '2022-10-09', 3, 'Return');
INSERT INTO ProductDim VALUES ('P00017', 'Dining Table. 4 chairs', 'Size: Should be good enough for a room of size 10 x 10 to 12x12. 4 seater
Shape: Round
Material: wood, and glass, Durable with low maintenance
Style: Contemporary

', 15000, 0.0, '2022-09-25', 3, 'Return');
INSERT INTO ProductDim VALUES ('P00018', 'Dining Table, 6 chairs', 'Size: Should be good enough for a room of size 10 x 10 to 12x12. 6 seater
Shape: Oval
Material: wood, and glass, Durable with low maintenance
Style: Contemporary

', 19999, 0.0, '2022-09-11', 3, 'Exchange');
INSERT INTO ProductDim VALUES ('P00019', 'Shoe Rack', '6 blocks divided in 3 separate partitions.
Height - 80 cms
Width - 60 cms
Depth - 25 cms', 2000, 0.2, '2022-08-28', 3, 'Exchange');
INSERT INTO ProductDim VALUES ('P00020', 'Double Bed, sheesham wood', 'Mattress size: measures 54 inches wide by 75 inches long. 
Frame material: Wood
Style: Contemporary
Additional features: built-in storage', 12999, 0.1, '2022-08-14', 3, 'Exchange');
INSERT INTO ProductDim VALUES ('P00021', 'Single Bed, sheesham wood', 'Mattress size: measures 30 inches wide by 75 inches long. 
Frame material: Wood
Style: Contemporary
Additional features: built-in storage', 9999, 0.0, '2022-07-31', 3, 'Exchange');

INSERT INTO Complaints VALUES ('CId1', 'Quality Issue', 'Did not meet the expectations', '2023-02-05', 'Want to return', 'Resolved');
INSERT INTO Complaints VALUES ('CId2', 'Got better price', 'No need of the product.', '2023-02-05', 'Want to return', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId3', 'Quality Issue', 'Did not meet our expectations', '2023-02-05', 'Want to replace', 'Resolved');
INSERT INTO Complaints VALUES ('CId4', 'Delay in delivery', 'product delay by 10 days and still not received', '2023-02-05', 'Cancel the product', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId5', 'Product not received', 'Yet to receieve', '2023-02-05', 'Cancel the product', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId6', 'Product malfunction', 'Product is damaged just after few days of usage', '2023-02-05', 'Want to return', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId7', 'Got better price', 'No need of the product.', '2023-02-05', 'Want to return', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId8', 'Product malfunction', 'Product is damaged just after few days of usage', '2023-02-05', 'Want to return', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId9', 'Got better price', 'No need of the product.', '2023-02-05', 'Want to return', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId10', 'Delay in delivery', 'product delay by 15 days and got it somewhere else', '2023-02-04', 'Cancel the product', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId11', 'Got better price', 'No need of the product.', '2023-02-04', 'Want to return', 'Resolved');
INSERT INTO Complaints VALUES ('CId12', 'Product not received', 'Yet to receieve', '2023-02-04', 'Cancel the product', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId13', 'Delay in delivery', 'product delay by 7 days and got it somewhere else', '2023-02-04', 'Cancel the product', 'Resolved');
INSERT INTO Complaints VALUES ('CId14', 'Quality Issue', 'Quality is very worst', '2023-02-04', 'Want to replace', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId15', 'Product not received', 'Yet to receieve', '2023-02-03', 'Cancel the product', 'Not Resolved');
INSERT INTO Complaints VALUES ('CId16', 'Quality Issue', 'Quality is not what expected', '2023-02-03', 'Want to return', 'Resolved');
INSERT INTO Complaints VALUES ('CId17', 'Product not received', 'Yet to receieve', '2023-02-03', 'Cancel the product', 'Resolved');
INSERT INTO Complaints VALUES ('CId18', 'Delay in delivery', 'product delay by 21 days and not required now', '2023-02-03', 'Cancel the product', 'Resolved');
INSERT INTO Complaints VALUES ('CId19', 'Delay in delivery', 'product delay by 8 days and not required now', '2023-02-02', 'Cancel the product', 'Resolved');

INSERT INTO ProductSalesFact VALUES ('P00001', 1, 19, 121600.0, '2023-01-04', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00002', 2, 2, 90000.0, '2023-01-06', 'CId2', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00003', 3, 1, 17000.0, '2023-01-08',  null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00004', 4, 2, 80000.0, '2023-01-10', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00005', 5, 2, 179200.0, '2023-01-12', 'CId5', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00006', 6, 1, 38400.0, '2023-01-14', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00007', 7, 1, 19800.0, '2023-01-16', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00008', 8, 1, 75000.0, '2023-01-18', 'CId8', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00009', 9, 2, 68000.0, '2023-01-20', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00010', 10, 18, 1260000.0, '2023-01-22', 'CId10', 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00011', 11, 1, 78000.0, '2023-01-24', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00012', 12, 2, 2400.0, '2023-01-26', 'CId12', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00013', 13, 2, 2000.0, '2023-01-28', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00014', 14, 2, 1200.0, '2023-01-30', 'CId14', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00015', 15, 1, 39999.2, '2023-02-01', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00016', 16, 3, 167997.0, '2023-02-03', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00017', 17, 6, 335994.0, '2023-02-04', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00018', 18, 6, 335994.0, '2023-02-06', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00019', 19, 18, 1007982.0, '2023-02-06', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00020', 20, 1, 55999.0, '2023-02-01', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00021', 19, 16, 895984.0, '2023-01-01', 'CId18', 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00001', 1, 1, 6400.0, '2023-01-04', 'CId19', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00006', 6, 15, 576000.0, '2023-01-14', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00007', 7, 2, 39600.0, '2023-01-16', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00008', 8, 5, 375000.0, '2023-01-18', 'CId1', 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00009', 9, 1, 34000.0, '2023-01-20', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00010', 10, 1, 70000.0, '2023-01-22', 'CId3', 'Household');
INSERT INTO ProductSalesFact VALUES ('P00011', 11, 1, 78000.0, '2023-01-24', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00015', 15, 1, 39999.2, '2023-02-01', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00016', 16, 1, 55999.0, '2023-02-03', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00017', 17, 10, 559990.0, '2023-02-04', null, 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00018', 18, 12, 671988.0, '2023-02-06', 'CId4', 'Industrial');
INSERT INTO ProductSalesFact VALUES ('P00012', 12, 1, 1200.0, '2023-01-26', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00013', 13, 1, 1000.0, '2023-01-28', null, 'Household');
INSERT INTO ProductSalesFact VALUES ('P00014', 14, 2, 1200.0, '2023-01-30', null, 'Household');

-- DISPLAYING ALL THE CREATED RECORDS

select* from CustomerDim;
select* from ProductCategory;
select* from ProductDim;
select* from Complaints;
select* from ProductSalesFact;

#Rank the customers based on
#1.a.) Total purchasing they have done in terms of amount in desc order:

select*,rank() over(order by Total_Purchase desc) as customer_rank,dense_rank() over(order by Total_Purchase desc) as customer_Dense_rank
from
(select cd.Customer_Id,cd.Name,sum(pd.Amount_Paid) as Total_Purchase
from CustomerDim as cd
left join ProductSalesFact as pd
on cd.Customer_Id=pd.Customer_Id
group by cd.Customer_Id) as t1;


#1.b.) Total quantities they have purchased by descending order
#Use ROW_NUMBER() vs DENSE_RANK() and check if the final ranking is the same or not. Check the results from the following.

SELECT Customer_Id, TotalQuantityPurchased,
row_number() OVER(ORDER BY TotalQuantityPurchased DESC) AS _ROW_NUM,
DENSE_RANK() OVER(ORDER BY TotalQuantityPurchased DESC) AS DenseRank
FROM (SELECT Customer_Id,
      SUM(Quantity) AS TotalQuantityPurchased
      FROM ProductSalesFact 
      GROUP BY Customer_Id) AS T;

#Both the ranking functions behave similarly for the total amount that the customer has paid so far 
#but it behaves differently for the quantities that they have purchased so far. 
#We can clearly see that for the quantities there are ties within customers and therefore, 
#the dense_rank and rank assigns equal rank to them although dense rank sequentially assigns 
#the rank to the customers while rank skips the rank/s every time there is a tie.

#Identify the top 1 ranking product/s within each product category by their.

#2a.) Price.
#WITH USING SUBQUERRY AND WINDOW FUNCTION

SELECT *
FROM
(
SELECT Product_Id, Price, Category_Id,
DENSE_RANK() OVER(PARTITION BY Category_Id ORDER BY Price DESC) AS _rank
FROM ProductDim) AS T
WHERE _rank = 1;

# OR
#WITH USING SUBQUERRY AND JOIN

select* from
(select Category_Id,Product_Id,Price
from ProductDim) as t1
join
(select Category_Id,max(Price) as Price 
                from ProductDim 
                group by Category_Id) as t2
on t1.Category_Id=t2.Category_Id and t1.Price=t2.Price
order by t1.Price desc;

#2.b.) Number of days they are in inventory from the current date.
#WITH USING SUBQUERRY AND WINDOW FUNCTION

SELECT *
FROM
(
SELECT Product_Id, DATEDIFF(NOW(),In_Inventory) TotalDays, Category_Id,
DENSE_RANK() OVER(PARTITION BY Category_Id ORDER BY DATEDIFF(NOW(),In_Inventory) DESC) AS _rank
FROM ProductDim) AS T
WHERE _rank = 1;

#OR
#WITH USING JOIN AND SUBQUERRY

select* from
(select Category_Id,Product_Id,datediff(current_date,In_Inventory) as Days
from ProductDim) as t1
join
(select Category_Id,max(datediff(current_date,In_Inventory)) as Days
from ProductDim
group by Category_Id) as t2
on t1.Category_Id=t2.Category_Id and t1.Days=t2.Days
order by t1.Days desc;

#2c.) Rank the complaints that are not resolved by their number of days in top to bottom order. 
#Categorize the results by the Complaint Name.

SELECT Complaint_Name, DATEDIFF(NOW(),Complaint_Date) AS TotalDaysNotResolved, 
RANK() OVER(PARTITION BY Complaint_Name ORDER BY DATEDIFF(NOW(),Complaint_Date) DESC) AS _rank 
FROM Complaints 
WHERE Resolved != 'Resolved';

#Compare the total purchase by amount that happened for each Usage type on a week by week basis. 
#Remove records where we have null values on past or future values.

#Compare the earnings and calculate the profit or loss compared to last week. 

SELECT *,
TotalPurchase - Past AS RevenueFromLastWeek
FROM
(
SELECT *,
LAG(TotalPurchase) OVER(PARTITION BY Cust_Usage ORDER BY _week) AS Past,
LEAD(TotalPurchase) OVER(PARTITION BY Cust_Usage ORDER BY _week) AS Future
FROM (SELECT Cust_Usage,
     EXTRACT(WEEK FROM DateofPurchase) as _week,
     SUM(Amount_Paid) AS TotalPurchase
     FROM ProductSalesFact
     GROUP BY Cust_Usage, _week) AS T) AS T
     WHERE Past IS NOT NULL AND Future IS NOT NULL;
     
#Compare the total number of complaints resolved on a week by week basis [include only past values]. 
#What comment can you make based on the results?

SELECT *,
LAG(TotalComplaints) OVER(PARTITION BY Resolved ORDER BY _week) AS Past
FROM (SELECT Resolved,
     EXTRACT(WEEK FROM Complaint_Date) as _week,
     COUNT(*) AS TotalComplaints
     FROM Complaints
     GROUP BY Resolved, _week) AS T;

#OR

select Resolved,week(Complaint_Date) as _week,count(*)
from Complaints
group by Resolved,_week
order by Resolved,_week;

#COMMENT:-
#Queries that are not resolved are piling up over time due to less number of queries that are resolved.

#Q-Get the number of customers that you witness week-by-week on your platform for each usage type including past and future values. 

select* from CustomerDim;
select* from ProductSalesFact;

SELECT *,
LAG(TotalCustomers) OVER(PARTITION BY Cust_Usage ORDER BY _week) AS Past,
LEAD(TotalCustomers) OVER(PARTITION BY Cust_Usage ORDER BY _week) AS Future
FROM (SELECT Cust_Usage,
     EXTRACT(WEEK FROM DateofPurchase) as _week,
     COUNT(*) AS TotalCustomers
     FROM ProductSalesFact
     GROUP BY Cust_Usage, _week) AS T

#COMMENT
#There is some traction in the household sector as we see a consistent set of customers overall along with consistent growth as well.

#Q-Finding the First value and the Last value for each usage type category.     

SELECT *,
FIRST_VALUE(TotalCustomers) OVER(PARTITION BY Cust_Usage ORDER BY _week RANGE BETWEEN
	    UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING) AS firstvalue,
LAST_VALUE(TotalCustomers) OVER(PARTITION BY Cust_Usage ORDER BY _week RANGE BETWEEN
	    UNBOUNDED PRECEDING AND
            UNBOUNDED FOLLOWING) AS lastvalue
FROM (SELECT Cust_Usage,
     EXTRACT(WEEK FROM DateofPurchase) as _week,
     COUNT(*) AS TotalCustomers
     FROM ProductSalesFact
     GROUP BY Cust_Usage, _week) AS T;     
     
#COMMENT
#first value = 2, last value = 6 for household set of customers     

#Q-Divide the household customer into 3 segments: highPurchase, mediumPurchase 
#and lowPurchase based on ranking of customers by their total purchase amount (first 25% in low, 25 to 75 medium and > 75% high) 


SELECT *,
CASE 
WHEN _rank < 0.25 THEN 'lowPurchase'
WHEN _rank BETWEEN 0.25 AND 0.75 THEN 'mediumPurchase'
ELSE 'highPurchase'
END AS PurchasePower
FROM
(
SELECT *,
PERCENT_RANK() OVER(ORDER BY TotalPurchase) AS _rank
FROM (SELECT Customer_Id, Cust_Usage, 
      SUM(Amount_Paid) AS TotalPurchase
      FROM ProductSalesFact 
      GROUP BY Customer_Id, Cust_Usage) AS T
WHERE Cust_Usage = "Household") AS T;

#Find the Number of customers in each of the categories of derived household customers and choose the correct option that applies.

#COMMENT
#Medium purchase has 9 customers while low and high purchase has 4 customers each.

#Total purchase within each household category in terms of Quantity they purchased?

SELECT
CASE 
WHEN _rank < 0.25 THEN 'lowPurchase'
WHEN _rank BETWEEN 0.25 AND 0.75 THEN 'medicumPurchase'
ELSE 'highPurchase'
END AS PurchasePower,
SUM(TotalPurchase) AS TotalPurchaseBySegment,
SUM(TotalQuantity) AS TotalQuantityBySegment
FROM
(
SELECT *,
PERCENT_RANK() OVER(ORDER BY TotalPurchase) AS _rank
FROM (SELECT Customer_Id, Cust_Usage, 
      SUM(Amount_Paid) AS TotalPurchase,
      SUM(Quantity) AS TotalQuantity
      FROM ProductSalesFact 
      GROUP BY Customer_Id, Cust_Usage) AS T
WHERE Cust_Usage = "Household") AS T
GROUP BY 
CASE 
WHEN _rank < 0.25 THEN 'lowPurchase'
WHEN _rank BETWEEN 0.25 AND 0.75 THEN 'medicumPurchase'
ELSE 'highPurchase'
END;

#COMMENT
#Low purchase has 11 customers while medium purchase has 13 and high purchase has 9 customers.


#Q-Total purchase within each household category in terms of Total Purchase amount.

#COMMENT
#Low purchase has 15400 total sales while medium purchase has 531796 and high purchase has 527200 total sales.

#Sort the household customers by their amount paid while industrial customer to the discounts they have been offered.

SELECT PS.*, PD.Discount 
FROM ProductSalesFact AS PS 
JOIN ProductDim AS PD 
ON PS.Product_Id = PD.Product_Id 
ORDER BY CASE  
		 WHEN Cust_Usage = "Household" THEN Amount_Paid 
         ELSE Discount 
         END;
         
#Create functions to Get the age of customer from their date of birth. 

DELIMITER &&
CREATE FUNCTION Age
(DOB Date)
RETURNS INT 
DETERMINISTIC
BEGIN
    DECLARE Years INT;
    SET Years = YEAR(NOW()) - YEAR(DOB);
    RETURN Years; 
END &&
DELIMITER ;

# Create functions to Get the full address of a customer

DELIMITER &&
CREATE FUNCTION FullAddress
(first_line varchar(256), City varchar(64), State varchar(64), Pincode int)
RETURNS varchar(512)
DETERMINISTIC
BEGIN
    DECLARE address varchar(512);
    SET address = CONCAT_WS(", ", first_line, City, State, Pincode);
    RETURN address; 
END &&
DELIMITER ;

#Write views for the following
#Identify the customers by different age group/segments - 10-19, 20-30, 30-60, >60 and get the 
#total discount in amount offered to them by segment. And select the correct option.

CREATE VIEW DiscountBySegment AS
SELECT
CASE 
WHEN ageofCustomer BETWEEN 10 AND 19 THEN 'teenage'
WHEN ageofCustomer BETWEEN 20 AND 30 THEN 'adult'
WHEN ageofCustomer BETWEEN 30 AND 60 THEN 'mid age'
ELSE 'Old Age'
END AS AgeSegment,
SUM(discountInAmount) AS TotalDiscountInAmount
FROM
(
SELECT C.Customer_Id,
Age(C.BirthDate) AS ageofCustomer,
((PD.Discount*100/PD.Price) + PD.Price) AS discountInAmount
FROM CustomerDim AS C
JOIN ProductSalesFact AS P
ON C.Customer_Id = P.Customer_Id
JOIN ProductDim AS PD
ON P.Product_Id = P.Product_Id) AS T
GROUP BY 
CASE 
WHEN ageofCustomer BETWEEN 10 AND 19 THEN 'teenage'
WHEN ageofCustomer BETWEEN 20 AND 30 THEN 'adult'
WHEN ageofCustomer BETWEEN 30 AND 60 THEN 'mid age'
ELSE 'Old Age'
END 
;

SELECT * FROM DiscountBySegment;

# Display message for bulk order item (quantity >= 10) - “Sorry, the order delivery to your {Full Address} is delayed by 2 days. 
#It's expected to arrive on {date}” where the date is 2 days from now.

CREATE VIEW BulkOrderMessage AS
SELECT CONCAT("Sorry, the order delivery to your ", FullAddress(Address, City, State, Pincode), ' is delayed by 2 days. Its expected to arrive on ' , DATE_ADD(NOW(), INTERVAL 2 DAY), " from now.") AS DisplayMessage
FROM ProductSalesFact AS P
JOIN CustomerDim AS C
ON P.Customer_Id = C.Customer_Id
WHERE Quantity >= 10;

SELECT * FROM BulkOrderMessage;

#COMMENT
#Total 7 records will be displayed in the output

#we want to display different images by age groups if their order is late. 
#Write a procedure where for bulk order item (quantity >=10) you have to return an animation of ‘puppy’ for 10-19, 
#‘a warehouse person with loading box’ for 20-30, ‘a moving truck’ for 30-60 and a ‘puppy’ for >60 again 
#[This will just be a column with Image type text displayed]. 
#Write a stored procedure for the task given the Date of birth of the customer. 
#Based on the question please check if the same can be replicated using a stored procedure

DELIMITER &&
CREATE PROCEDURE BulkOrderMessageWImage (IN DOB date, OUT p2 varchar(128))
BEGIN
	SELECT
    CASE 
    WHEN DOB BETWEEN 10 AND 19 THEN 'puppy'
    WHEN DOB BETWEEN 20 AND 30 THEN 'a warehouse person with loading box'
    WHEN DOB BETWEEN 30 AND 60 THEN 'a moving truck'
    ELSE 'puppy'
    END AS AgeSegment
    INTO p2
    ;

END &&
DELIMITER ;

CALL BulkOrderMessageWImage('2003-02-15', @p2);
SELECT @p2 AS p;
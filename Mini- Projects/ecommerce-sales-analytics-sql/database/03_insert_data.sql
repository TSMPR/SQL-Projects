USE ecommerce_sales;

INSERT INTO customers VALUES
(1,'Arjun Kumar','arjun.kumar@email.com','Hyderabad','2025-01-10'),
(2,'Priya Sharma','priya.sharma@email.com','Vijayawada','2025-01-18'),
(3,'Rahul Reddy','rahul.reddy@email.com','Bengaluru','2025-02-02'),
(4,'Sneha Rao','sneha.rao@email.com','Chennai','2025-02-15'),
(5,'Kiran Patel','kiran.patel@email.com','Mumbai','2025-03-01'),
(6,'Ananya Singh','ananya.singh@email.com','Delhi','2025-03-12'),
(7,'Vikram Das','vikram.das@email.com','Kolkata','2025-03-25'),
(8,'Meera Nair','meera.nair@email.com','Kochi','2025-04-03'),
(9,'Rohit Verma','rohit.verma@email.com','Pune','2025-04-17'),
(10,'Divya Reddy','divya.reddy@email.com','Hyderabad','2025-05-06'),
(11,'Sanjay Kumar','sanjay.kumar@email.com','Visakhapatnam','2025-05-20'),
(12,'Pooja Shah','pooja.shah@email.com','Ahmedabad','2025-06-02'),
(13,'Naveen Rao','naveen.rao@email.com','Vijayawada','2025-06-15'),
(14,'Lakshmi Devi','lakshmi.devi@email.com','Chennai','2025-07-01'),
(15,'Aman Gupta','aman.gupta@email.com','Delhi','2025-07-19'),
(16,'Keerthi Reddy','keerthi.reddy@email.com','Hyderabad','2025-08-04'),
(17,'Varun Joshi','varun.joshi@email.com','Pune','2025-08-18'),
(18,'Isha Kapoor','isha.kapoor@email.com','Mumbai','2025-09-01'),
(19,'Tarun Babu','tarun.babu@email.com','Bengaluru','2025-09-12'),
(20,'Neha Rao','neha.rao@email.com','Kochi','2025-10-05');

INSERT INTO products VALUES
(101,'Wireless Mouse','Electronics',799),(102,'Mechanical Keyboard','Electronics',2499),
(103,'USB-C Hub','Electronics',1499),(104,'Bluetooth Headphones','Electronics',2999),
(105,'Laptop Stand','Accessories',1299),(106,'Webcam','Electronics',2199),
(107,'Smart Watch','Wearables',4999),(108,'Fitness Band','Wearables',2499),
(109,'Backpack','Accessories',1799),(110,'Office Chair','Furniture',8999),
(111,'Desk Lamp','Furniture',1599),(112,'Water Bottle','Lifestyle',699),
(113,'Running Shoes','Fashion',3499),(114,'T-Shirt','Fashion',999),
(115,'Bluetooth Speaker','Electronics',1999);

INSERT INTO orders VALUES
(1001,1,'2025-01-15','Completed'),(1002,2,'2025-01-22','Completed'),
(1003,3,'2025-02-10','Completed'),(1004,4,'2025-02-20','Cancelled'),
(1005,5,'2025-03-05','Completed'),(1006,6,'2025-03-18','Completed'),
(1007,7,'2025-03-28','Pending'),(1008,8,'2025-04-08','Completed'),
(1009,9,'2025-04-21','Completed'),(1010,10,'2025-05-10','Completed'),
(1011,1,'2025-05-18','Completed'),(1012,11,'2025-05-25','Completed'),
(1013,12,'2025-06-07','Completed'),(1014,2,'2025-06-15','Completed'),
(1015,13,'2025-06-22','Pending'),(1016,14,'2025-07-05','Completed'),
(1017,15,'2025-07-20','Completed'),(1018,3,'2025-08-01','Completed'),
(1019,16,'2025-08-10','Completed'),(1020,17,'2025-08-22','Completed'),
(1021,18,'2025-09-03','Completed'),(1022,19,'2025-09-15','Completed'),
(1023,20,'2025-10-08','Completed'),(1024,5,'2025-10-18','Completed'),
(1025,6,'2025-11-02','Completed'),(1026,10,'2025-11-15','Cancelled'),
(1027,1,'2025-12-01','Completed'),(1028,4,'2025-12-10','Completed'),
(1029,12,'2025-12-18','Completed'),(1030,18,'2025-12-25','Completed');

INSERT INTO order_items VALUES
(1,1001,101,2),(2,1001,105,1),(3,1002,104,1),(4,1002,112,2),
(5,1003,102,1),(6,1003,103,1),(7,1004,110,1),(8,1005,107,1),
(9,1005,114,2),(10,1006,109,1),(11,1006,113,1),(12,1007,115,1),
(13,1008,110,1),(14,1008,111,1),(15,1009,106,1),(16,1009,101,1),
(17,1010,107,1),(18,1010,108,1),(19,1011,104,1),(20,1011,103,2),
(21,1012,102,1),(22,1012,105,2),(23,1013,113,1),(24,1013,114,2),
(25,1014,110,1),(26,1015,109,2),(27,1016,108,1),(28,1016,112,2),
(29,1017,115,2),(30,1017,101,1),(31,1018,104,1),(32,1018,106,1),
(33,1019,107,1),(34,1019,103,1),(35,1020,110,1),(36,1020,105,1),
(37,1021,102,1),(38,1021,115,1),(39,1022,113,2),(40,1022,114,1),
(41,1023,111,2),(42,1023,112,3),(43,1024,104,1),(44,1024,101,2),
(45,1025,107,1),(46,1025,108,1),(47,1026,110,1),(48,1027,102,1),
(49,1027,103,1),(50,1028,109,1),(51,1028,113,1),(52,1029,115,2),
(53,1029,106,1),(54,1030,110,1),(55,1030,111,1);

INSERT INTO payments VALUES
(1,1001,'UPI','Paid'),(2,1002,'Credit Card','Paid'),(3,1003,'Debit Card','Paid'),
(4,1004,'Credit Card','Refunded'),(5,1005,'UPI','Paid'),(6,1006,'Net Banking','Paid'),
(7,1007,'UPI','Pending'),(8,1008,'Credit Card','Paid'),(9,1009,'Debit Card','Paid'),
(10,1010,'UPI','Paid'),(11,1011,'Credit Card','Paid'),(12,1012,'UPI','Paid'),
(13,1013,'Net Banking','Paid'),(14,1014,'UPI','Paid'),(15,1015,'Debit Card','Pending'),
(16,1016,'Credit Card','Paid'),(17,1017,'UPI','Paid'),(18,1018,'Credit Card','Paid'),
(19,1019,'UPI','Paid'),(20,1020,'Net Banking','Paid'),(21,1021,'Debit Card','Paid'),
(22,1022,'UPI','Paid'),(23,1023,'Credit Card','Paid'),(24,1024,'UPI','Paid'),
(25,1025,'Debit Card','Paid'),(26,1026,'Credit Card','Refunded'),(27,1027,'UPI','Paid'),
(28,1028,'Net Banking','Paid'),(29,1029,'UPI','Paid'),(30,1030,'Credit Card','Paid');

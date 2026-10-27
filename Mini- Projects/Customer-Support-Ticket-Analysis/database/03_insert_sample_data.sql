USE customer_support_analysis;
INSERT INTO customers VALUES
(1,'Aarav Sharma','Standard'),(2,'Diya Reddy','Premium'),(3,'Ishaan Patel','Standard'),
(4,'Ananya Rao','Enterprise'),(5,'Kabir Singh','Standard'),(6,'Meera Nair','Premium'),
(7,'Arjun Kumar','Standard'),(8,'Sara Khan','Enterprise'),(9,'Vivaan Das','Premium'),
(10,'Aadhya Iyer','Standard');
INSERT INTO agents VALUES
(1,'Nina Thomas','Billing'),(2,'Rahul Verma','Technical'),
(3,'Pooja Menon','General Support'),(4,'Dev Shah','Technical');
INSERT INTO tickets VALUES
(1001,1,3,'Account Access','Medium','Email','Resolved','2026-01-02 09:10:00','2026-01-02 09:35:00','2026-01-02 11:10:00'),
(1002,2,1,'Billing','High','Chat','Closed','2026-01-03 10:00:00','2026-01-03 10:05:00','2026-01-03 10:50:00'),
(1003,3,2,'Technical Issue','Urgent','Phone','Resolved','2026-01-05 08:30:00','2026-01-05 08:34:00','2026-01-05 12:30:00'),
(1004,4,4,'Integration','High','Email','Closed','2026-01-07 13:20:00','2026-01-07 14:00:00','2026-01-08 09:20:00'),
(1005,5,3,'General Inquiry','Low','Web Form','Resolved','2026-01-10 11:00:00','2026-01-10 15:00:00','2026-01-10 16:00:00'),
(1006,6,1,'Refund','Medium','Chat','Closed','2026-01-12 09:45:00','2026-01-12 09:55:00','2026-01-12 13:15:00'),
(1007,7,2,'Technical Issue','High','Email','Resolved','2026-01-15 16:00:00','2026-01-15 16:25:00','2026-01-16 10:00:00'),
(1008,8,4,'Integration','Urgent','Phone','In Progress','2026-01-18 08:15:00','2026-01-18 08:20:00',NULL),
(1009,9,1,'Billing','Medium','Email','Resolved','2026-02-02 12:30:00','2026-02-02 13:00:00','2026-02-02 15:30:00'),
(1010,10,3,'Account Access','Low','Web Form','Closed','2026-02-04 14:00:00','2026-02-04 16:30:00','2026-02-05 09:00:00'),
(1011,1,2,'Technical Issue','Urgent','Chat','Resolved','2026-02-07 09:00:00','2026-02-07 09:03:00','2026-02-07 10:30:00'),
(1012,2,1,'Billing','High','Phone','Resolved','2026-02-09 11:10:00','2026-02-09 11:18:00','2026-02-09 14:00:00'),
(1013,3,4,'Integration','Medium','Email','In Progress','2026-02-11 15:40:00','2026-02-11 16:00:00',NULL),
(1014,4,3,'General Inquiry','Low','Chat','Closed','2026-03-02 10:20:00','2026-03-02 10:25:00','2026-03-02 10:45:00'),
(1015,5,2,'Technical Issue','High','Email','Resolved','2026-03-05 08:50:00','2026-03-05 09:10:00','2026-03-05 13:50:00'),
(1016,6,1,'Refund','Medium','Web Form','Resolved','2026-03-08 13:30:00','2026-03-08 16:00:00','2026-03-09 10:30:00'),
(1017,7,2,'Technical Issue','Urgent','Chat','Open','2026-03-10 09:00:00',NULL,NULL),
(1018,8,3,'Account Access','Medium','Phone','Resolved','2026-03-12 12:00:00','2026-03-12 12:15:00','2026-03-12 13:00:00'),
(1019,9,4,'Integration','High','Email','Resolved','2026-04-02 14:15:00','2026-04-02 15:00:00','2026-04-03 12:15:00'),
(1020,10,2,'Technical Issue','Medium','Chat','Closed','2026-04-05 10:10:00','2026-04-05 10:20:00','2026-04-05 12:10:00'),
(1021,1,1,'Refund','High','Phone','In Progress','2026-04-07 09:30:00','2026-04-07 09:35:00',NULL),
(1022,2,3,'Billing','Medium','Email','Resolved','2026-04-10 11:45:00','2026-04-10 12:10:00','2026-04-10 16:00:00');
INSERT INTO ticket_feedback VALUES
(1,1001,4,'2026-01-03'),(2,1002,5,'2026-01-04'),(3,1003,3,'2026-01-06'),
(4,1004,4,'2026-01-09'),(5,1005,5,'2026-01-11'),(6,1006,4,'2026-01-13'),
(7,1007,3,'2026-01-17'),(8,1009,4,'2026-02-03'),(9,1010,5,'2026-02-06'),
(10,1011,4,'2026-02-08'),(11,1012,3,'2026-02-10'),(12,1014,5,'2026-03-03'),
(13,1015,4,'2026-03-06'),(14,1016,3,'2026-03-10'),(15,1018,4,'2026-03-13'),
(16,1019,2,'2026-04-04'),(17,1020,5,'2026-04-06'),(18,1022,4,'2026-04-11');

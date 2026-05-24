-----Table Creation: Healthcare Data
--drop table Patient_Visit
CREATE TABLE Patient_Visit
(
    VisitID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    TreatmentCost DECIMAL(10,2),
    InsuranceProvider VARCHAR(50),
    InsuranceCoveragePercent INT,
    FinalPayableAmount DECIMAL(10,2),
    BillingStatus VARCHAR(20)
);

INSERT INTO Patient_Visit
(VisitID, PatientName, TreatmentCost, InsuranceProvider, InsuranceCoveragePercent, FinalPayableAmount, BillingStatus)
VALUES
(1,'Amit Sharma',15000,'Aetna',80,NULL,'PENDING'),
(2,'Neha Verma',12000,'Cigna',75,NULL,'PENDING'),
(3,'Ravi Kumar',18000,'United',70,NULL,'PENDING'),
(4,'Sunita Rao',10000,'Aetna',85,NULL,'PENDING'),
(5,'Vikas Singh',20000,'Cigna',70,NULL,'PENDING'),
(6,'Anjali Mehta',22000,'United',65,NULL,'PENDING'),
(7,'Raj Patel',14000,'Aetna',80,NULL,'PENDING'),
(8,'Kiran Nair',16000,'Cigna',75,NULL,'PENDING'),
(9,'Pooja Joshi',13000,'United',70,NULL,'PENDING'),
(10,'Suresh Iyer',19000,'Aetna',85,NULL,'PENDING'),
(11,'Manoj Gupta',15000,'Cigna',78,NULL,'PENDING'),
(12,'Deepa Malhotra',17500,'United',72,NULL,'PENDING'),
(13,'Nitin Jain',21000,'Aetna',80,NULL,'PENDING'),
(14,'Ritika Kapoor',15500,'Cigna',76,NULL,'PENDING'),
(15,'Alok Mishra',16500,'United',68,NULL,'PENDING'),
(16,'Preeti Saxena',12500,'Aetna',90,NULL,'PENDING'),
(17,'Kunal Bansal',18500,'Cigna',74,NULL,'PENDING'),
(18,'Meenal Arora',19500,'United',66,NULL,'PENDING'),
(19,'Arjun Khanna',14500,'Aetna',82,NULL,'PENDING'),
(20,'Shruti Das',17000,'Cigna',77,NULL,'PENDING');


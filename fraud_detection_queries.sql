CREATE DATABASE fraud_detection_db;
USE fraud_detection_db;
CREATE TABLE transactions (
  TransactionID VARCHAR(20) PRIMARY KEY,
  AccountID VARCHAR(20),
  TransactionAmount DECIMAL(10,2),
  TransactionDate DATETIME,
  TransactionType VARCHAR(20),
  Location VARCHAR(100),
  DeviceID VARCHAR(50),
  IP_Address VARCHAR(50),
  MerchantID VARCHAR(20),
  Channel VARCHAR(20),
  CustomerAge INT,
  CustomerOccupation VARCHAR(50),
  TransactionDuration INT,
  LoginAttempts INT,
  AccountBalance DECIMAL(12,2),
  PreviousTransactionDate DATETIME
);
SELECT COUNT(*) FROM transactions;
SELECT * FROM transactions LIMIT 10;
SELECT *
FROM transactions
WHERE LoginAttempts > 3
ORDER BY LoginAttempts DESC;
SELECT AccountID, COUNT(DISTINCT Location) AS distinct_locations
FROM transactions
GROUP BY AccountID
HAVING distinct_locations > 3;
SELECT AccountID, COUNT(*) AS txn_count, 
       MIN(TransactionDate) AS first_txn, 
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 10000
GROUP BY AccountID
HAVING TIMESTAMPDIFF(MINUTE, MIN(TransactionDate), MAX(TransactionDate)) <= 180
   AND txn_count >=2;
   SELECT *
FROM transactions
WHERE AccountBalance < 1000
  AND TransactionAmount > 5000
ORDER BY AccountID, TransactionDate;
SELECT 
    AccountID,
    DATE(TransactionDate) AS txn_date,
    COUNT(DISTINCT IP_Address) AS ip_count,
    COUNT(DISTINCT DeviceID) AS device_count
FROM 
    transactions
GROUP BY 
    AccountID, DATE(TransactionDate)
HAVING 
    ip_count > 2 OR device_count > 2;
    SELECT 
    AccountID, 
    DATE(TransactionDate) AS txn_date, 
    COUNT(DISTINCT IP_Address) AS ip_count,
    COUNT(DISTINCT DeviceID) AS device_count
FROM 
    transactions
GROUP BY 
    AccountID, 
    DATE(TransactionDate);
    SELECT COUNT(*) FROM transactions WHERE TransactionAmount > 10000;
SELECT AccountID, COUNT(*) AS txn_count,
       MIN(TransactionDate) AS first_txn,
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 1000
GROUP BY AccountID
HAVING TIMESTAMPDIFF(MINUTE, MIN(TransactionDate), MAX(TransactionDate)) <= 180
   AND txn_count >= 2;
   SELECT AccountID, COUNT(*) AS txn_count,
       MIN(TransactionDate) AS first_txn,
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 1000
GROUP BY AccountID
HAVING txn_count >= 2;












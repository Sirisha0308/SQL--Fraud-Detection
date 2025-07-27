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
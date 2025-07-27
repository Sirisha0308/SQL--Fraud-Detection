1. SELECT COUNT(*) FROM transactions;
Purpose:
Counts the total number of transactions in the dataset.

2. SELECT * FROM transactions LIMIT 10;
Purpose:
Fetches the first 10 rows from the transactions table to preview the data.

3. SELECT * FROM transactions WHERE LoginAttempts > 3 ORDER BY LoginAttempts DESC;
Purpose:
Finds transactions where users attempted to log in more than 3 times, ordered by the number of attempts (suspicious behavior).

4.
SELECT AccountID, COUNT(DISTINCT Location) AS distinct_locations
FROM transactions
GROUP BY AccountID
HAVING distinct_locations > 3;
Purpose:
Finds accounts that made transactions from more than 3 different locations — possibly indicating fraud or account compromise.

5.
SELECT AccountID, COUNT(*) AS txn_count, 
       MIN(TransactionDate) AS first_txn, 
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 10000
GROUP BY AccountID
HAVING TIMESTAMPDIFF(MINUTE, MIN(TransactionDate), MAX(TransactionDate)) <= 180
   AND txn_count >=2;
Purpose:
Identifies accounts that made multiple high-value transactions (> ₹10,000) within a short time (≤ 180 minutes) — a classic sign of suspicious "bursting" behavior.

6.
SELECT *
FROM transactions
WHERE AccountBalance < 1000
 AND TransactionAmount > 5000
ORDER BY AccountID, TransactionDate;
Purpose:
Finds transactions where the account had a low balance but still performed high-value transactions — possibly overdrawn or suspicious.

7.
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
Purpose:
Detects accounts using multiple devices or IPs on the same day — indicating account sharing or compromise.

8.
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
Purpose:
Same as above, but without filtering. Gives a daily summary of how many unique IPs/devices accessed each account.

9. SELECT COUNT(*) FROM transactions WHERE TransactionAmount > 10000;
Purpose:
Simply counts how many high-value transactions (> ₹10,000) exist.
(Note: your dataset has none, so the result will be 0.)

10.
SELECT AccountID, COUNT(*) AS txn_count,
       MIN(TransactionDate) AS first_txn,
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 1000
GROUP BY AccountID
HAVING TIMESTAMPDIFF(MINUTE, MIN(TransactionDate), MAX(TransactionDate)) <= 180
   AND txn_count >= 2;
Purpose:
Detects accounts that made at least 2 high-value transactions (> ₹1000) within a short time window (≤ 3 hours).


11.
SELECT AccountID, COUNT(*) AS txn_count,
       MIN(TransactionDate) AS first_txn,
       MAX(TransactionDate) AS last_txn
FROM transactions
WHERE TransactionAmount > 1000
GROUP BY AccountID
HAVING txn_count >= 2;
Purpose:
Same as above, but without the time condition. Just finds accounts with 2 or more high-value transactions.







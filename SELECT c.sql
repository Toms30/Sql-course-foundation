SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
       --c.FirstName + ' ' +  c.LastName AS CustomerName,
       CONCAT(c.FirstName, + ' ' +  c.LastName) AS CustomerName,
       c.City,
       c.Company
FROM   Customer AS c
WHERE c.Company IS NOT NULL
--WHERE  c.City IN ('London', 'Paris', 'Rome', 'Berlin');
--WHERE c.lastname LIKE'S%'
ORDER BY C.Company ASC

SELECT
     c.Country,
     COUNT(*) AS NumberofCustomers
FROM Customer AS c
GROUP BY c.Country
ORDER BY NumberofCustomers DESC

-- Looking at invoices

SELECT 
       i.CustomerId,
       c.FirstName, 
       c.lastname,
       CONCAT(c.FirstName, ' ', c.lastname) AS CustomerName,
       SUM (i.Total) AS invoicetotal,
       COUNT(*) AS NumberofInvoices
FROM   Invoice AS i JOIN Customer AS c ON I.CustomerId = c.CustomerId
GROUP BY i.CustomerId, c.FirstName, c.LastName,  CONCAT(c.FirstName, ' ', c.lastname)
ORDER BY i.CustomerId;

--alternative way

SELECT 
     ibc.CustomerId,
     c.FirstName,
     c.LastName,
     CONCAT(c.FirstName, ' ', c.lastname) AS CustomerName,
     ibc.invoicetotal,
     ibc.NumberOfInvoices
 FROM (
SELECT
    i.CustomerId,
    SUM(i.Total) As InvoiceTotal,
    COUNT(*) AS NumberOfInvoices
FROM   Invoice AS i
group by i.CustomerId) AS ibc JOIN Customer C ON ibc.CustomerId = c.CustomerId

--Customer and Employee
SELECT e.EmployeeId, e.FirstName, e.LastName, 
     CONCAT (e.FirstName, ' ', e.lastname) AS EmployeeName,
     CONCAT (c.FirstName, ' ', c.lastname) AS CustomerName
from Employee AS e JOIN Customer AS c ON e.EmployeeId = c.SupportRepId


 
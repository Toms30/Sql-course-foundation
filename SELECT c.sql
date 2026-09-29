SELECT c.CustomerId,
       c.FirstName,
       c.LastName,
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
       SUM (i.Total) AS invoicetotal
FROM   Invoice AS i
GROUP BY i.CustomerId
ORDER BY i.CustomerId;
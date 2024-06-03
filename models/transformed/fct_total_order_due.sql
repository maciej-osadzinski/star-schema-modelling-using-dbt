select SalesOrderID, CustomerID, OrderDate, TotalDue
from {{ ref('staging1')}}
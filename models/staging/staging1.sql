select SOH.SalesOrderID, SOH.OrderDate, SOH.TaxAmt, SOH.TotalDue, 
    ST.Name as sales_territory_name, ST.SalesLastYear,
    C.AccountNumber,
    S.Name as store_name
from {{ source('test_source_1', 'SalesOrderHeader')}} as SOH

inner join {{ source('test_source_1', 'SalesTerritory')}} as ST 
    on SOH.TerritoryID = ST.TerritoryID

inner join {{ source('test_source_1', 'Customer')}} as C 
    on ST.TerritoryID = C.TerritoryID
    
inner join {{ source('test_source_1', 'Store')}} as S 
    on C.StoreID = S.BusinessEntityID
select SOH.SalesOrderID, SOH.OrderDate, SOH.TaxAmt, SOH.TotalDue, 
    ST.Name as sales_territory_name, ST.SalesLastYear,
    C.AccountNumber, C.CustomerID,
    S.Name as store_name,
    P.PersonType, P.FirstName, P.LastName, P.EmailPromotion,
    E.EmailAddress

from {{ source('test_source_sales', 'SalesOrderHeader')}} as SOH

inner join {{ source('test_source_sales', 'SalesTerritory')}} as ST 
    on SOH.TerritoryID = ST.TerritoryID

inner join {{ source('test_source_sales', 'Customer')}} as C 
    on ST.TerritoryID = C.TerritoryID
    
inner join {{ source('test_source_sales', 'Store')}} as S 
    on C.StoreID = S.BusinessEntityID

inner join {{ source('test_source_person', 'Person')}} as P
    on C.CustomerID = P.BusinessEntityID

inner join {{ source('test_source_person', 'EmailAddress')}} as E
    on P.BusinessEntityID = E.BusinessEntityID
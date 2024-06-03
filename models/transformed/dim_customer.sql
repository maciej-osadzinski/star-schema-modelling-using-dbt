select CustomerID, PersonType, FirstName, LastName,
    EmailPromotion, EmailAddress, AccountNumber
from {{ ref('staging1')}}
select store_name, AVG(TotalDue) as avg_total_due
from {{ ref('staging1')}}
group by store_name
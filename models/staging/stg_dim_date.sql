WITH generate_dates AS (
    select * from
        (
        select dateadd(day,a.rn-1, CAST('2000-01-01' AS DATE) ) date_value
        FROM
        (select  row_number () over (order by (select null) )rn from sys.objects o1, sys.objects o2) a 
        ) b
    where date_value between '2011-01-01' and '2014-12-31' 
),

date_dimension AS (
    SELECT
        date_value,
        YEAR(date_value) AS year,
        MONTH(date_value) AS month,
        DAY(date_value) AS day,
        DATENAME(WEEKDAY, date_value) AS weekday,
        DATENAME(MONTH, date_value) AS month_name,
        DATEPART(QUARTER, date_value) AS quarter,
        CASE
            WHEN DATEPART(WEEKDAY, date_value) IN (1, 7) THEN 'Weekend'
            ELSE 'Weekday'
        END AS weekday_weekend
    FROM
        generate_dates
)
SELECT
    *
FROM
    date_dimension
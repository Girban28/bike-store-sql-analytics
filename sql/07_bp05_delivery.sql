SELECT
    s.store_name,
    COUNT(o.order_id) AS total_shipped,
    ROUND(AVG(DATEDIFF(o.shipped_date, o.order_date)), 1) AS avg_days_to_ship,
    SUM(CASE WHEN
        o.shipped_date > o.required_date THEN 1 ELSE 0
    END) AS late_orders,
    ROUND(
        SUM(CASE WHEN
            o.shipped_date > o.required_date THEN 1 ELSE 0
        END) * 100.0
        / COUNT(o.order_id)
    , 1) AS late_pct
FROM orders o
JOIN stores s ON o.store_id = s.store_id
WHERE o.shipped_date IS NOT NULL
GROUP BY s.store_name
ORDER BY late_pct DESC;

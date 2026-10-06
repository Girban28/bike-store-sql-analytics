SELECT
    s.store_name,
    YEAR(o.order_date) AS year,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS total_revenue
FROM orders o
	JOIN order_items oi ON o.order_id = oi.order_id
	JOIN stores s ON o.store_id = s.store_id
WHERE o.order_status = 4
GROUP BY s.store_name, year
ORDER BY year, total_revenue DESC;

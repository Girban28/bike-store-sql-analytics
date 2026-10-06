SELECT
    c.category_name,
    ROUND(AVG(oi.discount) * 100, 1) AS avg_disc_pct,
    ROUND(SUM(oi.quantity * oi.list_price), 2) AS gross_revenue,
    ROUND(SUM(oi.quantity * oi.list_price * (1 - oi.discount)), 2) AS net_revenue,
    ROUND(
        SUM(oi.quantity * oi.list_price)
        - SUM(oi.quantity * oi.list_price * (1 - oi.discount))
    , 2) AS revenue_lost
FROM order_items oi
	JOIN products p ON oi.product_id = p.product_id
	JOIN categories c ON p.category_id = c.category_id
	JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 4
GROUP BY c.category_name
ORDER BY revenue_lost DESC;

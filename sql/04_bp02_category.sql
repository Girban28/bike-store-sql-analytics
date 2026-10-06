SELECT
    c.category_name,
    SUM(oi.quantity) AS total_units,
    ROUND(
        SUM(oi.quantity * oi.list_price * (1 - oi.discount))
    , 2) AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.list_price * (1 - oi.discount)) * 100
        / SUM(SUM(oi.quantity * oi.list_price * (1 - oi.discount))) OVER()
    , 1) AS revenue_pct,
    ROUND(
        SUM(oi.quantity * oi.list_price * (1 - oi.discount))
        / SUM(oi.quantity)
    , 2) AS avg_revenue_per_unit,
    RANK() OVER (
        ORDER BY SUM(oi.quantity * oi.list_price * (1 - oi.discount)) DESC
    ) AS revenue_rank
FROM order_items oi
	JOIN products p ON oi.product_id = p.product_id
	JOIN categories c ON p.category_id = c.category_id
	JOIN orders o  ON oi.order_id = o.order_id
WHERE o.order_status = 4
GROUP BY c.category_name
ORDER BY total_revenue DESC;

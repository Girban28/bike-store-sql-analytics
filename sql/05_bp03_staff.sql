SELECT
    CONCAT(st.first_name, ' ', st.last_name) AS staff_name,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        SUM(oi.quantity * oi.list_price * (1 - oi.discount))
    , 2) AS total_revenue,
    ROUND(
        SUM(oi.quantity * oi.list_price * (1 - oi.discount))
        / COUNT(DISTINCT o.order_id)
    , 2) AS avg_per_order,
    DENSE_RANK() OVER (
        PARTITION BY s.store_id
        ORDER BY SUM(oi.quantity * oi.list_price * (1 - oi.discount)) DESC
    ) AS rank_in_store
FROM orders o
	JOIN order_items oi ON o.order_id = oi.order_id
	JOIN staffs st ON o.staff_id = st.staff_id
	JOIN stores s  ON o.store_id = s.store_id
WHERE o.order_status = 4
GROUP BY st.staff_id, staff_name, s.store_id, s.store_name
ORDER BY s.store_name, rank_in_store;

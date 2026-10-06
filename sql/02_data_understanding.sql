SELECT
    'brands' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN brand_id IS NULL THEN 1 ELSE 0 END) AS null_brand_id,
    SUM(CASE WHEN brand_name IS NULL THEN 1 ELSE 0 END) AS null_brand_name
FROM brands;

SELECT
    'categories' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS null_category_id,
    SUM(CASE WHEN category_name IS NULL THEN 1 ELSE 0 END) AS null_category_name
FROM categories;

SELECT
    'stores' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS null_store_id,
    SUM(CASE WHEN store_name IS NULL THEN 1 ELSE 0 END) AS null_store_name,
    SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS null_phone,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email
FROM stores;

SELECT
    'customers' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN first_name IS NULL THEN 1 ELSE 0 END) AS null_first_name,
    SUM(CASE WHEN last_name IS NULL THEN 1 ELSE 0 END) AS null_last_name,
    SUM(CASE WHEN phone IS NULL THEN 1 ELSE 0 END) AS null_phone,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email,
    SUM(CASE WHEN street IS NULL THEN 1 ELSE 0 END) AS null_street,
    SUM(CASE WHEN city IS NULL THEN 1 ELSE 0 END) AS null_city,
    SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state
FROM customers;

SELECT
    'products' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
    SUM(CASE WHEN brand_id IS NULL THEN 1 ELSE 0 END) AS null_brand_id,
    SUM(CASE WHEN category_id IS NULL THEN 1 ELSE 0 END) AS null_category_id,
    SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price
FROM products;

SELECT
    'staffs' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN staff_id IS NULL THEN 1 ELSE 0 END) AS null_staff_id,
    SUM(CASE WHEN email IS NULL THEN 1 ELSE 0 END) AS null_email,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS null_store_id,
    SUM(CASE WHEN manager_id IS NULL THEN 1 ELSE 0 END) AS null_manager_id
FROM staffs;

SELECT
    'orders' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS null_order_status,
    SUM(CASE WHEN shipped_date IS NULL THEN 1 ELSE 0 END) AS null_shipped_date,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS null_store_id,
    SUM(CASE WHEN staff_id IS NULL THEN 1 ELSE 0 END) AS null_staff_id
FROM orders;

SELECT
    'order_items' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
    SUM(CASE WHEN list_price IS NULL THEN 1 ELSE 0 END) AS null_list_price,
    SUM(CASE WHEN discount IS NULL THEN 1 ELSE 0 END) AS null_discount
FROM order_items;

SELECT
    'stocks' AS table_name,
    COUNT(*) AS total_rows,
    SUM(CASE WHEN store_id IS NULL THEN 1 ELSE 0 END) AS null_store_id,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity
FROM stocks;

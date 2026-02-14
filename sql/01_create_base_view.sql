CREATE OR REPLACE VIEW `my-project-the-look.thelook_portfolio.v_base` AS
WITH inv_cost AS (
  SELECT product_id, AVG(cost) AS avg_unit_cost
  FROM `bigquery-public-data.thelook_ecommerce.inventory_items`
  GROUP BY product_id
)
SELECT
  oi.id AS order_item_id,
  oi.order_id,
  o.user_id,
  DATE(o.created_at) AS order_date,
  DATE_TRUNC(DATE(o.created_at), MONTH) AS order_month,

  oi.product_id,
  p.category,
  p.brand,
  p.name AS product_name,

  oi.sale_price,
  p.retail_price,
  SAFE_DIVIDE(p.retail_price - oi.sale_price, p.retail_price) AS discount_pct,

  ic.avg_unit_cost AS est_unit_cost,
  (oi.sale_price - ic.avg_unit_cost) AS est_unit_profit,

  oi.status,
  oi.created_at AS item_created_at,
  oi.shipped_at,
  oi.delivered_at,
  oi.returned_at,
  DATE_DIFF(DATE(oi.delivered_at), DATE(oi.created_at), DAY) AS delivery_days
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.orders` o
  ON oi.order_id = o.order_id
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
LEFT JOIN inv_cost ic
  ON ic.product_id = oi.product_id;

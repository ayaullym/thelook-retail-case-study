CREATE OR REPLACE TABLE `my-project-the-look.thelook_portfolio.rfm_segments` AS
WITH user_orders AS (
  SELECT
    user_id,
    order_id,
    DATE(created_at) AS order_date
  FROM `bigquery-public-data.thelook_ecommerce.orders`
  WHERE DATE(created_at) BETWEEN '2019-01-01' AND '2024-12-31'
),
rf AS (
  SELECT
    user_id,
    DATE_DIFF(DATE '2024-12-31', MAX(order_date), DAY) AS recency,
    COUNT(DISTINCT order_id) AS frequency
  FROM user_orders
  GROUP BY user_id
),
m AS (
  SELECT
    o.user_id,
    SUM(oi.sale_price) AS monetary
  FROM `bigquery-public-data.thelook_ecommerce.orders` o
  JOIN `bigquery-public-data.thelook_ecommerce.order_items` oi
    ON oi.order_id = o.order_id
  WHERE DATE(o.created_at) BETWEEN '2019-01-01' AND '2024-12-31'
  GROUP BY o.user_id
),
rfm AS (
  SELECT
    rf.user_id,
    rf.recency,
    rf.frequency,
    m.monetary
  FROM rf
  JOIN m USING (user_id)
),
scored AS (
  SELECT
    *,
    NTILE(4) OVER (ORDER BY recency ASC) AS r_quartile,     -- low recency = best
    NTILE(4) OVER (ORDER BY frequency DESC) AS f_quartile,  -- high frequency = best
    NTILE(4) OVER (ORDER BY monetary DESC) AS m_quartile    -- high monetary = best
  FROM rfm
)
SELECT
  user_id,
  recency,
  frequency,
  monetary,
  (5 - r_quartile) AS r_score,
  f_quartile AS f_score,
  m_quartile AS m_score,
  ((5 - r_quartile) * 100 + f_quartile * 10 + m_quartile) AS rfm_score,
  CASE
    WHEN ((5 - r_quartile) * 100 + f_quartile * 10 + m_quartile) >= 444 THEN 'Champions'
    WHEN ((5 - r_quartile) * 100 + f_quartile * 10 + m_quartile) >= 344 THEN 'Loyal Customers'
    WHEN ((5 - r_quartile) * 100 + f_quartile * 10 + m_quartile) >= 244 THEN 'Potential Loyalists'
    ELSE 'At Risk'
  END AS rfm_segment
FROM scored;

CREATE OR REPLACE TABLE `my-project-the-look.thelook_portfolio.kpi_monthly` AS
SELECT
  order_month,
  COUNT(DISTINCT order_id) AS orders,
  COUNT(*) AS units,
  SUM(sale_price) AS revenue,
  SUM(est_unit_cost) AS est_cost,
  SUM(est_unit_profit) AS est_gross_profit,
  SAFE_DIVIDE(SUM(est_unit_profit), SUM(sale_price)) AS est_gross_margin_pct,
  SAFE_DIVIDE(COUNTIF(returned_at IS NOT NULL), COUNT(*)) AS return_rate,
  AVG(delivery_days) AS avg_delivery_days
FROM `my-project-the-look..thelook_portfolio.v_base`
WHERE order_date BETWEEN '2019-01-01' AND '2024-12-31'
GROUP BY order_month
ORDER BY order_month;
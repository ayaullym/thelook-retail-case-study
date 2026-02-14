CREATE OR REPLACE TABLE `my-project-the-look.thelook_portfolio.category_health` AS
SELECT
  category,
  COUNT(DISTINCT order_id) AS orders,
  COUNT(*) AS units,
  SUM(sale_price) AS revenue,
  SUM(est_unit_profit) AS est_gross_profit,
  SAFE_DIVIDE(SUM(est_unit_profit), SUM(sale_price)) AS est_margin_pct,
  SAFE_DIVIDE(COUNTIF(returned_at IS NOT NULL), COUNT(*)) AS return_rate,
  AVG(discount_pct) AS avg_discount_pct
FROM `my-project-the-look.thelook_portfolio.v_base`
WHERE order_date BETWEEN '2019-01-01' AND '2024-12-31'
GROUP BY category
ORDER BY est_gross_profit DESC;

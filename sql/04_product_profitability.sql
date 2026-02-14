CREATE OR REPLACE TABLE `my-project-the-look.thelook_portfolio.product_profitability_ranked` AS
WITH prod AS (
  SELECT
    product_id,
    product_name,
    category,
    brand,
    COUNT(*) AS units_sold,
    SUM(sale_price) AS revenue,
    SUM(est_unit_profit) AS est_gross_profit,
    SAFE_DIVIDE(SUM(est_unit_profit), SUM(sale_price)) AS est_margin_pct,
    SAFE_DIVIDE(COUNTIF(returned_at IS NOT NULL), COUNT(*)) AS return_rate
  FROM `my-project-the-look.thelook_portfolio.v_base`
  WHERE order_date BETWEEN '2019-01-01' AND '2024-12-31'
  GROUP BY product_id, product_name, category, brand
)
SELECT
  *,
  DENSE_RANK() OVER (PARTITION BY category ORDER BY est_gross_profit DESC) AS profit_rank_in_category,
  DENSE_RANK() OVER (PARTITION BY category ORDER BY return_rate DESC) AS return_rank_in_category
FROM prod
WHERE units_sold >= 10;

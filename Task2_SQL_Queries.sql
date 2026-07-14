EXPLAIN ANALYZE
   SELECT state, AVG(total_day_minutes)
   FROM churn_data
   GROUP BY state;
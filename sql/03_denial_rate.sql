.headers on
.mode column

-- denial rate by county, home purchase / first lien / primary residence
SELECT
  county_code,
  COUNT(*) AS n,
  ROUND(100.0*SUM(CASE WHEN action_taken='3' THEN 1 ELSE 0 END)/COUNT(*),1) AS denial_rate
FROM base
GROUP BY county_code
HAVING COUNT(*) >= 500
ORDER BY denial_rate DESC;

-- 03_denial_rate.sql
-- Question: Which counties deny the most mortgage applications?
-- Answer: The Bronx at 21.3%, highest of any county in New York State.
-- Suffolk, the largest county in the data, is 8.4%.

.headers on
.mode column

-- Denial Rate by County, Home Purchase / First Lien / Primary Residence
SELECT
  county_code,
  COUNT(*) AS n,
    ROUND(100.0 * SUM(CASE WHEN action_taken = '3' THEN 1 ELSE 0 END) / COUNT(*), 1) AS denial_rate
FROM base
GROUP BY county_code
HAVING COUNT(*) >= 500
ORDER BY denial_rate DESC;

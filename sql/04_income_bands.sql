-- 04_income_bands.sql
-- Question: Does income explain the Bronx gap?
-- Answer: No, the gap holds in every income band and peaks at 2.6x in the
-- $100-$150k range. Even above $250k it is 12.4% vs 5.8%.

.headers on
.mode column

-- Income would appear to be the obvious explanation for the county gap.
-- This checks whether that is true.
-- Suffolk is the comparison since it has the most applications of any county
-- in the data and is the nearest large suburban market.
--
-- Income is reported in thousands so 50 = $50k.

SELECT
  CASE county_code
    WHEN '36005' THEN 'Bronx'
    WHEN '36103' THEN 'Suffolk'
  END AS county,
  CASE
    WHEN CAST(income AS REAL) < 50  THEN 'a. under 50k'
    WHEN CAST(income AS REAL) < 100 THEN 'b. 50-100k'
    WHEN CAST(income AS REAL) < 150 THEN 'c. 100-150k'
    WHEN CAST(income AS REAL) < 250 THEN 'd. 150-250k'
    ELSE 'e. 250k+'
  END AS income_band,
  COUNT(*) AS n,
  ROUND(100.0 * SUM(CASE WHEN action_taken = '3' THEN 1 ELSE 0 END) / COUNT(*), 1) AS denial_rate
FROM base
WHERE county_code IN ('36005', '36103')
  AND CAST(income AS REAL) > 0
GROUP BY county, income_band
ORDER BY income_band, county;

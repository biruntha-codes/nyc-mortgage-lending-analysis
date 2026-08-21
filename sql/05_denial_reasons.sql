.headers on
.mode column

-- the cfpb export uses hyphens on numbered columns (denial_reason-1,
-- aus-1, applicant_race-1) do they need square brackets, otherwise
-- sqlite reads the hyphen as minus.

-- why denials happen, bronx vs suffolk
SELECT 
CASE county_code WHEN '36005' THEN 'Bronx' 
		  WHEN '36103' THEN 'Suffolk'
		  END AS county,
[denial_reason-1] AS reason,
COUNT(*) AS n,
ROUND(100.0 * COUNT(*)/SUM(COUNT(*)) OVER (PARTITION BY county_code),1) AS pct_of_denials
FROM base
WHERE county_code IN ('36005','36103')
AND action_taken = '3'
GROUP BY county_code, reason
ORDER BY county, n DESC;

-- housing type as an alternative explanation. The Bronx has more 2-4
-- unit stock and that appraises differently. If it were driving the 
-- gap, single family should look similar across counties. It doesn;t.

SELECT
CASE county_code WHEN '36005' THEN 'Bronx' 
		 WHEN '36103' THEN 'Suffolk'
		 END AS county,
total_units,
COUNT(*) AS n,
ROUND(100.0 * SUM(CASE WHEN [denial_reason-1] = '4' THEN 1 ELSE 0 END) / COUNT(*),1) AS collateral_denial_rate
FROM base
WHERE county_code IN ('36005', '36103')
AND total_units IN ('1', '2', '3', '4')
GROUP BY county_code, total_units
ORDER BY county, total_units;

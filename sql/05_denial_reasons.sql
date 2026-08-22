-- 05_denial_reasons.sql
-- Question: Why do applications get denied and how does that differ by market?
-- Answer: The two biggest reasons swap places. Collateral is 40.9% of Bronx
-- denials against 15.6% in Suffolk. Debt-to-income is 45.0% in Suffolk against
-- 23.1% in the Bronx. Credit history sits at about 9% in both which is what
-- rules out borrower credit quality as the explanation.

.headers on
.mode column

-- The CFPB export uses hyphens on numbered columns (denial_reason-1,
-- derived_msa-md, aus-1) so they need square brackets, otherwise SQLite reads
-- the hyphen as minus.

-- Why denials happen: Bronx vs Suffolk
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

-- Housing type as an alternative explanation. The Bronx has more 2-4
-- unit stock and that appraises differently. If it were driving the
-- gap, single family should look similar across counties. It does not.

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

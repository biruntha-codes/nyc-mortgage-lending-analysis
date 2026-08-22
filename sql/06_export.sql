-- 06_export.sql
-- Builds the CSV the Tableau dashboard runs on.
--
-- One row per application rather than pre-aggregated so the dashboard can
-- slice by county, income band or denial reason without needing to go back
-- to SQL. HMDA codes are translated to labels here so nothing in Tableau
-- needs a lookup.
--
-- Demographic columns (derived_race, derived_ethnicity,
-- tract_minority_population_percent) are deliberately excluded. This analysis
-- is about denial reasons and property characteristics not applicant
-- demographics.
--
-- No dot commands in this file, they would corrupt the CSV. The header and
-- format flags go on the command line instead:
-- sqlite3 hmda.db -header -csv <sql/06_export.sql > tableau/dashboard_data.csv

-- Kept the 13 counties with enough volume to matter, the rest have been
-- bucketed.

SELECT
county_code,
CASE county_code
	WHEN '36005' THEN 'Bronx'
	WHEN '36047' THEN 'Brooklyn'
	WHEN '36061' THEN 'Manhattan'
	WHEN '36081' THEN 'Queens'
	WHEN '36085' THEN 'Staten Island'
	WHEN '36059' THEN 'Nassau'
	WHEN '36103' THEN 'Suffolk'
	WHEN '36119' THEN 'Westchester'
	WHEN '36087' THEN 'Rockland'
	WHEN '36079' THEN 'Putnam'
	WHEN '36029' THEN 'Erie'
	WHEN '36055' THEN 'Monroe'
	WHEN '36067' THEN 'Onondaga'
	WHEN '36001' THEN 'Albany'
	ELSE 'Other NY'
END AS county_name,
CASE
	WHEN county_code IN ('36005','36047','36061','36081','36085') THEN 'NYC'
	WHEN county_code IN ('36059','36103','36119','36087','36079') THEN 'Downstate suburbs'
	ELSE 'Rest of state'
END AS region,
-- 0/1 rather than keeping action_taken, because the average of this column is
-- the denial rate.
CASE WHEN action_taken = '3' THEN 1 ELSE 0 END AS denied,
CASE
	WHEN CAST(income AS REAL) <= 0 THEN 'unknown'
	WHEN CAST(income AS REAL) < 50 THEN 'a. under 50k'
	WHEN CAST(income AS REAL) < 100 THEN 'b. 50-100k'
	WHEN CAST(income AS REAL) < 150 THEN 'c. 100-150k'
	WHEN CAST(income AS REAL) < 250 THEN 'd. 150-250k'
	ELSE 'e. 250k+'
END AS income_band,
CAST(income AS REAL) AS income_thousands,
CASE [denial_reason-1]
	WHEN '1' THEN 'Debt-to-income'
	WHEN '2' THEN 'Employment history'
	WHEN '3' THEN 'Credit history'
	WHEN '4' THEN 'Collateral'
	WHEN '5' THEN 'Insufficient cash'
	WHEN '6' THEN 'Unverifiable information'
	WHEN '7' THEN 'Incomplete application'
	WHEN '8' THEN 'Mortgage insurance denied'
	WHEN '9' THEN 'Other'
END AS denial_reason,
total_units,
CAST(loan_amount AS REAL) AS loan_amount,
NULLIF(CAST(loan_to_value_ratio AS REAL), 0) AS ltv
FROM base;


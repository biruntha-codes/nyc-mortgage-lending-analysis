-- 01_profile.sql
-- Question: What is actually in the raw file before filtering anything?
-- Answer: Only 45% of records are home purchase loans.
-- 30% are second liens.
-- Suffolk and Nassau have more applications than any borough.

.headers on
.mode column

-- What kinds of loans are in here?
SELECT loan_purpose, COUNT(*) AS n
FROM lar
GROUP BY loan_purpose
ORDER BY n DESC;

-- Who lives in the property?
SELECT occupancy_type, COUNT(*) AS n
FROM lar
GROUP BY occupancy_type
ORDER BY n DESC;

-- First mortgages vs second liens
SELECT lien_status, COUNT(*) AS n
FROM lar
GROUP BY lien_status
ORDER BY n DESC;

-- Where in the state?
SELECT county_code, COUNT(*) AS n
FROM lar
GROUP BY county_code
ORDER BY n DESC
LIMIT 15;

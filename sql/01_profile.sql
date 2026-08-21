.headers on
.mode column

-- what kinds of loans are in here
SELECT loan_purpose, COUNT(*) AS n
FROM lar
GROUP BY loan_purpose
ORDER BY n DESC;

-- who lives in the property
SELECT occupancy_type, COUNT(*) AS n
FROM lar
GROUP BY occupancy_type
ORDER BY n DESC;

-- first mortgages vs second liens
SELECT lien_status, COUNT(*) AS n
FROM lar
GROUP BY lien_status
ORDER BY n DESC;

-- where in the state
SELECT county_code, COUNT(*) AS n
FROM lar
GROUP BY county_code
ORDER BY n DESC
LIMIT 15;

-- 02_clean.sql
-- Question: What population should I actually be measuring?
-- Answer: 116,940 records out of 320,184.
-- Home Purchase, First Lien, Primary Residence.
--
-- The unfiltered denial rate is 24%. Filtered it is 12%.
-- The difference is home improvement loans and second liens, which get judged
-- on different criteria and would make geography look like the cause of
-- something that is really product mix.

-- Note on the denominator: the extract was pulled with
-- actions_taken=1,2,3 only, so withdrawn (4), incomplete (5) and purchased
-- loans (6) never enter the data. Denial rate here is 3/(1+2+3),
-- meaning applications that actually got a decision.

DROP TABLE IF EXISTS base;

CREATE TABLE base AS
SELECT *
FROM lar
WHERE loan_purpose = '1'      -- home purchase
  AND lien_status = '1'       -- first lien
  AND occupancy_type = '1';   -- principal residence

SELECT COUNT(*) AS rows_remaining FROM base;

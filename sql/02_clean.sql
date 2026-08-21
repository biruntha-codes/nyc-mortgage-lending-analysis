-- narrowing to a comparable population: someone buying a home to live
-- in, with a normal first mortgage. home improvement loans and second
-- liens get judged on different criteria, and leaving them in pushes
-- the statewide rate to 24% for reasons that have nothing to do with
-- place.

DROP TABLE IF EXISTS base;

CREATE TABLE base AS
SELECT *
FROM lar
WHERE loan_purpose = '1'      -- home purchase
  AND lien_status = '1'       -- first lien
  AND occupancy_type = '1';   -- principal residence

SELECT COUNT(*) AS rows_remaining FROM base;

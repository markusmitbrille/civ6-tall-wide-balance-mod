-- PopRequirements
-- Author: makak
-- DateCreated: 2019-11-30 14:22:19
--------------------------------------------------------------

-- this file adds custom requirements and requirement sets for population sizes

-- temporary table for population sizes
CREATE TABLE IF NOT EXISTS Mak_PopulationSizes
(
	Size	INT
);

-- insert values 1 to 50
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 50) 
INSERT INTO Mak_PopulationSizes (Size) SELECT val FROM t;

------------------
-- Requirements --
------------------

-- pop requirements
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'REQUIREMENT_CITY_HAS_X_POPULATION' FROM Mak_PopulationSizes;

--------------------------
-- RequirementArguments --
--------------------------

-- arguments for pop requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'Amount', Size FROM Mak_PopulationSizes;

---------------------
-- RequirementSets --
---------------------

-- requirement sets for pop sizes
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM Mak_PopulationSizes;

--------------------------------
-- RequirementSetRequirements --
--------------------------------

-- add pop size requirements to pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_PopulationSizes;

-------------
-- Cleanup --
-------------

-- drop temporary tables
DROP TABLE Mak_PopulationSizes;
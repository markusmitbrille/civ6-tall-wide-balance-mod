-- Author: makaki
-- DateCreated: 2019-11-23 12:14:20
-- Credit: p0kiehl for a SQL reference, Chrisy15 for helping him
----------------------------------------------------------------

-- create temporary table for population sizes
CREATE TABLE IF NOT EXISTS PopulationReference (
 Size INT
);

-- insert values 1 to 50
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 50) 
INSERT INTO PopulationReference (Size) SELECT val FROM t;

-----------
-- Types --
-----------

INSERT INTO Types (Type, Kind)
VALUES 
 ('MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', 'KIND_MODIFIER'),
 ('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'KIND_MODIFIER');

----------------------
-- DynamicModifiers --
----------------------

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES ('MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION');

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES ('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION');

------------------
-- Requirements --
------------------

INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'REQUIREMENT_CITY_HAS_X_POPULATION' FROM PopulationReference;

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES 
 ('MAK_REQUIRES_WORKSHOP', 'REQUIREMENT_CITY_HAS_BUILDING');

--------------------------
-- RequirementArguments --
--------------------------

INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'Amount', Size FROM PopulationReference;

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES 
 ('MAK_REQUIRES_WORKSHOP', 'BuildingType', 'BUILDING_WORKSHOP');

---------------------
-- RequirementSets --
---------------------

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM PopulationReference;

--------------------------------
-- RequirementSetRequirements --
--------------------------------

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM PopulationReference;

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'MAK_REQUIRES_WORKSHOP' FROM PopulationReference;

---------------
-- Modifiers --
---------------

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL);

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size FROM PopulationReference;

-----------------------
-- ModifierArguments --
-----------------------

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'YieldType', 'YIELD_PRODUCTION'),
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'Amount', 0.00);

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'YieldType', 'YIELD_PRODUCTION' FROM PopulationReference;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'Amount', 1.00 FROM PopulationReference;

-----------------------
-- DistrictModifiers --
-----------------------

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES ('DISTRICT_CITY_CENTER', 'MAK_BASE_PRODUCTION_FROM_POPULATION');

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT 'DISTRICT_CITY_CENTER', 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION' FROM PopulationReference;

-- drop temporary pop table
DROP TABLE PopulationReference;
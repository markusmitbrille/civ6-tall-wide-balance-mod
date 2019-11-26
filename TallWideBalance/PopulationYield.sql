-- PopulationYield
-- Author: makaki
-- DateCreated: 2019-11-23 12:14:20
--------------------------------------------------------------

-- this file deals with introducing bonus yields based on population
-- these yields either scale linearly or exponentially
-- credit goes to p0kiehl for a SQL reference, Chrisy15 for helping him

-- temporary table for population sizes
CREATE TABLE IF NOT EXISTS Mak_PopulationSizes (
 Size INT
);

-- insert values 1 to 50
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 50) 
INSERT INTO Mak_PopulationSizes (Size) SELECT val FROM t;

-- temporary table for building tiers
CREATE TABLE IF NOT EXISTS Mak_BuildingTiers (
 Name TEXT,
 Lin REAL,
 Exp REAL
);

INSERT INTO Mak_BuildingTiers (Name, Lin, Exp)
VALUES
 ('BUILDING_LIBRARY',					0.0,	0.0),
 ('BUILDING_UNIVERSITY',				0.0,	0.0),
 ('BUILDING_MADRASA',					0.0,	0.0),
 ('BUILDING_RESEARCH_LAB',				0.0,	0.0),
 ('BUILDING_AMPHITHEATER',				0.0,	0.0),
 ('BUILDING_MUSEUM_ART',				0.0,	0.0),
 ('BUILDING_MUSEUM_ARTIFACT',			0.0,	0.0),
 ('BUILDING_BROADCAST_CENTER',			0.0,	0.0),
 ('BUILDING_FILM_STUDIO',				0.0,	0.0),
 ('BUILDING_SHRINE',					0.0,	0.0),
 ('BUILDING_TEMPLE',					0.0,	0.0),
 ('BUILDING_STAVE_CHURCH',				0.0,	0.0),
 ('BUILDING_PRASAT',					0.0,	0.0),
 ('BUILDING_CATHEDRAL',					0.0,	0.0),
 ('BUILDING_GURDWARA',					0.0,	0.0),
 ('BUILDING_MEETING_HOUSE',				0.0,	0.0),
 ('BUILDING_MOSQUE',					0.0,	0.0),
 ('BUILDING_PAGODA',					0.0,	0.0),
 ('BUILDING_SYNAGOGUE',					0.0,	0.0),
 ('BUILDING_WAT',						0.0,	0.0),
 ('BUILDING_STUPA',						0.0,	0.0),
 ('BUILDING_DAR_E_MEHR',				0.0,	0.0),
 ('BUILDING_MARKET',					0.0,	0.0),
 ('BUILDING_SUKIENNICE',				0.0,	0.0),
 ('BUILDING_BANK',						0.0,	0.0),
 ('BUILDING_GRAND_BAZAAR',				0.0,	0.0),
 ('BUILDING_STOCK_EXCHANGE',			0.0,	0.0),
 ('BUILDING_WORKSHOP',					0.0,	0.0),
 ('BUILDING_FACTORY',					0.0,	0.0),
 ('BUILDING_ELECTRONICS_FACTORY',		0.0,	0.0),
 ('BUILDING_COAL_POWER_PLANT',			0.0,	0.0),
 ('BUILDING_FOSSIL_FUEL_POWER_PLANT',	0.0,	0.0),
 ('BUILDING_POWER_PLANT',				0.0,	0.0);

-----------
-- Types --
-----------

INSERT INTO Types (Type, Kind)
VALUES 
 ('MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', 'KIND_MODIFIER'),
 ('MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'KIND_MODIFIER'),
 ('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'KIND_MODIFIER');

----------------------
-- DynamicModifiers --
----------------------

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES 
 ('MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION'),
 ('MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION'),
 ('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION');

------------------
-- Requirements --
------------------

-- pop requirements
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'REQUIREMENT_CITY_HAS_X_POPULATION' FROM Mak_PopulationSizes;

-- TODO: district requirements

-- buildings requirements
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_'||Name, 'REQUIREMENT_CITY_HAS_BUILDING' FROM Mak_BuildingTiers;

--------------------------
-- RequirementArguments --
--------------------------

-- arguments for pop requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'Amount', Size FROM Mak_PopulationSizes;

-- TODO: arguments for district requirements

-- arguments for building requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_'||Name, 'BuildingType', Name FROM Mak_BuildingTiers;

---------------------
-- RequirementSets --
---------------------

-- TODO: requirement sets for districts only
-- TODO: requirement sets for districts and pop sizes

-- requirement sets for buildings only
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'REQUIREMENTSET_TEST_ALL' FROM Mak_BuildingTiers;

-- requirment sets for buildings and pop sizes
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM Mak_BuildingTiers, Mak_PopulationSizes;

--------------------------------
-- RequirementSetRequirements --
--------------------------------

-- TODO: add district requirements to district only requirement sets
-- TODO: add district and pop size requirements to district and pop size requirement sets

-- add building requirements to building only requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'MAK_REQUIRES_'||Name FROM Mak_BuildingTiers;

-- add pop size requirements to building and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_BuildingTiers, Mak_PopulationSizes;

-- add building requirements to building and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_'||Name FROM Mak_BuildingTiers, Mak_PopulationSizes;

---------------
-- Modifiers --
---------------

-- base modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL);

-- TODO: other base modifiers

-- TODO: linear district modifiers
-- TODO: exponential district modifiers

-- linear building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_ONLY' FROM Mak_BuildingTiers;

-- exponential building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size FROM Mak_BuildingTiers, Mak_PopulationSizes;

-----------------------
-- ModifierArguments --
-----------------------

-- TODO: all modifier arguments, example below

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'YieldType', 'YIELD_PRODUCTION'),
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'Amount', 0.00);

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'YieldType', 'YIELD_PRODUCTION' FROM Mak_PopulationSizes;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'Amount', 1.00 FROM Mak_PopulationSizes;

-----------------------
-- DistrictModifiers --
-----------------------

-- TODO: apply all modifiers for, examples below

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES ('DISTRICT_CITY_CENTER', 'MAK_BASE_PRODUCTION_FROM_POPULATION');

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT 'DISTRICT_CITY_CENTER', 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION' FROM Mak_PopulationSizes;

-- drop temporary tables
DROP TABLE Mak_PopulationSizes;
DROP TABLE Mak_BuildingTiers;
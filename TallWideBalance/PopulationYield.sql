-- PopulationYield
-- Author: makaki
-- DateCreated: 2019-11-23 12:14:20
--------------------------------------------------------------

-- this file deals with introducing bonus yields based on population
-- these yields either scale linearly or exponentially
-- credit goes to p0kiehl for a SQL reference, Chrisy15 for helping him

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

-- generate all pop requirements through the reference table
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'REQUIREMENT_CITY_HAS_X_POPULATION' FROM PopulationReference;

-- buildings requirements
INSERT INTO Requirements (RequirementId, RequirementType)
VALUES 
	('MAK_REQUIRES_SCIENCE_TIER_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_SCIENCE_TIER_2_1',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_SCIENCE_TIER_2_2',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_SCIENCE_TIER_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_CULTURE_TIER_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_CULTURE_TIER_2_1',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_CULTURE_TIER_2_2',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_CULTURE_TIER_3_1',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_CULTURE_TIER_3_2',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_2_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_2_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_2_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_4',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_5',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_6',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_7',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_8',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_FAITH_TIER_3_9',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PORT_TIER_1',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PORT_TIER_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PORT_TIER_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_GOLD_TIER_1_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_GOLD_TIER_1_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_GOLD_TIER_2_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_GOLD_TIER_2_3',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_GOLD_TIER_3_2',			'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_1',		'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_2_1',	'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_2_2',	'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_1',	'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_2',	'REQUIREMENT_CITY_HAS_BUILDING'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_3',	'REQUIREMENT_CITY_HAS_BUILDING');

--------------------------
-- RequirementArguments --
--------------------------

-- generate all arguments for pure pop requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'Amount', Size FROM PopulationReference;

-- arguments for building requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES 
	('MAK_REQUIRES_SCIENCE_TIER_1',			'BuildingType',	'BUILDING_LIBRARY'),
	('MAK_REQUIRES_SCIENCE_TIER_2_1',		'BuildingType',	'BUILDING_UNIVERSITY'),
	('MAK_REQUIRES_SCIENCE_TIER_2_2',		'BuildingType',	'BUILDING_MADRASA'),
	('MAK_REQUIRES_SCIENCE_TIER_3',			'BuildingType',	'BUILDING_RESEARCH_LAB'),
	('MAK_REQUIRES_CULTURE_TIER_1',			'BuildingType',	'BUILDING_AMPHITHEATER'),
	('MAK_REQUIRES_CULTURE_TIER_2_1',		'BuildingType',	'BUILDING_MUSEUM_ART'),
	('MAK_REQUIRES_CULTURE_TIER_2_2',		'BuildingType',	'BUILDING_MUSEUM_ARTIFACT'),
	('MAK_REQUIRES_CULTURE_TIER_3_1',		'BuildingType',	'BUILDING_BROADCAST_CENTER'),
	('MAK_REQUIRES_CULTURE_TIER_3_2',		'BuildingType',	'BUILDING_FILM_STUDIO'),
	('MAK_REQUIRES_FAITH_TIER_1',			'BuildingType',	'BUILDING_SHRINE'),
	('MAK_REQUIRES_FAITH_TIER_2_1',			'BuildingType',	'BUILDING_TEMPLE'),
	('MAK_REQUIRES_FAITH_TIER_2_2',			'BuildingType',	'BUILDING_STAVE_CHURCH'),
	('MAK_REQUIRES_FAITH_TIER_2_3',			'BuildingType',	'BUILDING_PRASAT'),
	('MAK_REQUIRES_FAITH_TIER_3_1',			'BuildingType',	'BUILDING_CATHEDRAL'),
	('MAK_REQUIRES_FAITH_TIER_3_2',			'BuildingType',	'BUILDING_GURDWARA'),
	('MAK_REQUIRES_FAITH_TIER_3_3',			'BuildingType',	'BUILDING_MEETING_HOUSE'),
	('MAK_REQUIRES_FAITH_TIER_3_4',			'BuildingType',	'BUILDING_MOSQUE'),
	('MAK_REQUIRES_FAITH_TIER_3_5',			'BuildingType',	'BUILDING_PAGODA'),
	('MAK_REQUIRES_FAITH_TIER_3_6',			'BuildingType',	'BUILDING_SYNAGOGUE'),
	('MAK_REQUIRES_FAITH_TIER_3_7',			'BuildingType',	'BUILDING_WAT'),
	('MAK_REQUIRES_FAITH_TIER_3_8',			'BuildingType',	'BUILDING_STUPA'),
	('MAK_REQUIRES_FAITH_TIER_3_9',			'BuildingType',	'BUILDING_DAR_E_MEHR'),
	('MAK_REQUIRES_PORT_TIER_1',			'BuildingType',	'BUILDING_LIGHTHOUSE'),
	('MAK_REQUIRES_PORT_TIER_2',			'BuildingType',	'BUILDING_SHIPYARD'),
	('MAK_REQUIRES_PORT_TIER_3',			'BuildingType',	'BUILDING_SEAPORT'),
	('MAK_REQUIRES_GOLD_TIER_1_2',			'BuildingType',	'BUILDING_MARKET'),
	('MAK_REQUIRES_GOLD_TIER_1_3',			'BuildingType',	'BUILDING_SUKIENNICE'),
	('MAK_REQUIRES_GOLD_TIER_2_2',			'BuildingType',	'BUILDING_BANK'),
	('MAK_REQUIRES_GOLD_TIER_2_3',			'BuildingType',	'BUILDING_GRAND_BAZAAR'),
	('MAK_REQUIRES_GOLD_TIER_3_2',			'BuildingType',	'BUILDING_STOCK_EXCHANGE'),
	('MAK_REQUIRES_PRODUCTION_TIER_1',		'BuildingType',	'BUILDING_WORKSHOP'),
	('MAK_REQUIRES_PRODUCTION_TIER_2_1',	'BuildingType',	'BUILDING_FACTORY'),
	('MAK_REQUIRES_PRODUCTION_TIER_2_2',	'BuildingType',	'BUILDING_ELECTRONICS_FACTORY'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_1',	'BuildingType',	'BUILDING_COAL_POWER_PLANT'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_2',	'BuildingType',	'BUILDING_FOSSIL_FUEL_POWER_PLANT'),
	('MAK_REQUIRES_PRODUCTION_TIER_3_3',	'BuildingType',	'BUILDING_POWER_PLANT');

---------------------
-- RequirementSets --
---------------------

-- TODO: implement requirement sets for all building/pop combinations

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM PopulationReference;

--------------------------------
-- RequirementSetRequirements --
--------------------------------

-- TODO: implement requirement set requirements for all building/pop combinations

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM PopulationReference;

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size, 'MAK_REQUIRES_PRODUCTION_TIER_1' FROM PopulationReference;

---------------
-- Modifiers --
---------------

-- TODO: implement modifiers for all yields

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL);

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_WORKSHOP_AND_POPULATION_'||Size FROM PopulationReference;

-----------------------
-- ModifierArguments --
-----------------------

-- TODO: implement modifier arguments for all yields

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

-- TODO: apply modifiers for all yields

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES ('DISTRICT_CITY_CENTER', 'MAK_BASE_PRODUCTION_FROM_POPULATION');

INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT 'DISTRICT_CITY_CENTER', 'MAK_PRODUCTION_FROM_WORKSHOP_AND_'||Size||'_POPULATION' FROM PopulationReference;

-- drop temporary pop table
DROP TABLE PopulationReference;
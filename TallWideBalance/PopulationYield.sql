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

-- temporary table for buildings
CREATE TABLE IF NOT EXISTS Mak_Buildings (
 Name	TEXT,
 Yield	TEXT,
 Lin	REAL,
 Exp	REAL
);

INSERT INTO Mak_Buildings (Name, Yield, Lin, Exp)
VALUES
 ('BUILDING_LIBRARY',					'YIELD_SCIENCE',	0.0,	0.0),
 ('BUILDING_UNIVERSITY',				'YIELD_SCIENCE',	0.0,	0.0),
 ('BUILDING_MADRASA',					'YIELD_SCIENCE',	0.0,	0.0),
 ('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',	0.0,	0.0),
 ('BUILDING_AMPHITHEATER',				'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_MARAE',						'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_MUSEUM_ART',				'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_MUSEUM_ARTIFACT',			'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',	0.0,	0.0),
 ('BUILDING_SHRINE',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_TEMPLE',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_STAVE_CHURCH',				'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_PRASAT',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_CATHEDRAL',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_GURDWARA',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_MEETING_HOUSE',				'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_MOSQUE',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_PAGODA',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_SYNAGOGUE',					'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_WAT',						'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_STUPA',						'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_DAR_E_MEHR',				'YIELD_FAITH',		0.0,	0.0),
 ('BUILDING_MARKET',					'YIELD_GOLD',		0.0,	0.0),
 ('BUILDING_SUKIENNICE',				'YIELD_GOLD',		0.0,	0.0),
 ('BUILDING_BANK',						'YIELD_GOLD',		0.0,	0.0),
 ('BUILDING_GRAND_BAZAAR',				'YIELD_GOLD',		0.0,	0.0),
 ('BUILDING_STOCK_EXCHANGE',			'YIELD_GOLD',		0.0,	0.0),
 ('BUILDING_WORKSHOP',					'YIELD_PRODUCTION',	0.0,	0.0),
 ('BUILDING_FACTORY',					'YIELD_PRODUCTION',	0.0,	0.0),
 ('BUILDING_ELECTRONICS_FACTORY',		'YIELD_PRODUCTION',	0.0,	0.0),
 ('BUILDING_COAL_POWER_PLANT',			'YIELD_PRODUCTION',	0.0,	0.0),
 ('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION',	0.0,	0.0),
 ('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',	0.0,	0.0);

-- temporary table for districts
CREATE TABLE IF NOT EXISTS Mak_Districts (
 Name	TEXT,
 Yield	TEXT,
 Lin	REAL,
 Exp	REAL
);

INSERT INTO Mak_Districts (Name, Yield, Lin, Exp)
VALUES
 ('DISTRICT_CAMPUS',			'YIELD_SCIENCE',	0.0,	0.0),
 ('DISTRICT_SEOWON',			'YIELD_SCIENCE',	0.0,	0.0),
 ('DISTRICT_THEATER',			'YIELD_CULTURE',	0.0,	0.0),
 ('DISTRICT_ACROPOLIS',			'YIELD_CULTURE',	0.0,	0.0),
 ('DISTRICT_HOLY_SITE',			'YIELD_FAITH',		0.0,	0.0),
 ('DISTRICT_LAVRA',				'YIELD_FAITH',		0.0,	0.0),
 ('DISTRICT_COMMERCIAL_HUB',	'YIELD_GOLD',		0.0,	0.0),
 ('DISTRICT_SUGUBA',			'YIELD_GOLD',		0.0,	0.0),
 ('DISTRICT_INDUSTRIAL_ZONE',	'YIELD_PRODUCTION',	0.0,	0.0),
 ('DISTRICT_HANSA',				'YIELD_PRODUCTION',	0.0,	0.0);

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

-- district requirements
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_'||Name, 'REQUIREMENT_CITY_HAS_DISTRICT' FROM Mak_Districts;

-- buildings requirements
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'MAK_REQUIRES_'||Name, 'REQUIREMENT_CITY_HAS_BUILDING' FROM Mak_Buildings;

--------------------------
-- RequirementArguments --
--------------------------

-- arguments for pop requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_POPULATION_'||Size, 'Amount', Size FROM Mak_PopulationSizes;

-- arguments for district requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_'||Name, 'DistrictType', Name FROM Mak_Districts;

-- arguments for building requirements
INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'MAK_REQUIRES_'||Name, 'BuildingType', Name FROM Mak_Buildings;

---------------------
-- RequirementSets --
---------------------

-- requirement sets for districts only
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'REQUIREMENTSET_TEST_ALL' FROM Mak_Districts;

-- requirement sets for districts and pop sizes
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM Mak_Districts, Mak_PopulationSizes;

-- requirement sets for buildings only
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'REQUIREMENTSET_TEST_ALL' FROM Mak_Buildings;

-- requirment sets for buildings and pop sizes
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'REQUIREMENTSET_TEST_ALL' FROM Mak_Buildings, Mak_PopulationSizes;

--------------------------------
-- RequirementSetRequirements --
--------------------------------

-- add district requirements to district only requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'MAK_REQUIRES_'||Name FROM Mak_Districts;

-- add pop size requirements to district and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_Districts, Mak_PopulationSizes;

-- add building requirements to district and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_'||Name FROM Mak_Districts, Mak_PopulationSizes;

-- add building requirements to building only requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_ONLY', 'MAK_REQUIRES_'||Name FROM Mak_Buildings;

-- add pop size requirements to building and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_Buildings, Mak_PopulationSizes;

-- add building requirements to building and pop size requirement sets
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size, 'MAK_REQUIRES_'||Name FROM Mak_Buildings, Mak_PopulationSizes;

---------------
-- Modifiers --
---------------

-- base modifiers (only faith, gold and production, since science and culture are handled in GlobalParameters)
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES 
 ('MAK_BASE_FAITH_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL),
 ('MAK_BASE_GOLD_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL),
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'MAK_MODIFIER_BASE_YIELD_FROM_POPULATION', NULL);

-- linear district modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_ONLY' FROM Mak_Districts;

-- exponential district modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size FROM Mak_Districts, Mak_PopulationSizes;

-- linear building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_ONLY' FROM Mak_Buildings;

-- exponential building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_'||Name||'_AND_POPULATION_'||Size FROM Mak_Buildings, Mak_PopulationSizes;

-----------------------
-- ModifierArguments --
-----------------------

-- base modifier arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES 
 ('MAK_BASE_FAITH_FROM_POPULATION', 'YieldType', 'YIELD_FAITH'),
 ('MAK_BASE_FAITH_FROM_POPULATION', 'Amount', 0.00),
 ('MAK_BASE_GOLD_FROM_POPULATION', 'YieldType', 'YIELD_GOLD'),
 ('MAK_BASE_GOLD_FROM_POPULATION', 'Amount', 0.00),
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'YieldType', 'YIELD_PRODUCTION'),
 ('MAK_BASE_PRODUCTION_FROM_POPULATION', 'Amount', 0.00);

-- linear district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'YieldType', Yield FROM Mak_Districts;

-- linear district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'Amount', Lin FROM Mak_Districts;

-- exponential district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'YieldType', Yield FROM Mak_Districts, Mak_PopulationSizes;

-- exponential district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'Amount', Exp FROM Mak_Districts, Mak_PopulationSizes;

-- linear building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'YieldType', Yield FROM Mak_Buildings;

-- linear building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'Amount', Lin FROM Mak_Buildings;

-- exponential building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'YieldType', Yield FROM Mak_Buildings, Mak_PopulationSizes;

-- exponential building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_AND_'||Size||'_POPULATION_YIELD', 'Amount', Exp FROM Mak_Buildings, Mak_PopulationSizes;

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
DROP TABLE Mak_Districts;
DROP TABLE Mak_Buildings;
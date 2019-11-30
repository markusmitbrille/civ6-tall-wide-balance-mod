-- PopulationYield
-- Author: makaki
-- DateCreated: 2019-11-23 12:14:20
--------------------------------------------------------------

-- this file deals with introducing bonus yields based on population
-- these yields either scale linearly or exponentially
-- credit goes to p0kiehl for a SQL reference, Chrisy15 for helping him

-----------
-- Setup --
-----------

-- temporary table for population sizes
CREATE TABLE IF NOT EXISTS Mak_PopulationSizes
(
	Size	INT
);

-- insert values 1 to 50
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 50) 
INSERT INTO Mak_PopulationSizes (Size) SELECT val FROM t;

-- temporary table for buildings
CREATE TABLE IF NOT EXISTS Mak_Buildings
(
	Name	TEXT,
	Yield	TEXT,
	Lin		REAL,
	Exp		REAL
);

INSERT INTO Mak_Buildings (Name, Yield, Lin, Exp)
VALUES
	('BUILDING_LIBRARY',					'YIELD_SCIENCE',		0.00,	0.05),
	('BUILDING_UNIVERSITY',					'YIELD_SCIENCE',		0.20,	0.12),
	('BUILDING_MADRASA',					'YIELD_SCIENCE',		0.20,	0.12),
	('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',		0.20,	0.19),
	('BUILDING_AMPHITHEATER',				'YIELD_CULTURE',		0.00,	0.05),
	('BUILDING_MARAE',						'YIELD_CULTURE',		0.00,	0.05),
	('BUILDING_MUSEUM_ART',					'YIELD_CULTURE',		0.40,	0.13),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_CULTURE',		0.40,	0.13),
	('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',		0.80,	0.22),
	('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',		0.80,	0.22),
	('BUILDING_SHRINE',						'YIELD_FAITH',			0.00,	0.05),
	('BUILDING_TEMPLE',						'YIELD_FAITH',			0.00,	0.11),
	('BUILDING_STAVE_CHURCH',				'YIELD_FAITH',			0.00,	0.11),
	('BUILDING_PRASAT',						'YIELD_FAITH',			0.00,	0.11),
	('BUILDING_CATHEDRAL',					'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_GURDWARA',					'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_MEETING_HOUSE',				'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_MOSQUE',						'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_PAGODA',						'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_SYNAGOGUE',					'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_WAT',						'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_STUPA',						'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_DAR_E_MEHR',					'YIELD_FAITH',			0.00,	0.18),
	('BUILDING_MARKET',						'YIELD_GOLD',			0.25,	0.04),
	('BUILDING_SUKIENNICE',					'YIELD_GOLD',			0.25,	0.04),
	('BUILDING_BANK',						'YIELD_GOLD',			0.95,	0.08),
	('BUILDING_GRAND_BAZAAR',				'YIELD_GOLD',			0.95,	0.08),
	('BUILDING_STOCK_EXCHANGE',				'YIELD_GOLD',			1.60,	0.20),
	('BUILDING_WORKSHOP',					'YIELD_PRODUCTION',		0.15,	0.01),
	('BUILDING_FACTORY',					'YIELD_PRODUCTION',		0.05,	0.01),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_PRODUCTION',		0.05,	0.01),
	('BUILDING_COAL_POWER_PLANT',			'YIELD_PRODUCTION',		0.40,	0.02),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION',		0.40,	0.02),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',		0.40,	0.02);

-- temporary table for districts
CREATE TABLE IF NOT EXISTS Mak_Districts
(
	Name	TEXT,
	Yield	TEXT,
	Lin		REAL,
	Exp		REAL
);

INSERT INTO Mak_Districts (Name, Yield, Lin, Exp)
VALUES
	('DISTRICT_CAMPUS',						'YIELD_SCIENCE',		0.20,	0.04),
	('DISTRICT_SEOWON',						'YIELD_SCIENCE',		0.20,	0.04),
	('DISTRICT_THEATER',					'YIELD_CULTURE',		0.60,	0.06),
	('DISTRICT_ACROPOLIS',					'YIELD_CULTURE',		0.60,	0.06),
	('DISTRICT_HOLY_SITE',					'YIELD_FAITH',			0.00,	0.03),
	('DISTRICT_LAVRA',						'YIELD_FAITH',			0.00,	0.03),
	('DISTRICT_COMMERCIAL_HUB',				'YIELD_GOLD',			1.10,	0.04),
	('DISTRICT_SUGUBA',						'YIELD_GOLD',			1.10,	0.04),
	('DISTRICT_INDUSTRIAL_ZONE',			'YIELD_PRODUCTION',		0.30,	0.00),
	('DISTRICT_HANSA',						'YIELD_PRODUCTION',		0.30,	0.00);

-----------
-- Types --
-----------

INSERT INTO Types (Type, Kind)
VALUES 
	('MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'KIND_MODIFIER'),
	('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'KIND_MODIFIER');

----------------------
-- DynamicModifiers --
----------------------

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES 
	('MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION'),
	('MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'COLLECTION_OWNER', 'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION');

---------------
-- Modifiers --
---------------

-- linear district modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', NULL FROM Mak_Districts;

-- exponential district modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_Districts, Mak_PopulationSizes;

-- linear building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'MAK_MODIFIER_LINEAR_YIELD_FROM_POPULATION', NULL FROM Mak_Buildings;

-- exponential building modifiers
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'MAK_MODIFIER_EXPONENTIAL_YIELD_FROM_POPULATION', 'MAK_REQUIRES_POPULATION_'||Size FROM Mak_Buildings, Mak_PopulationSizes;

-----------------------
-- ModifierArguments --
-----------------------

-- linear district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'YieldType', Yield FROM Mak_Districts;

-- linear district modifiers yield amount arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'Amount', Lin FROM Mak_Districts;

-- exponential district modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'YieldType', Yield FROM Mak_Districts, Mak_PopulationSizes;

-- exponential district modifiers yield amount arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'Amount', Exp FROM Mak_Districts, Mak_PopulationSizes;

-- linear building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'YieldType', Yield FROM Mak_Buildings;

-- linear building modifiers yield amount arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_LINEAR_YIELD', 'Amount', Lin FROM Mak_Buildings;

-- exponential building modifiers yield type arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'YieldType', Yield FROM Mak_Buildings, Mak_PopulationSizes;

-- exponential building modifiers yield amount arguments
INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'MAK_'||Name||'_POPULATION_'||Size||'_YIELD', 'Amount', Exp FROM Mak_Buildings, Mak_PopulationSizes;

-----------------------
-- DistrictModifiers --
-----------------------

-- linear district modifiers
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT Name,  'MAK_'||Name||'_LINEAR_YIELD' FROM Mak_Districts;

-- exponential district modifiers
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
SELECT Name,  'MAK_'||Name||'_POPULATION_'||Size||'_YIELD' FROM Mak_Districts, Mak_PopulationSizes;

-----------------------
-- BuildingModifiers --
-----------------------

-- linear district modifiers
INSERT INTO BuildingModifiers (DistrictType, ModifierId)
SELECT Name,  'MAK_'||Name||'_LINEAR_YIELD' FROM Mak_Buildings;

-- exponential district modifiers
INSERT INTO BuildingModifiers (BuildingType, ModifierId)
SELECT Name,  'MAK_'||Name||'_POPULATION_'||Size||'_YIELD' FROM Mak_Buildings, Mak_PopulationSizes;

-------------
-- Cleanup --
-------------

-- drop temporary tables
DROP TABLE Mak_PopulationSizes;
DROP TABLE Mak_Districts;
DROP TABLE Mak_Buildings;
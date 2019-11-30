-- YieldChanges
-- Author: makaki
-- DateCreated: 2019-11-23 12:12:54
--------------------------------------------------------------

-- this file deals with changing the yields of buildings and districts

-- temporary table for building yields
CREATE TABLE IF NOT EXISTS Mak_BuildingYields (
	Name		TEXT,
	Yield		TEXT,
	Value		REAL
);

INSERT INTO Mak_BuildingYields (Name, Yield, Value)
VALUES
	('BUILDING_LIBRARY',					'YIELD_SCIENCE',		2),
	('BUILDING_UNIVERSITY',					'YIELD_SCIENCE',		5),
	('BUILDING_MADRASA',					'YIELD_SCIENCE',		5),
	('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',		3),
	('BUILDING_AMPHITHEATER',				'YIELD_CULTURE',		2),
	('BUILDING_MARAE',						'YIELD_CULTURE',		2),
	('BUILDING_MUSEUM_ART',					'YIELD_CULTURE',		5),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_CULTURE',		5),
	('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',		3),
	('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',		3),
	('BUILDING_SHRINE',						'YIELD_FAITH',			2),
	('BUILDING_TEMPLE',						'YIELD_FAITH',			5),
	('BUILDING_STAVE_CHURCH',				'YIELD_FAITH',			5),
	('BUILDING_PRASAT',						'YIELD_FAITH',			5),
	('BUILDING_CATHEDRAL',					'YIELD_FAITH',			9),
	('BUILDING_GURDWARA',					'YIELD_FAITH',			9),
	('BUILDING_MEETING_HOUSE',				'YIELD_FAITH',			9),
	('BUILDING_MOSQUE',						'YIELD_FAITH',			9),
	('BUILDING_PAGODA',						'YIELD_FAITH',			9),
	('BUILDING_SYNAGOGUE',					'YIELD_FAITH',			9),
	('BUILDING_WAT',						'YIELD_FAITH',			9),
	('BUILDING_STUPA',						'YIELD_FAITH',			9),
	('BUILDING_DAR_E_MEHR',					'YIELD_FAITH',			9),
	('BUILDING_MARKET',						'YIELD_GOLD',			2),
	('BUILDING_SUKIENNICE',					'YIELD_GOLD',			2),
	('BUILDING_BANK',						'YIELD_GOLD',			5),
	('BUILDING_GRAND_BAZAAR',				'YIELD_GOLD',			5),
	('BUILDING_STOCK_EXCHANGE',				'YIELD_GOLD',			3),
	('BUILDING_WORKSHOP',					'YIELD_PRODUCTION',		2),
	('BUILDING_FACTORY',					'YIELD_PRODUCTION',		2),
	('BUILDING_SHOPPING_MALL',				'YIELD_GOLD',			4),
	('BUILDING_FOOD_MARKET',				'YIELD_FOOD',			4),
	('BUILDING_BARRACKS',					'YIELD_PRODUCTION',		2),
	('BUILDING_STABLE',						'YIELD_PRODUCTION',		2),
	('BUILDING_BASILIKOI_PAIDES',			'YIELD_PRODUCTION',		2),
	('BUILDING_ORDU',						'YIELD_PRODUCTION',		2),
	('BUILDING_ARMORY',						'YIELD_PRODUCTION',		5),
	('BUILDING_MILITARY_ACADEMY',			'YIELD_PRODUCTION',		8),
	('BUILDING_HANGAR',						'YIELD_PRODUCTION',		3),
	('BUILDING_AIRPORT',					'YIELD_PRODUCTION',		6),
	('BUILDING_ARENA',						'YIELD_CULTURE',		1),
	('BUILDING_TLACHTLI',					'YIELD_CULTURE',		2),
	('BUILDING_TLACHTLI',					'YIELD_FAITH',			3),
	('BUILDING_ZOO',						'YIELD_CULTURE',		2),
	('BUILDING_THERMAL_BATH',				'YIELD_CULTURE',		2),
	('BUILDING_THERMAL_BATH',				'YIELD_PRODUCTION',		3),
	('BUILDING_STADIUM',					'YIELD_CULTURE',		1),
	('BUILDING_FERRIS_WHEEL',				'YIELD_CULTURE',		1),
	('BUILDING_AQUARIUM',					'YIELD_CULTURE',		2),
	('BUILDING_AQUATICS_CENTER',			'YIELD_CULTURE',		1),
	('BUILDING_LIGHTHOUSE',					'YIELD_FOOD',			1),
	('BUILDING_SHIPYARD',					'YIELD_PRODUCTION',		1),
	('BUILDING_SEAPORT',					'YIELD_GOLD',			2);

-- temporary table for building yields when powered
CREATE TABLE IF NOT EXISTS Mak_BuildingPowerYields (
 Name			TEXT,
 Yield			TEXT,
 Value			REAL
);

INSERT INTO Mak_BuildingPowerYields (Name, Yield, Value)
VALUES
	('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',		6),
	('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',		6),
	('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',		6),
	('BUILDING_STOCK_EXCHANGE',				'YIELD_GOLD',			6),
	('BUILDING_FACTORY',					'YIELD_PRODUCTION',		3),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_CULTURE',		6),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_PRODUCTION',		6),
	('BUILDING_COAL_POWER_PLANT',			'YIELD_PRODUCTION',		9),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION',		9),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',		9),
	('BUILDING_AIRPORT',					'YIELD_PRODUCTION',		6),
	('BUILDING_STADIUM',					'YIELD_CULTURE',		3),
	('BUILDING_AQUATICS_CENTER',			'YIELD_CULTURE',		3),
	('BUILDING_SHOPPING_MALL',				'YIELD_GOLD',			6),
	('BUILDING_FOOD_MARKET',				'YIELD_FOOD',			6);

-- temporary table for building yields per era
CREATE TABLE IF NOT EXISTS Mak_BuildingYieldsPerEra (
	Name		TEXT,
	Yield		TEXT,
	Value		REAL
);

INSERT INTO Mak_BuildingYieldsPerEra (Name, Yield, Value)
VALUES
	('BUILDING_GRANARY',					'YIELD_FOOD',			1),
	('BUILDING_WATER_MILL',					'YIELD_FOOD',			1),
	('BUILDING_WATER_MILL',					'YIELD_PRODUCTION',		1);

-- temporary table for building yield district copies
CREATE TABLE IF NOT EXISTS Mak_BuildingDistrictYieldCopies (
	Name		TEXT,
	OldYield	TEXT,
	NewYield	TEXT
);

INSERT INTO Mak_BuildingDistrictYieldCopies (Name, OldYield, NewYield)
VALUES
	('BUILDING_WAT',						'YIELD_FAITH',			'YIELD_SCIENCE'),
	('BUILDING_DAR_E_MEHR',					'YIELD_FAITH',			'YIELD_CULTURE'),
	('BUILDING_SYNAGOGUE',					'YIELD_FAITH',			'YIELD_GOLD'),
	('BUILDING_MEETING_HOUSE',				'YIELD_FAITH',			'YIELD_PRODUCTION'),
	('BUILDING_GURDWARA',					'YIELD_FAITH',			'YIELD_FOOD'),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION',		'YIELD_PRODUCTION'),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',		'YIELD_PRODUCTION'),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION',		'YIELD_SCIENCE'),
	('BUILDING_LIGHTHOUSE',					'YIELD_GOLD',			'YIELD_FOOD'),
	('BUILDING_SHIPYARD',					'YIELD_GOLD',			'YIELD_PRODUCTION'),
	('BUILDING_SEAPORT',					'YIELD_GOLD',			'YIELD_GOLD');

---------------------------
-- Building_YieldChanges --
---------------------------

-- delete affected rows
DELETE Building_YieldChanges
FROM Building_YieldChanges JOIN Mak_BuildingYields ON Building_YieldChanges.BuildingType = Mak_BuildingYields.Name;

-- insert new values
INSERT INTO Building_YieldChanges (BuildingType, YieldType, YieldChange)
SELECT Name, Yield, Value FROM Mak_BuildingYields;

-----------------------------------------
-- Building_YieldChangesBonusWithPower --
-----------------------------------------

-- delete affected rows
DELETE Building_YieldChangesBonusWithPower
FROM Building_YieldChangesBonusWithPower JOIN Mak_BuildingPowerYields ON Building_YieldChangesBonusWithPower.BuildingType = Mak_BuildingPowerYields.Name;

-- insert new values
INSERT INTO Building_YieldChangesBonusWithPower (BuildingType, YieldType, YieldChange)
SELECT Name, Yield, Value FROM Mak_BuildingPowerYields;

---------------------------
-- Building_YieldsPerEra --
---------------------------

-- delete dar e mehr row
DELETE FROM Building_YieldsPerEra
WHERE BuildingType='BUILDING_DAR_E_MEHR'

-- delete affected rows
DELETE Building_YieldsPerEra
FROM Building_YieldsPerEra JOIN Mak_BuildingYieldsPerEra ON Building_YieldsPerEra.BuildingType = Mak_BuildingYieldsPerEra.Name;

-- insert new values
INSERT INTO Building_YieldsPerEra (BuildingType, YieldType, YieldChange)
SELECT Name, Yield, Value FROM Mak_BuildingYieldsPerEra;

----------------------------------
-- Building_YieldDistrictCopies --
----------------------------------

-- delete coal power plant row
DELETE FROM Building_YieldDistrictCopies
WHERE BuildingType='BUILDING_COAL_POWER_PLANT'

-- delete affected rows
DELETE Building_YieldDistrictCopies
FROM Building_YieldDistrictCopies JOIN Mak_BuildingDistrictYieldCopies ON Building_YieldDistrictCopies.BuildingType = Mak_BuildingDistrictYieldCopies.Name;

-- insert new values
INSERT INTO Building_YieldDistrictCopies (BuildingType, OldYieldType, NewYieldType)
SELECT Name, OldYield, NewYield FROM Mak_BuildingDistrictYieldCopies;

-------------
-- Cleanup --
-------------

-- drop temporary tables
DROP TABLE Mak_BuildingYields;
DROP TABLE Mak_BuildingPowerYields;
DROP TABLE Mak_BuildingYieldsPerEra;
DROP TABLE Mak_BuildingDistrictYieldCopies;

---------------
-- Buildings --
---------------

-- make food market a city center building
UPDATE Buildings
SET PrereqDistrict='DISTRICT_CITY_CENTER'
WHERE BuildingType='BUILDING_FOOD_MARKET';

-- make shopping mall a city center building
UPDATE Buildings
SET PrereqDistrict='DISTRICT_CITY_CENTER'
WHERE BuildingType='BUILDING_SHOPPING_MALL';

--------------------------------
-- MutuallyExclusiveBuildings --
--------------------------------

-- make food market non exclusive with shopping mall
DELETE MutuallyExclusiveBuildings
FROM MutuallyExclusiveBuildings
WHERE Building='BUILDING_FOOD_MARKET';

-- make shopping mall non exclusive with food market
DELETE MutuallyExclusiveBuildings
FROM MutuallyExclusiveBuildings
WHERE Building='BUILDING_SHOPPING_MALL';

-------------------
-- Buildings_XP2 --
-------------------

-- make factory require less energy
UPDATE Buildings_XP2
SET RequiredPower=1
WHERE BuildingType='BUILDING_FACTORY';

-- make electronics factory require less energy
UPDATE Buildings_XP2
SET RequiredPower=1
WHERE BuildingType='BUILDING_ELECTRONICS_FACTORY';

-- make research lab require less energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_RESEARCH_LAB';

-- make broadcast center require less energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_BROADCAST_CENTER';

-- make film studio require less energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_FILM_STUDIO';

-- make stock exchange require less energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_STOCK_EXCHANGE';

-- make airport require more energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_AIRPORT';

-- make food market require more energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_FOOD_MARKET';

-- make shopping mall require more energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_SHOPPING_MALL';

-- make research lab require less energy
UPDATE Buildings_XP2
SET RequiredPower=2
WHERE BuildingType='BUILDING_SHOPPING_MALL';

-- make coal power plant require energy
UPDATE Buildings_XP2
SET RequiredPower=3
WHERE BuildingType='BUILDING_COAL_POWER_PLANT';

-- make oil power plant require energy
UPDATE Buildings_XP2
SET RequiredPower=3
WHERE BuildingType='BUILDING_FOSSIL_FUEL_POWER_PLANT';

-- make nuclear power plant require energy
UPDATE Buildings_XP2
SET RequiredPower=3
WHERE BuildingType='BUILDING_POWER_PLANT';
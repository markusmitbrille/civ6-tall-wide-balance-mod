-- SpecialistChanges
-- Author: makak
-- DateCreated: 2019-11-30 15:00:06
--------------------------------------------------------------

-- this files deals with changing specialist capacity and yields

-- temporary table for district citizen yields
CREATE TABLE IF NOT EXISTS Mak_DistrictCitizenYields
(
	Name		TEXT,
	Yield		TEXT,
	Value		REAL
);

INSERT INTO Mak_DistrictCitizenYields (Name, Yield, Value)
VALUES
	('DISTRICT_CAMPUS',					'YIELD_SCIENCE',		3),
	('DISTRICT_SEOWON',					'YIELD_SCIENCE',		3),
	('DISTRICT_THEATER',				'YIELD_CULTURE',		3),
	('DISTRICT_ACROPOLIS',				'YIELD_CULTURE',		3),
	('DISTRICT_HOLY_SITE',				'YIELD_FAITH',			3),
	('DISTRICT_LAVRA',					'YIELD_FAITH',			3),
	('DISTRICT_COMMERCIAL_HUB',			'YIELD_GOLD',			3),
	('DISTRICT_SUGUBA',					'YIELD_GOLD',			3),
	('DISTRICT_INDUSTRIAL_ZONE',		'YIELD_FOOD',			3),
	('DISTRICT_HANSA',					'YIELD_FOOD',			3);

-- temporary table for building citizen yields
CREATE TABLE IF NOT EXISTS Mak_BuildingCitizenYields
(
	Name		TEXT,
	Yield		TEXT,
	Value		REAL
);

INSERT INTO Mak_BuildingCitizenYields (Name, Yield, Value)
VALUES
	('BUILDING_BARRACKS',				'YIELD_PRODUCTION',		2),
	('BUILDING_STABLE',					'YIELD_PRODUCTION',		2),
	('BUILDING_BASILIKOI_PAIDES',		'YIELD_PRODUCTION',		2),
	('BUILDING_ORDU',					'YIELD_PRODUCTION',		2),
	('BUILDING_ARMORY',					'YIELD_PRODUCTION',		1),
	('BUILDING_MILITARY_ACADEMY',		'YIELD_PRODUCTION',		1),
	('BUILDING_HANGAR',					'YIELD_GOLD',			3),
	('BUILDING_AIRPORT',				'YIELD_GOLD',			1),
	('BUILDING_LIGHTHOUSE',				'YIELD_FOOD',			3),
	('BUILDING_SHIPYARD',				'YIELD_PRODUCTION',		2),
	('BUILDING_SEAPORT',				'YIELD_GOLD',			2);

----------------------------------
-- District_CitizenYieldChanges --
----------------------------------

-- delete affected rows
DELETE District_CitizenYieldChanges
FROM District_CitizenYieldChanges JOIN Mak_DistrictCitizenYields ON District_CitizenYieldChanges.BuildingType = Mak_DistrictCitizenYields.Name;

-- insert new values
INSERT INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT Name, Yield, Value FROM Mak_DistrictCitizenYields;

----------------------------------
-- Building_CitizenYieldChanges --
----------------------------------

-- delete affected rows
DELETE Building_CitizenYieldChanges
FROM Building_CitizenYieldChanges JOIN Mak_BuildingCitizenYields ON Building_CitizenYieldChanges.BuildingType = Mak_BuildingCitizenYields.Name;

-- insert new values
INSERT INTO Building_CitizenYieldChanges (BuildingType, YieldType, YieldChange)
SELECT Name, Yield, Value FROM Mak_BuildingCitizenYields;

---------------
-- Buildings --
---------------

UPDATE Buildings
SET CitizenSlots = 1
WHERE BuildingType IN
(
	'BUILDING_LIBRARY',
	'BUILDING_AMPHITHEATER',
	'BUILDING_MARAE',
	'BUILDING_SHRINE',
	'BUILDING_MARKET',
	'BUILDING_SUKIENNICE',
	'BUILDING_WORKSHOP',
	'BUILDING_BARRACKS',
	'BUILDING_STABLE',
	'BUILDING_BASILIKOI_PAIDES',
	'BUILDING_ORDU',
	'BUILDING_ARMORY',
	'BUILDING_LIGHTHOUSE',
	'BUILDING_SHIPYARD'
);

UPDATE Buildings
SET CitizenSlots = 2
WHERE BuildingType IN
(
	'BUILDING_UNIVERSITY',
	'BUILDING_MADRASA',
	'BUILDING_MUSEUM_ART',
	'BUILDING_MUSEUM_ARTIFACT',
	'BUILDING_TEMPLE',
	'BUILDING_STAVE_CHURCH',
	'BUILDING_PRASAT',
	'BUILDING_BANK',
	'BUILDING_GRAND_BAZAAR',
	'BUILDING_FACTORY',
	'BUILDING_ELECTRONICS_FACTORY',
	'BUILDING_HANGAR'
);

UPDATE Buildings
SET CitizenSlots = 3
WHERE BuildingType IN
(
	'BUILDING_RESEARCH_LAB',
	'BUILDING_BROADCAST_CENTER',
	'BUILDING_FILM_STUDIO',
	'BUILDING_CATHEDRAL',
	'BUILDING_GURDWARA',
	'BUILDING_MEETING_HOUSE',
	'BUILDING_MOSQUE',
	'BUILDING_PAGODA',
	'BUILDING_SYNAGOGUE',
	'BUILDING_WAT',
	'BUILDING_STUPA',
	'BUILDING_DAR_E_MEHR',
	'BUILDING_STOCK_EXCHANGE',
	'BUILDING_MILITARY_ACADEMY',
	'BUILDING_AIRPORT',
	'BUILDING_SEAPORT'
);

-- BuilderChanges
-- Author: makak
-- DateCreated: 2019-12-18 9:38:47
--------------------------------------------------------------

-- this file deals with changes to builders and military engineers

-------------------------------------
-- Building_BuildChargeProductions --
-------------------------------------

-- truncate table
DELETE FROM Building_BuildChargeProductions;

INSERT INTO Building_BuildChargeProductions (BuildingType, UnitType, PercentProductionPerCharge)
VALUES
	('BUILDING_WALLS',			'UNIT_MILITARY_ENGINEER',	50),
	('BUILDING_CASTLE',			'UNIT_MILITARY_ENGINEER',	34),
	('BUILDING_STAR_FORT',		'UNIT_MILITARY_ENGINEER',	25),
	('BUILDING_FLOOD_BARRIER',	'UNIT_MILITARY_ENGINEER',	20);

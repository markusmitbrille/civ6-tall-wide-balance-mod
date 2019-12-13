-- GreatPersonPointChanges
-- Author: makak
-- DateCreated: 2019-12-13 17:59:58
--------------------------------------------------------------

-- this files deals with changing great person point generation

--------------------------------
-- District_GreatPersonPoints --
--------------------------------

-- truncate table
DELETE FROM District_GreatPersonPoints;

--------------------------------
-- Building_GreatPersonPoints --
--------------------------------

-- truncate table
DELETE FROM Building_GreatPersonPoints;

---------------------------------------
-- District_CitizenGreatPersonPoints --
---------------------------------------

-- truncate table
DELETE FROM District_CitizenGreatPersonPoints;

-- add great person points per specialist
INSERT INTO District_CitizenGreatPersonPoints (DistrictType, GreatPersonClassType, PointsPerTurn)
VALUES
	('DISTRICT_CAMPUS',					'GREAT_PERSON_CLASS_SCIENTIST',		1),
	('DISTRICT_SEOWON',					'GREAT_PERSON_CLASS_SCIENTIST',		1),
	('DISTRICT_THEATER',				'GREAT_PERSON_CLASS_WRITER',		1),
	('DISTRICT_ACROPOLIS',				'GREAT_PERSON_CLASS_WRITER',		1),
	('DISTRICT_LAVRA',					'GREAT_PERSON_CLASS_WRITER',		1),
	('DISTRICT_THEATER',				'GREAT_PERSON_CLASS_ARTIST',		1),
	('DISTRICT_ACROPOLIS',				'GREAT_PERSON_CLASS_ARTIST',		1),
	('DISTRICT_LAVRA',					'GREAT_PERSON_CLASS_ARTIST',		1),
	('DISTRICT_THEATER',				'GREAT_PERSON_CLASS_MUSICIAN',		1),
	('DISTRICT_ACROPOLIS',				'GREAT_PERSON_CLASS_MUSICIAN',		1),
	('DISTRICT_LAVRA',					'GREAT_PERSON_CLASS_MUSICIAN',		1),
	('DISTRICT_HOLY_SITE',				'GREAT_PERSON_CLASS_PROPHET',		1),
	('DISTRICT_LAVRA',					'GREAT_PERSON_CLASS_PROPHET',		1),
	('DISTRICT_COMMERCIAL_HUB',			'GREAT_PERSON_CLASS_MERCHANT',		1),
	('DISTRICT_SUGUBA',					'GREAT_PERSON_CLASS_MERCHANT',		1),
	('DISTRICT_INDUSTRIAL_ZONE',		'GREAT_PERSON_CLASS_ENGINEER',		1),
	('DISTRICT_HANSA',					'GREAT_PERSON_CLASS_ENGINEER',		1),
	('DISTRICT_ENCAMPMENT',				'GREAT_PERSON_CLASS_GENERAL',		1),
	('DISTRICT_IKANDA',					'GREAT_PERSON_CLASS_GENERAL',		1),
	('DISTRICT_HARBOR',					'GREAT_PERSON_CLASS_ADMIRAL',		1),
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'GREAT_PERSON_CLASS_ADMIRAL',		1),
	('DISTRICT_COTHON',					'GREAT_PERSON_CLASS_ADMIRAL',		1);

-- TradeChanges
-- Author: makak
-- DateCreated: 2019-11-23 12:44:13
--------------------------------------------------------------

-- this file deals with changing the yields of trade routes

-------------------------------
-- District_TradeRouteYields --
-------------------------------

-- truncate table
DELETE FROM District_TradeRouteYields;

-- fill it again
INSERT INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
VALUES
	('DISTRICT_CITY_CENTER',	'YIELD_FOOD',			 1.0,	 2.0,	 0.0),
	('DISTRICT_CITY_CENTER',	'YIELD_GOLD',			 0.0,	 0.0,	 3.0),
	('DISTRICT_AQUEDUCT',		'YIELD_GOLD',			 1.0,	 1.0,	 3.0),
	('DISTRICT_BATH',			'YIELD_GOLD',			 1.0,	 1.0,	 3.0),
	('DISTRICT_DAM',			'YIELD_GOLD',			 2.0,	 2.0,	 5.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_GOLD',			 1.0,	 1.0,	 3.0),
	('DISTRICT_AQUEDUCT',		'YIELD_FOOD',			 1.0,	-1.0,	-1.0),
	('DISTRICT_BATH',			'YIELD_FOOD',			 1.0,	-1.0,	-1.0),
	('DISTRICT_DAM',			'YIELD_FOOD',			 2.0,	-2.0,	-2.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_FOOD',			 2.0,	-2.0,	-2.0),
	('DISTRICT_AQUEDUCT',		'YIELD_PRODUCTION',		-1.0,	 1.0,	 1.0),
	('DISTRICT_BATH',			'YIELD_PRODUCTION',		-1.0,	 1.0,	 1.0),
	('DISTRICT_DAM',			'YIELD_PRODUCTION',		-2.0,	 2.0,	 2.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_PRODUCTION',		-2.0,	 2.0,	 2.0);
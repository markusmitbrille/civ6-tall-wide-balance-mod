-- TradeChanges
-- Author: makak
-- DateCreated: 2019-11-23 12:44:13
--------------------------------------------------------------

-- this file deals with changing the yields of trade routes

----------------------
-- GlobalParameters --
----------------------

UPDATE GlobalParameters
SET Value = 1
WHERE Name = 'TRADE_ROUTE_GOLD_PER_ORIGIN_DISTRICT';

UPDATE GlobalParameters
SET Value = 1
WHERE Name = 'TRADE_ROUTE_GOLD_PER_DESTINATION_DISTRICT';


-------------------------------
-- District_TradeRouteYields --
-------------------------------

-- truncate table
DELETE FROM District_TradeRouteYields;

-- fill it again
INSERT INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
VALUES
	('DISTRICT_CITY_CENTER',	'YIELD_FOOD',			 0.0,	 2.0,	 0.0),
	('DISTRICT_CITY_CENTER',	'YIELD_GOLD',			 0.0,	 0.0,	 4.0),
	('DISTRICT_AQUEDUCT',		'YIELD_GOLD',			 1.0,	 1.0,	 1.0),
	('DISTRICT_BATH',			'YIELD_GOLD',			 1.0,	 1.0,	 1.0),
	('DISTRICT_DAM',			'YIELD_GOLD',			 2.0,	 2.0,	 2.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_GOLD',			 1.0,	 1.0,	 1.0),
	('DISTRICT_MBANZA',			'YIELD_GOLD',			 1.0,	 1.0,	 1.0),
	('DISTRICT_AQUEDUCT',		'YIELD_FOOD',			 1.0,	-1.0,	-1.0),
	('DISTRICT_BATH',			'YIELD_FOOD',			 1.0,	-1.0,	-1.0),
	('DISTRICT_DAM',			'YIELD_FOOD',			 2.0,	-2.0,	-2.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_FOOD',			 2.0,	-2.0,	-2.0),
	('DISTRICT_MBANZA',			'YIELD_FOOD',			 2.0,	-2.0,	-2.0),
	('DISTRICT_AQUEDUCT',		'YIELD_PRODUCTION',		-1.0,	 1.0,	 1.0),
	('DISTRICT_BATH',			'YIELD_PRODUCTION',		-1.0,	 1.0,	 1.0),
	('DISTRICT_DAM',			'YIELD_PRODUCTION',		-2.0,	 2.0,	 2.0),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_PRODUCTION',		-2.0,	 2.0,	 2.0),
	('DISTRICT_MBANZA',			'YIELD_PRODUCTION',		-2.0,	 2.0,	 2.0);

--------------------
-- CivicModifiers --
--------------------

-- trade route capacity increases from civics
INSERT INTO District_TradeRouteYields (CivicType, ModifierId)
VALUES
	('CIVIC_GUILDS',		'CIVIC_GRANT_ONE_TRADE_ROUTE'),
	('CIVIC_COLONIALISM',	'CIVIC_GRANT_ONE_TRADE_ROUTE');

-------------------------
-- TechnologyModifiers --
-------------------------

-- trade route capacity increases from technologies
INSERT INTO District_TradeRouteYields (TechnologyType, ModifierId)
VALUES
	('TECH_CURRENCY',		'CIVIC_GRANT_ONE_TRADE_ROUTE'),
	('TECH_BANKING',		'CIVIC_GRANT_ONE_TRADE_ROUTE'),
	('TECH_ECONOMICS',		'CIVIC_GRANT_ONE_TRADE_ROUTE');

---------------
-- Modifiers --
---------------

-- modifiers for trade route increases from district and population
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES
	('MAK_COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	NULL),
	('MAK_COMMERCIAL_HUB_POPULATION_15_TRADE_ROUTE_CAPACITY',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'MAK_REQUIRES_POPULATION_15'),
	('MAK_COMMERCIAL_HUB_POPULATION_30_TRADE_ROUTE_CAPACITY',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'MAK_REQUIRES_POPULATION_30'),
	('MAK_COMMERCIAL_HUB_POPULATION_40_TRADE_ROUTE_CAPACITY',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'MAK_REQUIRES_POPULATION_40'),
	('MAK_COMMERCIAL_HUB_POPULATION_50_TRADE_ROUTE_CAPACITY',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	'MAK_REQUIRES_POPULATION_50');

-----------------------
-- ModifierArguments --
-----------------------

-- modifier arguments for trade route increases from district and population
INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('MAK_COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY',					'Amount',	1),
	('MAK_COMMERCIAL_HUB_POPULATION_15_TRADE_ROUTE_CAPACITY',	'Amount',	1),
	('MAK_COMMERCIAL_HUB_POPULATION_30_TRADE_ROUTE_CAPACITY',	'Amount',	1),
	('MAK_COMMERCIAL_HUB_POPULATION_40_TRADE_ROUTE_CAPACITY',	'Amount',	1),
	('MAK_COMMERCIAL_HUB_POPULATION_50_TRADE_ROUTE_CAPACITY',	'Amount',	1);

-----------------------
-- DistrictModifiers --
-----------------------

-- add modifiers to districts
INSERT INTO DistrictModifiers (DistrictType, ModifierId)
VALUES
	('DISTRICT_COMMERCIAL_HUB',		'MAK_COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_COMMERCIAL_HUB',		'MAK_COMMERCIAL_HUB_POPULATION_15_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_COMMERCIAL_HUB',		'MAK_COMMERCIAL_HUB_POPULATION_30_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_COMMERCIAL_HUB',		'MAK_COMMERCIAL_HUB_POPULATION_40_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_COMMERCIAL_HUB',		'MAK_COMMERCIAL_HUB_POPULATION_50_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_SUGUBA',				'MAK_COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_SUGUBA',				'MAK_COMMERCIAL_HUB_POPULATION_15_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_SUGUBA',				'MAK_COMMERCIAL_HUB_POPULATION_30_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_SUGUBA',				'MAK_COMMERCIAL_HUB_POPULATION_40_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_SUGUBA',				'MAK_COMMERCIAL_HUB_POPULATION_50_TRADE_ROUTE_CAPACITY');

----------------------------------------
-- Remove Market/Lighthouse Modifiers --
----------------------------------------

DELETE FROM BuildingModifiers
WHERE ModifierId = 'MARKET_TRADE_ROUTE_CAPACITY';

DELETE FROM BuildingModifiers
WHERE ModifierId = 'LIGHTHOUSE_TRADE_ROUTE_CAPACITY';

DELETE FROM ModifierArguments
WHERE ModifierId = 'MARKET_TRADE_ROUTE_CAPACITY';

DELETE FROM ModifierArguments
WHERE ModifierId = 'LIGHTHOUSE_TRADE_ROUTE_CAPACITY';

DELETE FROM Modifiers
WHERE ModifierId = 'MARKET_TRADE_ROUTE_CAPACITY';

DELETE FROM Modifiers
WHERE ModifierId = 'LIGHTHOUSE_TRADE_ROUTE_CAPACITY';

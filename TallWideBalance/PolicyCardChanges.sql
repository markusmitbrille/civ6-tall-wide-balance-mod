-- PolicyCardChanges
-- Author: makak
-- DateCreated: 2019-12-13 22:05:57
--------------------------------------------------------------

-- this file deals with changes policy cards

--------------------------
-- RequirementArguments --
--------------------------

-- change high population requirement (for Rationalism, Grand Opera, Free Market, Simultaneum)
UPDATE RequirementArguments
SET Value = 15
WHERE RequirementId = 'REQUIRES_CITY_HAS_HIGH_POPULATION' AND Name = 'Amount';

------------------
-- Urban Sprawl --
------------------

INSERT INTO Types (Type, Kind)
VALUES ('MAK_POLICY_URBAN_SPRAWL', 'KIND_POLICY');

INSERT INTO Policies (PolicyType, Name, Description, PrereqCivic, GovernmentSlotType)
VALUES ('MAK_POLICY_URBAN_SPRAWL', 'LOC_POLICY_URBAN_SPRAWL_NAME', 'LOC_POLICY_URBAN_SPRAWL_DESCRIPTION', 'CIVIC_URBANIZATION', 'SLOT_ECONOMIC');

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('MAK_BOOST_NEIGHBORHOOD_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION'),
	('MAK_BOOST_MBANZA_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('MAK_BOOST_NEIGHBORHOOD_PRODUCTION',	'DistrictType',		'DISTRICT_NEIGHBORHOOD'),
	('MAK_BOOST_NEIGHBORHOOD_PRODUCTION',	'Amount',			100),
	('MAK_BOOST_MBANZA_PRODUCTION',			'DistrictType',		'DISTRICT_MBANZA'),
	('MAK_BOOST_MBANZA_PRODUCTION',			'Amount',			100);

INSERT INTO PolicyModifiers (PolicyType, ModifierId)
VALUES
	('MAK_POLICY_URBAN_SPRAWL',		'MAK_BOOST_NEIGHBORHOOD_PRODUCTION'),
	('MAK_POLICY_URBAN_SPRAWL',		'MAK_BOOST_MBANZA_PRODUCTION');

-------------
-- Insulae --
-------------

--------------------
-- Medina Quarter --
--------------------

----------------
-- Liberalism --
----------------

--------------
-- New Deal --
--------------

----------------------
-- Public Transport --
----------------------

-- remove farm shit

DELETE FROM PolicyModifiers
WHERE ModifierId = 'PUBLICTRANSPORT_FARMREPLACEGOLD';

DELETE FROM ModifierArguments
WHERE ModifierId = 'PUBLICTRANSPORT_FARMREPLACEGOLD';

DELETE FROM Modifiers
WHERE ModifierId = 'PUBLICTRANSPORT_FARMREPLACEGOLD';

-- add amenities per neighborhood

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES
	('MAK_REQUIRES_DISTRICT_IS_NEIGHBORHOOD',		'REQUIREMENT_DISTRICT_TYPE_MATCHES'),
	('MAK_REQUIRES_DISTRICT_IS_MBANZA',				'REQUIREMENT_DISTRICT_TYPE_MATCHES');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES
	('MAK_REQUIRES_DISTRICT_IS_NEIGHBORHOOD',		'DistrictType',		'DISTRICT_NEIGHBORHOOD'),
	('MAK_REQUIRES_DISTRICT_IS_MBANZA',				'DistrictType',		'DISTRICT_MBANZA');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES
	('MAK_DISTRICT_IS_NEIGHBORHOOD_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
	('MAK_DISTRICT_IS_MBANZA_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES
	('MAK_DISTRICT_IS_NEIGHBORHOOD_REQUIREMENTS',	'MAK_REQUIRES_DISTRICT_IS_NEIGHBORHOOD'),
	('MAK_DISTRICT_IS_MBANZA_REQUIREMENTS',			'MAK_REQUIRES_DISTRICT_IS_MBANZA');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES
	('MAK_NEIGHBORHOOD_AMENITIES',		'MODIFIER_PLAYER_DISTRICT_ADJUST_DISTRICT_AMENITY',		'MAK_DISTRICT_IS_NEIGHBORHOOD_REQUIREMENTS'),
	('MAK_MBANZA_AMENITIES',			'MODIFIER_PLAYER_DISTRICT_ADJUST_DISTRICT_AMENITY',		'MAK_DISTRICT_IS_MBANZA_REQUIREMENTS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('MAK_NEIGHBORHOOD_AMENITIES',		'Amount',	1),
	('MAK_MBANZA_AMENITIES',			'Amount',	1);

INSERT INTO PolicyModifiers (PolicyType, ModifierId)
VALUES
	('POLICY_PUBLIC_TRANSPORT',			'MAK_NEIGHBORHOOD_AMENITIES'),
	('POLICY_PUBLIC_TRANSPORT',			'MAK_MBANZA_AMENITIES');

----------------------
-- Collectivization --
----------------------

UPDATE ModifierArguments
SET Value = 2
WHERE ModifierId = 'COLLECTIVIZATION_INTERNAL_TRADE_FOOD' AND Name = 'Amount';

UPDATE ModifierArguments
SET Value = 4
WHERE ModifierId = 'COLLECTIVIZATION_INTERNAL_TRADE_PRODUCTION' AND Name = 'Amount';

----------------------
-- Triangular Trade --
----------------------

-- remove faith

DELETE FROM PolicyModifiers
WHERE ModifierId = 'TRIANGULARTRADE_TRADEROUTEFAITH';

DELETE FROM ModifierArguments
WHERE ModifierId = 'TRIANGULARTRADE_TRADEROUTEFAITH';

DELETE FROM Modifiers
WHERE ModifierId = 'TRIANGULARTRADE_TRADEROUTEFAITH';

-- add food, production

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES
	('MAK_TRIANGULARTRADE_TRADEROUTEFOOD',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD'),
	('MAK_TRIANGULARTRADE_TRADEROUTEPRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('MAK_TRIANGULARTRADE_TRADEROUTEFOOD',			'YieldType',	'YIELD_FOOD'),
	('MAK_TRIANGULARTRADE_TRADEROUTEFOOD',			'Amount',		1),
	('MAK_TRIANGULARTRADE_TRADEROUTEPRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('MAK_TRIANGULARTRADE_TRADEROUTEPRODUCTION',	'Amount',		1);

INSERT INTO PolicyModifiers (PolicyType, ModifierId)
VALUES
	('POLICY_TRIANGULAR_TRADE',						'MAK_TRIANGULARTRADE_TRADEROUTEFOOD'),
	('POLICY_TRIANGULAR_TRADE',						'MAK_TRIANGULARTRADE_TRADEROUTEPRODUCTION');

---------------
-- Ecommerce --
---------------

UPDATE ModifierArguments
SET Value = 2
WHERE ModifierId = 'ECOMMERCE_TRADEROUTEPRODUCTION' AND Name = 'Amount';

UPDATE ModifierArguments
SET Value = 6
WHERE ModifierId = 'ECOMMERCE_TRADEROUTEGOLD' AND Name = 'Amount';

-- add food

INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('MAK_ECOMMERCE_TRADEROUTEFOOD', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES
	('MAK_ECOMMERCE_TRADEROUTEFOOD',				'YieldType',	'YIELD_FOOD'),
	('MAK_ECOMMERCE_TRADEROUTEFOOD',				'Amount',		2);

INSERT INTO PolicyModifiers (PolicyType, ModifierId)
VALUES ('POLICY_ECOMMERCE', 'ECOMMERCE_TRADEROUTEFOOD');

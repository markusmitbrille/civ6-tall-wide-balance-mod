-- HousingAmenitiesFood
-- Author: makak
-- DateCreated: 2019-11-30 16:52:02
--------------------------------------------------------------

-- this file deals with general changes to growth (food, housing, amenities)

----------------------
-- GlobalParameters --
----------------------

-- food and growth

UPDATE GlobalParameters
SET Value = 2		-- default 2
WHERE Name = 'CITY_FOOD_CONSUMPTION_PER_POPULATION';

UPDATE GlobalParameters
SET Value = 15		-- default 15
WHERE Name = 'CITY_GROWTH_THRESHOLD';

UPDATE GlobalParameters
SET Value = 8		-- default 8
WHERE Name = 'CITY_GROWTH_MULTIPLIER';

UPDATE GlobalParameters
SET Value = 1.5		-- default 1.5
WHERE Name = 'CITY_GROWTH_EXPONENT';

-- amenities

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_POP_PER_AMENITY';

UPDATE GlobalParameters
SET Value = 1
WHERE Name = 'CITY_AMENITIES_FOR_FREE';

-- housing growth consequences

UPDATE GlobalParameters
SET Value = 5
WHERE Name = 'CITY_HOUSING_LEFT_50PCT_GROWTH';

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_HOUSING_LEFT_25PCT_GROWTH';

UPDATE GlobalParameters
SET Value = 0
WHERE Name = 'CITY_HOUSING_LEFT_ZERO_GROWTH';

-- housing from water

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_POPULATION_NO_WATER';

UPDATE GlobalParameters
SET Value = 5
WHERE Name = 'CITY_POPULATION_COAST';

UPDATE GlobalParameters
SET Value = 8
WHERE Name = 'CITY_POPULATION_RIVER_LAKE';

UPDATE GlobalParameters
SET Value = 8
WHERE Name = 'CITY_POPULATION_AQUEDUCT_MIN';

UPDATE GlobalParameters
SET Value = 2
WHERE Name = 'CITY_POPULATION_AQUEDUCT_BOOST';

---------------
-- Buildings --
---------------

-- housing changes

UPDATE Buildings
SET Housing = 0;

UPDATE Buildings
SET Housing = 1
WHERE BuildingType IN
(
	'BUILDING_BARRACKS',
	'BUILDING_STABLE',
	'BUILDING_BASILIKOI_PAIDES',
	'BUILDING_ORDU',
	'BUILDING_ARMORY',
	'BUILDING_LIGHTHOUSE',
	'BUILDING_SHIPYARD'
);

UPDATE Buildings
SET Housing = 2
WHERE BuildingType IN
(
	'BUILDING_PALACE',
	'BUILDING_GRANARY',
	'BUILDING_SEWER',
	'BUILDING_MILITARY_ACADEMY',
	'BUILDING_AIRPORT',
	'BUILDING_HANGAR',
	'BUILDING_SEAPORT'
);

---------------
-- Districts --
---------------

-- make neighborhoods more expansive
UPDATE Districts
SET Cost = 81
WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';

-- make mbanza more expansive
UPDATE Districts
SET Cost = 41
WHERE DistrictType = 'DISTRICT_MBANZA';

-- make neighborhoods available earlier
UPDATE Districts
SET PrereqCivic = 'CIVIC_CIVIL_SERVICE'
WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';

-- housing changes

UPDATE Districts
SET Housing = 0;

UPDATE Districts
SET Housing = 1
WHERE DistrictType IN
(
	'DISTRICT_ENCAMPMENT',
	'DISTRICT_IKANDA',
	'DISTRICT_HARBOR',
	'DISTRICT_COTHON',
	'DISTRICT_ROYAL_NAVY_DOCKYARD'
);

UPDATE Districts
SET Housing = 3
WHERE DistrictType IN
(
	'DISTRICT_BATH',
	'DISTRICT_DAM'
);

UPDATE Districts
SET Housing = 4
WHERE DistrictType IN
(
	'DISTRICT_NEIGHBORHOOD',
	'DISTRICT_MBANZA'
);

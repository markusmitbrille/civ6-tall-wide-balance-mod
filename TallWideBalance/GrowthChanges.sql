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
SET Value = 2
WHERE Name = 'CITY_FOOD_CONSUMPTION_PER_POPULATION';

UPDATE GlobalParameters
SET Value = 15
WHERE Name = 'CITY_GROWTH_THRESHOLD';

UPDATE GlobalParameters
SET Value = 8
WHERE Name = 'CITY_GROWTH_MULTIPLIER';

UPDATE GlobalParameters
SET Value = 1.5
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

-- entertainment changes

UPDATE Buildings
SET Entertainment = 0;

UPDATE Buildings
SET Entertainment = 1
WHERE BuildingType IN
(
	'BUILDING_PALACE',
	'BUILDING_ARENA',
	'BUILDING_TLACHTLI',
	'BUILDING_ZOO',
	'BUILDING_STADIUM',
	'BUILDING_FERRIS_WHEEL',
	'BUILDING_AQUARIUM',
	'BUILDING_AQUATICS_CENTER',
	'BUILDING_STUPA',
	'BUILDING_SHOPPING_MALL'
	'BUILDING_GREAT_BATH',
);

UPDATE Buildings
SET Entertainment = 2
WHERE BuildingType IN
(
	'BUILDING_COLOSSEUM',
	'BUILDING_ALHAMBRA',
	'BUILDING_ESTADIO_DO_MARACANA',
	'BUILDING_THERMAL_BATH'
);

UPDATE Buildings
SET Entertainment = 3
WHERE BuildingType IN
(
	'BUILDING_GOLDEN_GATE_BRIDGE'
);

---------------
-- Districts --
---------------

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
SET Housing = 2
WHERE DistrictType IN
(
	'DISTRICT_BATH'
);

UPDATE Districts
SET Housing = 3
WHERE DistrictType IN
(
	'DISTRICT_DAM'
);

UPDATE Districts
SET Housing = 4
WHERE DistrictType IN
(
	'DISTRICT_NEIGHBORHOOD',
	'DISTRICT_MBANZA'
);

-- make neighborhoods available earlier
UPDATE Districts
SET PrereqCivic = 'CIVIC_FEUDALISM'
WHERE DistrictType = 'DISTRICT_NEIGHBORHOOD';

-- entertainment changes

UPDATE Districts
SET Entertainment = 0;

UPDATE Districts
SET Entertainment = 1
WHERE DistrictType IN
(
	'DISTRICT_BATH',
	'DISTRICT_ENTERTAINMENT_COMPLEX',
	'DISTRICT_STREET_CARNIVAL',
	'DISTRICT_WATER_ENTERTAINMENT_COMPLEX',
	'DISTRICT_WATER_STREET_CARNIVAL'
);

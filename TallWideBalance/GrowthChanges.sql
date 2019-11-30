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

-- housing

UPDATE GlobalParameters
SET Value = 5
WHERE Name = 'CITY_HOUSING_LEFT_50PCT_GROWTH';

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_HOUSING_LEFT_25PCT_GROWTH';

UPDATE GlobalParameters
SET Value = 0
WHERE Name = 'CITY_HOUSING_LEFT_ZERO_GROWTH';

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_POPULATION_NO_WATER';

UPDATE GlobalParameters
SET Value = 5
WHERE Name = 'CITY_POPULATION_COAST';

UPDATE GlobalParameters
SET Value = 7
WHERE Name = 'CITY_POPULATION_RIVER_LAKE';

UPDATE GlobalParameters
SET Value = 7
WHERE Name = 'CITY_POPULATION_AQUEDUCT_MIN';

UPDATE GlobalParameters
SET Value = 3
WHERE Name = 'CITY_POPULATION_AQUEDUCT_BOOST';


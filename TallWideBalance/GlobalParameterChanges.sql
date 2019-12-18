-- GlobalParameterChanges
-- Author: makak
-- DateCreated: 2019-11-23 16:57:10
--------------------------------------------------------------

-- this file deals with changing global parameters

----------------------
-- GlobalParameters --
----------------------

-- yields per pop

UPDATE GlobalParameters
SET Value = 0
WHERE Name = 'SCIENCE_PERCENTAGE_YIELD_PER_POP';

UPDATE GlobalParameters
SET Value = 0
WHERE Name = 'CULTURE_PERCENTAGE_YIELD_PER_POP';

-- districts

UPDATE GlobalParameters
SET Value = 5
WHERE Name = 'DISTRICT_POPULATION_REQUIRED_PER';
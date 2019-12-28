-- LocalizationChanges
-- Author: makak
-- DateCreated: 2019-12-18 11:55:17
--------------------------------------------------------------

--------------
-- Policies --
--------------

UPDATE Policies
SET Description = 'MAK_LOC_POLICY_PUBLIC_TRANSPORT_DESCRIPTION'
WHERE PolicyType = 'POLICY_PUBLIC_TRANSPORT';

UPDATE Policies
SET Description = 'MAK_LOC_POLICY_COLLECTIVIZATION_DESCRIPTION'
WHERE PolicyType = 'POLICY_COLLECTIVIZATION';

UPDATE Policies
SET Description = 'MAK_LOC_POLICY_TRIANGULAR_TRADE_DESCRIPTION'
WHERE PolicyType = 'POLICY_TRIANGULAR_TRADE';

UPDATE Policies
SET Description = 'MAK_LOC_POLICY_ECOMMERCE_DESCRIPTION'
WHERE PolicyType = 'POLICY_ECOMMERCE';

------------------
-- Technologies --
------------------

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_MINING_DESCRIPTION'
WHERE TechnologyType = 'TECH_MINING';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_MASONRY_DESCRIPTION'
WHERE TechnologyType = 'TECH_MASONRY';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_BRONZE_WORKING_DESCRIPTION'
WHERE TechnologyType = 'TECH_BRONZE_WORKING';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_ANIMAL_HUSBANDRY_DESCRIPTION'
WHERE TechnologyType = 'TECH_ANIMAL_HUSBANDRY';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_IRRIGATION_DESCRIPTION'
WHERE TechnologyType = 'TECH_IRRIGATION';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION'
WHERE TechnologyType = 'TECH_CELESTIAL_NAVIGATION';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_MILITARY_ENGINEERING_DESCRIPTION'
WHERE TechnologyType = 'TECH_MILITARY_ENGINEERING';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_INDUSTRIALIZATION_DESCRIPTION'
WHERE TechnologyType = 'TECH_INDUSTRIALIZATION';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_RADIO_DESCRIPTION'
WHERE TechnologyType = 'TECH_RADIO';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_PLASTICS_DESCRIPTION'
WHERE TechnologyType = 'TECH_PLASTICS';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_COMBINED_ARMS_DESCRIPTION'
WHERE TechnologyType = 'TECH_COMBINED_ARMS';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_CURRENCY_DESCRIPTION'
WHERE TechnologyType = 'TECH_CURRENCY';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_BANKING_DESCRIPTION'
WHERE TechnologyType = 'TECH_BANKING';

UPDATE Technologies
SET Description = 'MAK_LOC_TECH_ECONOMICS_DESCRIPTION'
WHERE TechnologyType = 'TECH_ECONOMICS';

------------
-- Civics --
------------

UPDATE Civics
SET Description = 'MAK_LOC_CIVIC_FOREIGN_TRADE_DESCRIPTION'
WHERE CivicType = 'CIVIC_FOREIGN_TRADE';

UPDATE Civics
SET Description = 'MAK_LOC_CIVIC_GUILDS_DESCRIPTION'
WHERE CivicType = 'CIVIC_GUILDS';

UPDATE Civics
SET Description = 'MAK_LOC_CIVIC_COLONIALISM_DESCRIPTION'
WHERE CivicType = 'CIVIC_COLONIALISM';

-----------
-- Units --
-----------

UPDATE Units
SET Description = 'MAK_LOC_UNIT_MILITARY_ENGINEER_DESCRIPTION'
WHERE UnitType = 'UNIT_MILITARY_ENGINEER';

---------------
-- Districts --
---------------

UPDATE Districts
SET Description = 'MAK_LOC_DISTRICT_COMMERCIAL_HUB_DESCRIPTION'
WHERE DistrictType = 'DISTRICT_COMMERCIAL_HUB';

UPDATE Districts
SET Description = 'MAK_LOC_DISTRICT_MBANZA_DESCRIPTION'
WHERE DistrictType = 'DISTRICT_MBANZA';

---------------
-- Buildings --
---------------

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_GRANARY_DESCRIPTION'
WHERE BuildingType = 'BUILDING_GRANARY';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_WATER_MILL_DESCRIPTION'
WHERE BuildingType = 'BUILDING_WATER_MILL';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_STADIUM_DESCRIPTION'
WHERE BuildingType = 'BUILDING_STADIUM';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_LIBRARY_DESCRIPTION'
WHERE BuildingType = 'BUILDING_LIBRARY';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_UNIVERSITY_DESCRIPTION'
WHERE BuildingType = 'BUILDING_UNIVERSITY';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_MADRASA_DESCRIPTION'
WHERE BuildingType = 'BUILDING_MADRASA';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_RESEARCH_LAB_DESCRIPTION'
WHERE BuildingType = 'BUILDING_RESEARCH_LAB';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_AMPHITHEATER_DESCRIPTION'
WHERE BuildingType = 'BUILDING_AMPHITHEATER';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_MUSEUM_ART_DESCRIPTION'
WHERE BuildingType = 'BUILDING_MUSEUM_ART';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_MUSEUM_ARTIFACT_DESCRIPTION'
WHERE BuildingType = 'BUILDING_MUSEUM_ARTIFACT';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION'
WHERE BuildingType = 'BUILDING_BROADCAST_CENTER';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_FILM_STUDIO_DESCRIPTION'
WHERE BuildingType = 'BUILDING_FILM_STUDIO';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_MARKET_DESCRIPTION'
WHERE BuildingType = 'BUILDING_MARKET';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_SUKIENNICE_DESCRIPTION'
WHERE BuildingType = 'BUILDING_SUKIENNICE';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_BANK_DESCRIPTION'
WHERE BuildingType = 'BUILDING_BANK';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION'
WHERE BuildingType = 'BUILDING_STOCK_EXCHANGE';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_WORKSHOP_DESCRIPTION'
WHERE BuildingType = 'BUILDING_WORKSHOP';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_FACTORY_DESCRIPTION'
WHERE BuildingType = 'BUILDING_FACTORY';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION'
WHERE BuildingType = 'BUILDING_ELECTRONICS_FACTORY';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_COAL_POWER_PLANT_DESCRIPTION'
WHERE BuildingType = 'BUILDING_COAL_POWER_PLANT';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DESCRIPTION'
WHERE BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';

UPDATE Buildings
SET Description = 'MAK_LOC_BUILDING_POWER_PLANT_DESCRIPTION'
WHERE BuildingType = 'BUILDING_POWER_PLANT';


-- remove special dar e mehr description
UPDATE Buildings
SET Description = NULL
WHERE BuildingType = 'LOC_BUILDING_DAR_E_MEHR_DESCRIPTION';
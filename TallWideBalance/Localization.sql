-- Localization
-- Author: makak
-- DateCreated: 2019-12-18 15:19:03
--------------------------------------------------------------

--------------
-- Policies --
--------------

-- Urban Sprawl
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES
	('en_US',	'LOC_POLICY_URBAN_SPRAWL_NAME',				'Urban Sprawl'),
	('en_US',	'LOC_POLICY_URBAN_SPRAWL_DESCRIPTION',		'+100% [ICON_Production] Production toward Municipality districts.');

-- Public Transport
UPDATE LocalizedText
SET Text = '+1 [ICON_Amenities] Amenity per Municipality district.'
WHERE Language = 'en_US' AND Tag = 'LOC_POLICY_PUBLIC_TRANSPORT_DESCRIPTION';

-- Collectivization
UPDATE LocalizedText
SET Text = '+2 [ICON_Food] Food and +4 [ICON_Production] Production from domestic [ICON_TradeRoute] Trade Routes.'
WHERE Language = 'en_US' AND Tag = 'LOC_POLICY_COLLECTIVIZATION_DESCRIPTION';

-- Triangular Trade
UPDATE LocalizedText
SET Text = '+1 [ICON_Food] Food, +1 [ICON_Production] Production and +4 [ICON_Gold] Gold from all [ICON_TradeRoute] Trade Routes.'
WHERE Language = 'en_US' AND Tag = 'LOC_POLICY_TRIANGULAR_TRADE_DESCRIPTION';

-- Ecommerce
UPDATE LocalizedText
SET Text = '+2 [ICON_Food] Food, +2 [ICON_Production] Production and +6 [ICON_Gold] Gold from all [ICON_TradeRoute] Trade Routes.'
WHERE Language = 'en_US' AND Tag = 'LOC_POLICY_ECOMMERCE_DESCRIPTION';

-----------
-- Techs --
-----------

-- mining
UPDATE LocalizedText
SET Text = 'Allows the chopping of Woods. Allows the harvesting of [ICON_RESOURCE_AMBER] Amber, [ICON_RESOURCE_DIAMONDS] Diamonds, [ICON_RESOURCE_JADE] Jade, [ICON_RESOURCE_MERCURY] Mercury, [ICON_RESOURCE_SALT] Salt, [ICON_RESOURCE_SILVER] Silver, and [ICON_RESOURCE_COPPER] Copper.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_MINING_DESCRIPTION';

-- masonry
UPDATE LocalizedText
SET Text = 'Allows the harvesting of [ICON_RESOURCE_MARBLE] Marble, [ICON_RESOURCE_GYPSUM] Gypsum, and [ICON_RESOURCE_STONE] Stone.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_MASONRY_DESCRIPTION';

-- bronze working
UPDATE LocalizedText
SET Text = 'Allows the chopping of Rainforest. Allows the harvesting of [ICON_RESOURCE_IRON] Iron.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_BRONZE_WORKING_DESCRIPTION';

-- animal husbandry
UPDATE LocalizedText
SET Text = 'Allows the harvesting of [ICON_RESOURCE_HORSES] Horses, [ICON_RESOURCE_FURS] Furs, [ICON_RESOURCE_IVORY] Ivory, [ICON_RESOURCE_TRUFFLES] Truffles, [ICON_RESOURCE_CATTLE] Cattles, [ICON_RESOURCE_SHEEP] Sheep, and [ICON_RESOURCE_DEER] Deer.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_ANIMAL_HUSBANDRY_DESCRIPTION';

-- irrigation
UPDATE LocalizedText
SET Text = 'Allows the harvesting of [ICON_RESOURCE_CITRUS] Citrus, [ICON_RESOURCE_COCOA] Cocoa, [ICON_RESOURCE_COTTON] Cotton, [ICON_RESOURCE_DYES] Dyes, [ICON_RESOURCE_INCENSE] Incense, [ICON_RESOURCE_SILK] Silk, [ICON_RESOURCE_SPICES] Spices, [ICON_RESOURCE_SUGAR] Sugar, [ICON_RESOURCE_TEA] Tea, [ICON_RESOURCE_COFFEE] Coffee, [ICON_RESOURCE_TOBACCO] Tobacco, [ICON_RESOURCE_WINE] Wine, and [ICON_RESOURCE_BANANAS] Bananas.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_IRRIGATION_DESCRIPTION';

-- celestial navigation
UPDATE LocalizedText
SET Text = 'Allows Traders to embark. Allows the harvesting of [ICON_RESOURCE_TURTLES] Turtles, [ICON_RESOURCE_PEARLS] Pearls, [ICON_RESOURCE_WHALES] Whales, [ICON_RESOURCE_FISH] Fish, and [ICON_RESOURCE_CRABS] Crabs.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_CELESTIAL_NAVIGATION_DESCRIPTION';

-- military engineering
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_MILITARY_ENGINEERING_DESCRIPTION', 'Allows the harvesting of [ICON_RESOURCE_NITER] Niter.');

-- industrialization
UPDATE LocalizedText
SET Text = '+1 [ICON_Production] Production to Mines. Allows the harvesting of [ICON_RESOURCE_COAL] Coal.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_INDUSTRIALIZATION_DESCRIPTION';

-- radio
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_RADIO_DESCRIPTION', 'Allows the harvesting of [ICON_RESOURCE_ALUMINUM] Aluminum, [ICON_RESOURCE_ANTIQUITY_SITE] Antiquity Sites, and [ICON_RESOURCE_SHIPWRECK] Shipwrecks.');

-- plastics
UPDATE LocalizedText
SET Text = '+1 [ICON_Food] Food to Fishing Boats. Allows the harvesting of [ICON_RESOURCE_OIL] Oil.'
WHERE Language = 'en_US' AND Tag = 'LOC_TECH_PLASTICS_DESCRIPTION';

-- combined arms
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_COMBINED_ARMS_DESCRIPTION', 'Allows the harvesting of [ICON_RESOURCE_URANIUM] Uranium.');

-- currency
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_CURRENCY_DESCRIPTION', '+1 [ICON_TradeRoute] Trade Route capacity.');

-- banking
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_BANKING_DESCRIPTION', '+1 [ICON_TradeRoute] Trade Route capacity.');

-- economics
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_TECH_ECONOMICS_DESCRIPTION', '+1 [ICON_TradeRoute] Trade Route capacity.');

-- foreign trade
UPDATE LocalizedText
SET Text = '+1 [ICON_TradeRoute] Trade Route capacity.'
WHERE Language = 'en_US' AND Tag = 'LOC_CIVIC_FOREIGN_TRADE_DESCRIPTION';

-- guilds
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_CIVIC_GUILDS_DESCRIPTION', '+1 [ICON_TradeRoute] Trade Route capacity.');

-- colonialism
UPDATE LocalizedText
SET Text = '+1 [ICON_Production] Production to Fishing Boats. +1 [ICON_TradeRoute] Trade Route capacity.'
WHERE Language = 'en_US' AND Tag = 'LOC_CIVIC_COLONIALISM_DESCRIPTION';

-----------
-- Units --
-----------

-- military engineer
UPDATE LocalizedText
SET Text = 'Medieval era support unit. Requires an Armory to produce. Can construct Roads, Forts, Airstrips, and Missile Silo improvements. Can boost production of walls and flood barriers.'
WHERE Language = 'en_US' AND Tag = 'LOC_UNIT_MILITARY_ENGINEER_DESCRIPTION';

---------------
-- Districts --
---------------

-- commercial hub
UPDATE LocalizedText
SET Text = 'A district in your city specializing in finance and trade. +1 [ICON_TradeRoute] Trade Route capacity. Increases [ICON_TradeRoute] Trade Route capacity further, based on city [ICON_Citizen] population:[NEWLINE] • +1 [ICON_TradeRoute] Trade Route capacity at 15 [ICON_Citizen] population[NEWLINE] • +1 [ICON_TradeRoute] Trade Route capacity at 30 [ICON_Citizen] population[NEWLINE] • +1 [ICON_TradeRoute] Trade Route capacity at 40 [ICON_Citizen] population[NEWLINE] • +1 [ICON_TradeRoute] Trade Route capacity at 50 [ICON_Citizen] population'
WHERE Language = 'en_US' AND Tag = 'LOC_DISTRICT_COMMERCIAL_HUB_EXPANSION1_DESCRIPTION';

---------------
-- Buildings --
---------------

-- granary
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_GRANARY_DESCRIPTION', '+1 additional [ICON_Food] Food for each era since constructed or last repaired.');

-- water mill
UPDATE LocalizedText
SET Text = '[ICON_RESOURCE_RICE] Rice and [ICON_RESOURCE_WHEAT] Wheat resources gain +1 [ICON_Food] Food each. +1 additional [ICON_Food] Food and [ICON_Production] Production for each era since constructed or last repaired. City must be adjacent to a River.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_WATER_MILL_DESCRIPTION';

-- stadium
UPDATE LocalizedText
SET Text = 'Bonus [ICON_Amenity] Amenities extend to each city center within 9 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses. +2 [ICON_Tourism] if the city [ICON_Citizen] population is 10 or higher and +5 [ICON_Tourism] if the city [ICON_Citizen] population is 20 or higher.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_STADIUM_EXPANSION1_DESCRIPTION';

-- library
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_LIBRARY_DESCRIPTION', 'Bonus [ICON_Science] Science based on city [ICON_Citizen] population, scaling exponentially.');

-- university
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_UNIVERSITY_DESCRIPTION', 'Bonus [ICON_Science] Science based on city [ICON_Citizen] population, scaling exponentially.');

-- madrasa
UPDATE LocalizedText
SET Text = 'A building unique to Arabia. Bonus [ICON_Faith] Faith equal to the adjacency bonus of the Campus district.[NEWLINE][NEWLINE]Bonus [ICON_Science] Science based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_MADRASA_DESCRIPTION';

-- research lab
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_RESEARCH_LAB_DESCRIPTION', 'Bonus [ICON_Science] Science extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Science] Science based on city [ICON_Citizen] population, scaling exponentially.');

-- amphitheater
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_AMPHITHEATER_DESCRIPTION', 'Bonus [ICON_Culture] Culture based on city [ICON_Citizen] population, scaling exponentially.');

-- art museum
UPDATE LocalizedText
SET Text = 'Holds [ICON_GreatWork_Landscape] Great Works of Art. May not be built in a Theater Square district that already has an Archaeological Museum.[NEWLINE][NEWLINE]Bonus [ICON_Culture] Culture based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_MUSEUM_ART_DESCRIPTION';

-- archaeological museum
UPDATE LocalizedText
SET Text = 'Holds [ICON_GreatWork_Artifact] Artifacts. May not be built in a Theater Square district that already has an Art Museum.[NEWLINE][NEWLINE]Bonus [ICON_Culture] Culture based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_MUSEUM_ARTIFACT_DESCRIPTION';

-- broadcast center
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION', 'Bonus [ICON_Culture] Culture extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Culture] Culture based on city [ICON_Citizen] population, scaling exponentially.');

-- film studio
UPDATE LocalizedText
SET Text = 'A building unique to America. +100% [ICON_Tourism] Tourism pressure from this city towards other civilizations in the Modern era.[NEWLINE][NEWLINE]Bonus [ICON_Culture] Culture extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Culture] Culture based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_FILM_STUDIO_DESCRIPTION';

-- market
UPDATE LocalizedText
SET Text = 'Bonus [ICON_Gold] Gold based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_MARKET_DESCRIPTION';

-- sukiennice
UPDATE LocalizedText
SET Text = 'A building unique to Poland. International [ICON_TradeRoute] Trade Routes from this city gain +2 [ICON_Production] Production; domestic [ICON_TradeRoute] Trade Routes gain +4 [ICON_Gold] Gold.[NEWLINE][NEWLINE]Bonus [ICON_Gold] Gold based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_SUKIENNICE_DESCRIPTION';

-- bank
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_BANK_DESCRIPTION', 'Bonus [ICON_Gold] Gold based on city [ICON_Citizen] population, scaling exponentially.');

-- stock exchange
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION', 'Bonus [ICON_Gold] Gold extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Gold] Gold based on city [ICON_Citizen] population, scaling exponentially.');

-- workshop
INSERT INTO LocalizedText (Language, Tag, Text)
VALUES ('en_US', 'LOC_BUILDING_WORKSHOP_DESCRIPTION', 'Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.');

-- factory
UPDATE LocalizedText
SET Text = 'Bonus [ICON_Production] Production extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_FACTORY_DESCRIPTION';

-- electronics factory
UPDATE LocalizedText
SET Text = 'A building unique to Japan.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION';

-- coal power plant
UPDATE LocalizedText
SET Text = 'Automatically converts any amount of [ICON_RESOURCE_COAL] Coal into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE]• 1 [ICON_RESOURCE_COAL] Coal to 4 [ICON_Power] Power[NEWLINE]• Heavy CO2 into the atmosphere[NEWLINE][NEWLINE]Bonus [ICON_Production] Production extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_COAL_POWER_PLANT_DESCRIPTION';

-- oil power plant
UPDATE LocalizedText
SET Text = 'Automatically converts any amount of [ICON_RESOURCE_OIL] Oil into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE]• 1 [ICON_RESOURCE_OIL] Oil to 4 [ICON_Power] Power[NEWLINE]• Moderate CO2 into the atmosphere[NEWLINE][NEWLINE]Bonus [ICON_Production] Production extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DESCRIPTION';

-- nuclear power plant
UPDATE LocalizedText
SET Text = 'Automatically converts any amount of [ICON_RESOURCE_URANIUM] Uranium into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE]• 1 [ICON_RESOURCE_OIL] Oil to 16 [ICON_Power] Power[NEWLINE]• Miniscule CO2 into the atmosphere[NEWLINE][NEWLINE]Bonus [ICON_Production] Production and [ICON_Science] Science extends to all City Centers within 6 tiles. This bonus applies once to a city, and multiple copies of this building within 6 tiles of a city center do not provide additional bonuses.[NEWLINE][NEWLINE]Bonus [ICON_Production] Production based on city [ICON_Citizen] population, scaling exponentially.[NEWLINE][NEWLINE]Once built, as a Nuclear Plant ages, there is an increased chance for a Nuclear Accident to occur.'
WHERE Language = 'en_US' AND Tag = 'LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DESCRIPTION';

------------------
-- Neighborhood --
------------------

-- district name
UPDATE LocalizedText
SET Text = 'Municipality'
WHERE Language = 'en_US' AND Tag = 'LOC_DISTRICT_NEIGHBORHOOD_NAME';

UPDATE LocalizedText
SET Text = 'Your Excellency, I feel it is time to build some Municipalities for our growing populous. We should build these on our most beautiful lands - near natural wonders, or perhaps by the Coast.'
WHERE Language = 'en_US' AND Tag = 'ADVISOR_LINE_LISTENER_43';

UPDATE LocalizedText
SET Text = 'Municipalities with higher appeal will house more citizens, whereas municipalities built by marsh, airports, or rainforest are not going to be very populated at all.'
WHERE Language = 'en_US' AND Tag = 'ADVISOR_LINE_LISTENER_70';

UPDATE LocalizedText
SET Text = 'Have a Municipality district with Breathtaking Appeal.'
WHERE Language = 'en_US' AND Tag = 'LOC_BOOST_TRIGGER_CONSERVATION';

UPDATE LocalizedText
SET Text = 'The residents of your breathtaking new municipality clamor for a plan to conserve all the world’s natural treasures.'
WHERE Language = 'en_US' AND Tag = 'LOC_BOOST_TRIGGER_LONGDESC_CONSERVATION';

UPDATE LocalizedText
SET Text = 'With the introduction of municipalities, our cities are growing larger than ever before.  Developing a sanitation plan is crucial.'
WHERE Language = 'en_US' AND Tag = 'LOC_BOOST_TRIGGER_LONGDESC_SANITATION';

UPDATE LocalizedText
SET Text = 'Build 2 Municipalities.'
WHERE Language = 'en_US' AND Tag = 'LOC_BOOST_TRIGGER_SANITATION';

UPDATE LocalizedText
SET Text = 'A district unique to Kongo that can only be constructed in Rainforest or Woods. Replaces the Municipality district but is available earlier and cheaper to build. Provides +4 [ICON_Housing] Housing , +2 [ICON_Food] Food, and +4 [ICON_Gold] Gold, regardless of Appeal.'
WHERE Language = 'en_US' AND Tag = 'LOC_DISTRICT_MBANZA_DESCRIPTION';

UPDATE LocalizedText
SET Text = 'Shows appeal of each tile (for Municipalities, Seaside Resorts, National Parks).'
WHERE Language = 'en_US' AND Tag = 'LOC_HUD_APPEAL_LENS_TOOLTIP';

UPDATE LocalizedText
SET Text = 'Water {1_Water}, Bldg {2_Buildings}, Improvement {3_Improvements}, Municipalities {4_Districts}, Civics {5_Civics}'
WHERE Language = 'en_US' AND Tag = 'LOC_HUD_CITY_HOUSING_BREAKDOWN';

UPDATE LocalizedText
SET Text = 'A city must expand its [ICON_Citizen] Population before it can construct multiple districts:[NEWLINE]• 1 [ICON_Citizen] Population for 1 District[NEWLINE]• 6 [ICON_Citizen] Population for 2 Districts[NEWLINE]• 11 [ICON_Citizen] Population for 3 Districts[NEWLINE]• Each additional District requires +5 [ICON_Citizen] Population[NEWLINE]The Aqueduct, Municipality, Spaceport, Dam, and Canal districts ignore this [ICON_Citizen] Population requirement. Districts which require a certain number of [ICON_Citizen] Population are specialty districts.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_10_CHAPTER_CONTENT_PARA_2';

UPDATE LocalizedText
SET Text = 'Municipalities are a special district that allows a city to house more [ICON_Citizen] Population and is affected by Appeal. The term “Appeal” is used to describe a special form of adjacency bonus that just applies to Municipalities, and also will affect the Culture Victory’s [ICON_Tourism] Tourism system through National Parks and Seaside Resorts.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_1';

UPDATE LocalizedText
SET Text = 'Breathtaking Municipalities provide 6 [ICON_Housing] Housing.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_2';

UPDATE LocalizedText
SET Text = 'Charming Municipalities provide 5 [ICON_Housing] Housing.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_3';

UPDATE LocalizedText
SET Text = 'Average Municipalities provide 4 [ICON_Housing] Housing.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_4';

UPDATE LocalizedText
SET Text = 'Uninviting Municipalities provide 3 [ICON_Housing] Housing.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_5';

UPDATE LocalizedText
SET Text = 'Disgusting Municipalities provide 2 [ICON_Housing] Housing.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_PARA_6';

UPDATE LocalizedText
SET Text = 'Neighborhoods and Appeal'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_11_CHAPTER_CONTENT_TITLE';

UPDATE LocalizedText
SET Text = 'Each Farm, Pasture, Plantation, or Camp supports a small amount of [ICON_Citizen] Population — 1 [ICON_Housing] Housing for every 2 such improvements. Supporting rural [ICON_Citizen] Population in this fashion will allow for slightly larger [ICON_Citizen] Populations prior to the Medieval Era, when the Municipality district becomes available.'
WHERE Language = 'en_US' AND Tag = 'LOC_PEDIA_CONCEPTS_PAGE_CITIES_14_CHAPTER_CONTENT_PARA_3';

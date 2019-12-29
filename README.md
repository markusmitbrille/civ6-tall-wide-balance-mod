# Haphazardly Balanced Mod

Haphazardly balance, as most things should be.

A Civilization VI mod that aims to make both tall and wide play-style viable and generally make the game more entertaining.

To-do:
- [x] Implement actual pop yields (see Balancing.pdf)
- [x] Change building yields (see Balancing.pdf)
- [x] Change specialist yields (see Balancing.pdf)
- [x] Balance food/production yields based on districts, add missing district trade route yields
- [x] Balance policies for trade route yields
- [x] Balance policies for district adjacency/building yield bonuses (and add cards for specialists)
- [x] Balance growth (housing, food)
- [x] Localization: Rename Neighborhood to Municipality, change Civilopedia entry to reflect new concept
- [x] Do localization for Urban Sprawl
- [x] Do localization for all changes
- [x] Fix localization
- [ ] Look into whether any world congress stuff needs to be changed

To-test:
- Changes to policies
  - [ ] Urban Sprawl
  - [ ] Public Transportation
  - [ ] Triangular Trade
  - [ ] Collectivization
  - [ ] Ecommerce
  - [ ] Rationalism
  - [ ] Grand Opera
  - [ ] Free Market
  - [ ] Simultaneum
- [ ] GPP from specialists
- [ ] Population Yields
- [ ] District, Building Yields
- [ ] Specialist Yields, Slots
- Changes to trade
  - [ ] Capacity change from techs (currency, banking, economics), civics (foreign trade, guilds, colonialism), com hubs (base, per 15/30/40/50 pop)
- [ ] Localization

Ideas:
- [x] Trade routes yields should balance food/production: Urban cities get food but lose production from trade routes. Green districts (aquaeduct, bath, neighbourhood, mbanza, dam) make a city more urban. Urbanization of trade route destination also affects yields: Urban destinations reduce food gain for origin, but increase production gain. Green districts also increase gold, both as origin and destination. This means there are roughly four trade scenarious (U = "urban", R = "rural", only origin receives yields):
 - U2R: +food, -production,  +gold
 - R2U: -food, +production,  +gold
 - U2U: ~food, ~production, ++gold
 - R2R: ~food, ~production,  ~gold
- [x] International vs. domestic trade: Production and food yields now come from both kinds and mostly depend on urbanization. International trade routes are slightly more gold efficient, domestic trade routes are more food/production efficient (green districts give more gold as international than as domestic destination, city center gives food and production as domestic destination, gold as international destination).
- [x] Trade route capacity should come from commercial district only, should give 1 straightaway, then additional ones based on population (maybe at 15/30/40/50)
- [x] Some techs/civics should give trade route capacity (maybe 3/3 across both trees, including the one from Foreign Trade)
- [x] As the player advance through the tech tree, trade routes should become slightly more food/production efficient (mitigating production/food loss for U2R/R2U trade route origins and boosting their benefits)
- [x] Rebalance encampment and harbor districts/buildings to be kind of jack-of-all-trades, giving flat bonus food, production and gold
- [x] Make encampment and harbor district and buildings give some housing as well (maybe 1/1/1/2)
- [x] Move GPP generation from districts/buildings to specialists
- [ ] GPs should always have a universally good benefit
 - Look into giving them a second activated ability, as a kind of alternative, would be especially cool for great writers/artists/musicians, when you don't want the great work
- [x] Make wall production and maybe other buildings boostable by builders (Building_BuildChargeProductions), so a central city with uber-production can distribute it somewhat
- [x] Make all resources harvestable
- [ ] Make nuclear fallout non-clearable
- [ ] Give settlers a vision/movement buff on turn 1
- [ ] Look into possibilities for a science/culture catch-up mechanic
 - Passive Science/Culture: gain a percentage of the difference between your science/culture and the player with the most of that yield. Only met players are considered. Greater percentage the more techs/civics you are behind.
 - If passive science/culture is not feasible from a technical standpoint, maybe somehow do it via trade routes?

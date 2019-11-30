# Haphazardly Balanced Mod

Haphazardly balance, as most things should be.

A Civilization VI mod that aims to make both tall and wide play-style viable and generally make the game more entertaining.

To-do:
- [x] Implement actual pop yields (see Balancing.pdf)
- [x] Change building yields (see Balancing.pdf)
- [ ] Change district adjacencies (see Balancing.pdf), though not necessary, maybe?
- [ ] Change specialist yields (see Balancing.pdf)
- [ ] Balance food/production yields based on districts, add missing district trade route yields
- [ ] Balance government cards for trade route yields
- [ ] Balance government cards for district adjacency/building yield bonuses (and add cards for specialists)
- [ ] Balance leader/civ traits that touch on trade route yields
- [ ] Balance leader/civ traits that touch on district/building yields
- [ ] Look into whether any world congress stuff needs to be changed

Ideas:
- [x] Trade routes yields should balance food/production: Urban cities get food but lose production from trade routes. Green districts (aquaeduct, bath, neighbourhood, mbanza, dam) make a city more urban. Urbanization of trade route destination also affects yields: Urban destinations reduce food gain for origin, but increase production gain. Green districts also increase gold, both as origin and destination. This means there are roughly four trade scenarious (U = "urban", R = "rural", only origin receives yields):
 - U2R: +food, -production,  +gold
 - R2U: -food, +production,  +gold
 - U2U: ~food, ~production, ++gold
 - R2R: ~food, ~production,  ~gold
- [ ] International vs. domestic trade: Production and food yields now come from both kinds and mostly depend on urbanization. International trade routes are slightly more gold efficient, domestic trade routes are more food/production efficient (green districts give more gold as international than as domestic destination, city center gives food and production as domestic destination, gold as international destination).
- [ ] Trade route capacity should come from commercial district only, should give 1 straightaway, then additional ones based on population (maybe at 15/30/40/50)
- [ ] Some techs/civics should give trade route capacity (maybe 3/3 across both trees, including the one from Foreign Trade)
- [ ] As the player advance through the tech tree, trade routes should become slightly more food/production efficient (mitigating production/food loss for U2R/R2U trade route origins and boosting their benefits)
- [ ] Rebalance encampment and harbor districts/buildings to be kind of jack-of-all-trades, giving flat bonus food, production and gold, as well as housing (maybe 1/1/1/2)
- [ ] Move GPP generation from districts/buildings to specialists
- [ ] GPs should always have a universally good benefit
 - Look into giving them a second activated ability, as a kind of alternative, would be especially cool for great writers/artists/musicians, when you don't want the great work
- [ ] Make wall production and maybe other buildings boostable by builders (Building_BuildChargeProductions), so a central city with uber-production can distribute it somewhat
- [ ] Make all resources harvestable
- [ ] Look into possibilities for a science/culture catch-up mechanic
 - Passive Science/Culture: gain a percentage of the difference between your science/culture and the player with the most of that yield. Only met players are considered. Greater percentage the more techs/civics you are behind.
 - If passive science/culture is not feasible from a technical standpoint, maybe somehow do it via trade routes?
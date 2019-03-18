# Return a list of all pokemon sorted from strongest to weakest
SELECT pkmns.name as "Pokemon Name", trnrs.trainername as "Trainer Name", pkmn_trnrs.pokelevel as "Level", tps1.name as "Primary Type", tps2.name as "Secondary Type"
FROM pokemon.trainers trnrs
       JOIN pokemon.pokemon_trainer pkmn_trnrs
            ON trnrs.trainerID = pkmn_trnrs.trainerID
       JOIN pokemon.pokemons pkmns
            ON pkmns.id = pkmn_trnrs.pokemon_id
       JOIN pokemon.types tps1
            ON pkmns.primary_type = tps1.id
       LEFT JOIN pokemon.types tps2
            ON pkmns.secondary_type = tps2.id
ORDER BY pkmn_trnrs.pokelevel DESC, tps1.id DESC, pkmns.name ASC, trnrs.trainername ASC;

# To find the best, I began by sorting by level, then by type, then by pokemon name, then by trainer name
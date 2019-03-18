# What is each pokemon's primary type?
SELECT p.name, t.name
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.primary_type = t.id;

# What is Rufflet's secondary type?
SELECT p.name, t.name
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.secondary_type = t.id
WHERE p.name = 'Rufflet';

# What are the names of the pokemon that belong to the trainer with trainerID 303?
SELECT t.trainername, p.name
FROM pokemon.trainers t
       JOIN pokemon.pokemon_trainer pt
            ON t.trainerID = pt.trainerID
       JOIN pokemon.pokemons p
            ON p.id = pt.pokemon_id
WHERE t.trainerID = 303;

# How many pokemon have a secondary type Poison
SELECT COUNT(1) as "number of pokemon with secondary type poison"
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.secondary_type = t.id
WHERE t.name = 'Poison';

# What are all the primary types and how many pokemon have that type?
SELECT t.name, COUNT(1) as "number of pokemon with type"
FROM pokemon.pokemons p
       JOIN pokemon.types t
            ON p.primary_type = t.id
GROUP BY t.name;

# How many pokemon at level 100 does each trainer with at least one level 100 pokemon have? (Hint: your query should not display a trainer)
SELECT COUNT(1) as "number of pokemon at level 100"
FROM pokemon.pokemon_trainer pt
WHERE pokelevel = 100
GROUP BY pt.trainerID;

# How many pokemon only belong to one trainer and no other?
SELECT COUNT(1) as "number of pokemon who belong to one trainer and no other"
FROM
(SELECT COUNT(1)
FROM pokemon.pokemon_trainer pt
GROUP BY pt.pokemon_id
HAVING COUNT(pt.pokemon_id) = 1) PokemonWithOnlyOneTrainer;
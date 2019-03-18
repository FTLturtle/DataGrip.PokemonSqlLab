# What are all the types of pokemon that a pokemon can have?
SELECT name as "all pokemon types"
FROM pokemon.types;

# What is the name of the pokemon with id 45?
SELECT name as "name of pokemon with id 45"
FROM pokemon.pokemons
WHERE id = 45;

# How many pokemon are there?
SELECT COUNT(1) as "number of pokemon"
FROM pokemon.pokemons;

# How many types are there?
SELECT COUNT(1) as "number of pokemon types"
FROM pokemon.types;

# How many pokemon have a secondary type?
SELECT COUNT(1) as "number of pokemon with secondary type"
FROM pokemon.pokemons
WHERE secondary_type IS NOT NULL;
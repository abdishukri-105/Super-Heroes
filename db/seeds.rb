# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Seed data for heros table
Hero.create(name: 'Clark Kent', super_name: 'Superman')
Hero.create(name: 'Bruce Wayne', super_name: 'Batman')
Hero.create(name: 'Peter Parker', super_name: 'Spiderman')

# Seed data for powers table
Power.create(name: 'Super Strength', description: 'Ability to lift heavy objects with ease')
Power.create(name: 'Flight', description: 'Ability to fly')
Power.create(name: 'Super Speed', description: 'Ability to move at superhuman speeds')
Power.create(name: 'Web-slinging', description: 'Ability to shoot webs and swing through the city')

# Seed data for hero_powers join table
HeroPower.create(hero_id: 1, power_id: 1, strength: 'strong')
HeroPower.create(hero_id: 1, power_id: 2, strength: 'average')
HeroPower.create(hero_id: 1, power_id: 3, strength: 'strong')
HeroPower.create(hero_id: 2, power_id: 1, strength: 'weak')
HeroPower.create(hero_id: 2, power_id: 4, strength: 'average')
HeroPower.create(hero_id: 3, power_id: 2, strength: 'average')
HeroPower.create(hero_id: 3, power_id: 3, strength: 'strong')
HeroPower.create(hero_id: 3, power_id: 4, strength: 'strong')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Property.create!(title: 'Casa com quintal em Copacabana', 
    description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
    rooms: 3, 
    bathrooms: 2,
    parking_spot: true,
    pet_friendly: true,
    daily_rate: 400,
    property_type: PropertyType.create!)
Property.create!(title: 'Apartamento em Manaus', 
    description: 'Ótimo preço, perto do Rio Negro', 
    rooms: 2, 
    bathrooms: 2,
    parking_spot: false,
    pet_friendly: true,
    daily_rate: 150,
    property_type: PropertyType.create!)

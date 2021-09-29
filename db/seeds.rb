casa = PropertyType.create!(name: 'Casa')
apartamento = PropertyType.create!(name: 'Apartamento')
fazenda = PropertyType.create!(name: 'Fazenda')

praia = PropertyRegion.create!(name: 'Praia')
campo = PropertyRegion.create!(name: 'Campo')
urbano = PropertyRegion.create!(name: 'Urbano')

Property.create!(title: 'Casa com quintal em Copacabana', 
    description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
    rooms: 3, 
    bathrooms: 2,
    parking_spot: true,
    pet_friendly: true,
    daily_rate: 400,
    property_type: casa,
    property_region: praia)

Property.create!(title: 'Propriedade em Belo Horizonte', 
    description: 'Imóvel novo no centro', 
    rooms: 4, 
    bathrooms: 3,
    parking_spot: true,
    pet_friendly: true,
    daily_rate: 530,
    property_type: casa,
    property_region: urbano)

Property.create!(title: 'Apartamento em Manaus', 
    description: 'Ótimo preço, perto do Rio Negro', 
    rooms: 2, 
    bathrooms: 2,
    parking_spot: false,
    pet_friendly: true,
    daily_rate: 150,
    property_type: apartamento,
    property_region: campo)

Property.create!(title: 'Duplex em Jurerê Internacional', 
    description: 'Melhor local para festas', 
    rooms: 6, 
    bathrooms: 4,
    parking_spot: true,
    pet_friendly: false,
    daily_rate: 980,
    property_type: apartamento,
    property_region: praia)

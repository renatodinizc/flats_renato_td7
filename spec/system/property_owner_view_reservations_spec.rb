require 'rails_helper'

describe 'Property owner view reservations' do
  it 'should view reservations from owned properties' do
    foobar = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
    jane_owner = PropertyOwner.create!(email: 'jane@doe.com', password: '123456')
    user = User.create(email: 'user@flats.com', password: '123123')
    praia = PropertyRegion.create!(name: 'Praia')
    casa = PropertyType.create!(name: 'Casa')
    copacabana = Property.create!(title: 'Casa com quintal em Copacabana', 
                    description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
                    rooms: 3, 
                    bathrooms: 2,
                    parking_spot: true,
                    pet_friendly: true,
                    daily_rate: 400,
                    property_type: casa,
                    property_region: praia,
                    property_owner: foobar)
    apartamento = PropertyType.create!(name: 'Apartamento')
    campo = PropertyRegion.create!(name: 'Campo')
    manaus = Property.create!(title: 'Apartamento em Manaus', 
                    description: 'Ótimo preço, perto do Rio Negro', 
                    rooms: 2, 
                    bathrooms: 2,
                    parking_spot: false,
                    pet_friendly: true,
                    daily_rate: 150,
                    property_type: apartamento,
                    property_region: campo,
                    property_owner: foobar)
    fazenda = PropertyType.create!(name: 'Fazenda')
    sorocaba = Property.create!(title: 'Fazenda em Sorocaba', 
                    description: 'Perto do riacho iguaçú', 
                    rooms: 8, 
                    bathrooms: 6,
                    parking_spot: true,
                    pet_friendly: true,
                    daily_rate: 600,
                    property_type: fazenda,
                    property_region: campo,
                    property_owner: jane_owner)
    PropertyReservation.create!(start_date: '20/10/2021', end_date: '25/10/2021',
                                guests: 6, property: copacabana, user: user)
    PropertyReservation.create!(start_date: '13/12/2021', end_date: '17/12/2021',
                                guests: 3, property: sorocaba, user: user)

    login_as foobar, scope: :property_owner
    visit root_path
    click_on 'Meus imóveis'
    click_on 'Casa com quintal em Copacabana'

    expect(page).not_to have_content 'Reserve agora'
    expect(page).to have_content 'Propostas recebidas'
    expect(page).to have_content 'Proposta de user@flats.com'
    expect(page).to have_content 'Data de início: 20/10/2021'
    expect(page).to have_content 'Data de término: 25/10/2021'
    expect(page).to have_content 'Total de pessoas: 6'
    expect(page).not_to have_content 'Data de início: 13/12/2021' 
    expect(page).to have_content 'Status: Pendente' 
  end

  it 'should view reservations from owned properties' do
    foobar = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
    jane_owner = PropertyOwner.create!(email: 'jane@doe.com', password: '123456')
    user = User.create(email: 'user@flats.com', password: '123123')
    praia = PropertyRegion.create!(name: 'Praia')
    casa = PropertyType.create!(name: 'Casa')
    copacabana = Property.create!(title: 'Casa com quintal em Copacabana', 
                    description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
                    rooms: 3, 
                    bathrooms: 2,
                    parking_spot: true,
                    pet_friendly: true,
                    daily_rate: 400,
                    property_type: casa,
                    property_region: praia,
                    property_owner: foobar)
    apartamento = PropertyType.create!(name: 'Apartamento')
    campo = PropertyRegion.create!(name: 'Campo')
    manaus = Property.create!(title: 'Apartamento em Manaus', 
                    description: 'Ótimo preço, perto do Rio Negro', 
                    rooms: 2, 
                    bathrooms: 2,
                    parking_spot: false,
                    pet_friendly: true,
                    daily_rate: 150,
                    property_type: apartamento,
                    property_region: campo,
                    property_owner: foobar)
    fazenda = PropertyType.create!(name: 'Fazenda')
    sorocaba = Property.create!(title: 'Fazenda em Sorocaba', 
                    description: 'Perto do riacho iguaçú', 
                    rooms: 8, 
                    bathrooms: 6,
                    parking_spot: true,
                    pet_friendly: true,
                    daily_rate: 600,
                    property_type: fazenda,
                    property_region: campo,
                    property_owner: jane_owner)
    PropertyReservation.create!(start_date: '20/10/2021', end_date: '25/10/2021',
                                guests: 6, property: copacabana, user: user)
    PropertyReservation.create!(start_date: '13/12/2021', end_date: '17/12/2021',
                                guests: 3, property: sorocaba, user: user)

    login_as foobar, scope: :property_owner
    visit root_path
    click_on 'Meus imóveis'
    click_on 'Casa com quintal em Copacabana'
    click_on 'Aceitar reserva'

    expect(current_path).to eq property_path(copacabana)
    expect(current_path).to eq property_path(copacabana)
    expect(page).to have_content 'Proposta de user@flats.com'
    expect(page).to have_content 'Data de início: 20/10/2021'
    expect(page).to have_content 'Data de término: 25/10/2021'
    expect(page).to have_content 'Total de pessoas: 6'
    expect(page).to have_content 'Status: Aceito' 
  end

end
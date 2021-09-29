require 'rails_helper'

describe 'Visitor filter properties by type' do 
    it 'sould view links on nav bar successfuly' do
        PropertyType.create!(name: 'Apartamento')
        PropertyType.create!(name: 'Casa')
        PropertyType.create!(name: 'Sítio')

        visit root_path

        expect(page).to have_link('Apartamento')
        expect(page).to have_link('Casa')
        expect(page).to have_link('Sítio')
    end
    it 'successfully' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create!(name: 'Casa'))
        Property.create!(title: 'Apartamento em Manaus', 
            description: 'Ótimo preço, perto do Rio Negro', 
            rooms: 2, 
            bathrooms: 2,
            parking_spot: false,
            pet_friendly: true,
            daily_rate: 150,
            property_type: PropertyType.create!(name: 'Apartamento'))

        visit root_path
        click_on 'Casa'

        expect(page).to have_content('Imóveis do tipo: Casa')
        expect(page).to have_content('Casa com quintal em Copacabana')
        expect(page).not_to have_content('Apartamento em Manaus')
    end
end

require 'rails_helper'

describe 'Visitor visits homepage' do
    it 'successfully' do
        visit root_path

        expect(page).to have_css('h1', text: 'Flats')
        expect(page).to have_css('h3', text: 'Boas vindas ao sistema de locação de apartamentos')
    end

    it 'and sees message if there is no properties avaiable' do
        visit root_path

        expect(page).to have_content('Nenhuma propriedade disponível')
    end

    it 'and sees all avaiable properties in database' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create)
        Property.create!(title: 'Apartamento em Manaus', 
            description: 'Ótimo preço, perto do Rio Negro', 
            rooms: 2, 
            bathrooms: 2,
            parking_spot: false,
            pet_friendly: true,
            daily_rate: 150,
            property_type: PropertyType.create)

        visit root_path

        expect(page).to have_content('Casa com quintal em Copacabana')
        expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Apartamento em Manaus')
        expect(page).to have_content('Ótimo preço, perto do Rio Negro')
        expect(page).to have_content('Quartos: 2')
    end

    it 'and view property details' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create)

            visit root_path
            click_on 'Casa com quintal em Copacabana'

            expect(page).to have_css('h2', text: 'Casa com quintal em Copacabana')
            expect(page).to have_content('Excelente casa, recém reformada com 2 vagas de garagem')
            expect(page).to have_content('Quartos: 3')
            expect(page).to have_content('Banheiros: 2')
            expect(page).to have_content('Aceita pets')
            expect(page).to have_content('Tem estacionamento')
            expect(page).to have_content('Diária: R$ 400,00')
    end

    it 'and view details of multiple properties' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create)
        Property.create!(title: 'Apartamento em Manaus', 
            description: 'Ótimo preço, perto do Rio Negro', 
            rooms: 2, 
            bathrooms: 2,
            parking_spot: false,
            pet_friendly: true,
            daily_rate: 150,
            property_type: PropertyType.create)

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Voltar'
        click_on 'Apartamento em Manaus'
        
        expect(page).to have_css('h2', text: 'Apartamento em Manaus')
        expect(page).to have_content('Ótimo preço, perto do Rio Negro')
        expect(page).to have_content('Quartos: 2')
        expect(page).to have_content('Banheiros: 2')
        expect(page).to have_content('Aceita pets')
        expect(page).to have_content('Não tem estacionamento')
        expect(page).to have_content('Diária: R$ 150,00')
    end
end
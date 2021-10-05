require 'rails_helper'

describe 'Property owner view own properties' do
    it 'using menu' do
        property_owner = PropertyOwner.create!(email: 'foorbar@foo.com', password: '123456')

        login_as property_owner, scope: :property_owner
        visit root_path

        expect(page).to have_link('Meus imóveis')
    end

    it 'and should view only owned properties' do
        jane = PropertyOwner.create!(email: 'foorbar@foo.com', password: '123456')
        peter = PropertyOwner.create!(email: 'peter@foo.com', password: '123456')

        praia = PropertyRegion.create!(name: 'Praia')
        casa = PropertyType.create!(name: 'Casa')

        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: casa,
            property_region: praia,
            property_owner: jane)
        apartamento = PropertyType.create!(name: 'Apartamento')
        campo = PropertyRegion.create!(name: 'Campo')
        Property.create!(title: 'Apartamento em Manaus', 
            description: 'Ótimo preço, perto do Rio Negro', 
            rooms: 2, 
            bathrooms: 2,
            parking_spot: false,
            pet_friendly: true,
            daily_rate: 150,
            property_type: apartamento,
            property_region: campo,
            property_owner: peter)

        login_as jane, scope: :property_owner
        visit root_path
        click_on 'Meus imóveis'

        expect(page).to have_content('Casa com quintal em Copacabana')
        expect(page).to have_content(jane.email)
        expect(page).not_to have_content('Apartamento em Manaus')
    end
    it 'and it has no properties yet' do
        peter = PropertyOwner.create!(email: 'peter@parker.com.br', password: '123321')

        login_as peter, scope: :property_owner
        visit root_path
        click_on 'Meus imóveis'

        expect(page).to have_content('Nenhuma propriedade disponível')
        expect(page).to have_link('Cadastre seu primeiro imóvel aqui!')
    end
end
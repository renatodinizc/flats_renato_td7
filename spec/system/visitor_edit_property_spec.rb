require 'rails_helper'

describe 'Visitor edit property' do
    it 'successfully' do
        praia = PropertyRegion.create!(name: 'Praia')
        PropertyRegion.create!(name: 'Campo')
        casa = PropertyType.create!(name: 'Casa')
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: casa,
            property_region: praia)

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar imóvel'
        fill_in 'Título', with: 'Casa em Copacabana2'
        fill_in 'Descrição', with: 'Imóvel em ótimas condições, a uma quadra da praia2'
        fill_in 'Quartos', with: 3
        fill_in 'Banheiros', with: 3
        fill_in 'Diária', with: 900
        select 'Campo', from: 'Região'
        uncheck 'Vaga de garagem'
        uncheck 'Animais de estimação'
        click_on 'Cadastrar'

        expect(page).to have_css('h2', text: 'Casa em Copacabana2')
        expect(page).to have_content('Imóvel em ótimas condições, a uma quadra da praia2')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Banheiros: 3')
        expect(page).to have_content('Região: Campo')
        expect(page).to have_content('Não tem estacionamento')
        expect(page).to have_content('Não aceita pets')
        expect(page).to have_content('Diária: R$ 900,00')
    end

    it 'and try to left field empty unsuccessfuly' do
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
            property_region: praia)

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar imóvel'
        fill_in 'Título', with: ''
        fill_in 'Descrição', with: ''
        fill_in 'Quartos', with: ''
        fill_in 'Banheiros', with: ''
        fill_in 'Diária', with: ''
        click_on 'Cadastrar'

        expect(page).to have_content("Título não pode ficar em branco")
        expect(page).to have_content("Descrição não pode ficar em branco")
        expect(page).to have_content("Quartos não pode ficar em branco")
        expect(page).to have_content("Banheiros não pode ficar em branco")
        expect(page).to have_content("Diária não pode ficar em branco")
    end
end




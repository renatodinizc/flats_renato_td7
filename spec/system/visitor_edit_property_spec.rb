require 'rails_helper'

describe 'Visitor edit property' do
    it 'successfully' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create!)

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar imóvel'
        fill_in 'Título', with: 'Casa em Copacabana2'
        fill_in 'Descrição', with: 'Imóvel em ótimas condições, a uma quadra da praia2'
        fill_in 'Quantidade de quartos', with: 3
        fill_in 'Quantidade de banheiros', with: 3
        fill_in 'Preço da diária', with: 900
        uncheck 'Vaga de estacionamento'
        uncheck 'Aceita pets'
        click_on 'Cadastrar'

        expect(page).to have_css('h2', text: 'Casa em Copacabana2')
        expect(page).to have_content('Imóvel em ótimas condições, a uma quadra da praia2')
        expect(page).to have_content('Quartos: 3')
        expect(page).to have_content('Banheiros: 3')
        expect(page).to have_content('Não tem estacionamento')
        expect(page).to have_content('Não aceita pets')
        expect(page).to have_content('Diária: R$ 900,00')
    end

    it 'and try to left field empty unsuccessfuly' do
        Property.create!(title: 'Casa com quintal em Copacabana', 
            description: 'Excelente casa, recém reformada com 2 vagas de garagem', 
            rooms: 3, 
            bathrooms: 2,
            parking_spot: true,
            pet_friendly: true,
            daily_rate: 400,
            property_type: PropertyType.create!)

        visit root_path
        click_on 'Casa com quintal em Copacabana'
        click_on 'Editar imóvel'
        fill_in 'Título', with: ''
        fill_in 'Descrição', with: ''
        fill_in 'Quantidade de quartos', with: ''
        fill_in 'Quantidade de banheiros', with: ''
        fill_in 'Preço da diária', with: ''
        click_on 'Cadastrar'

        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Description can't be blank")
        expect(page).to have_content("Rooms can't be blank")
        expect(page).to have_content("Bathrooms can't be blank")
        expect(page).to have_content("Daily rate can't be blank")
    end
end




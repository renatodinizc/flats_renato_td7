require 'rails_helper'

describe 'Visitor register property' do
    it 'successfully' do
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Copacabana'
        fill_in 'Descrição', with: 'Imóvel em ótimas condições, a uma quadra da praia'
        fill_in 'Quantidade de quartos', with: 2
        fill_in 'Quantidade de banheiros', with: 2
        fill_in 'Preço da diária', with: 300
        check 'Vaga de estacionamento'
        check 'Aceita pets'
        click_on 'Cadastrar'

        expect(page).to have_css('h2', text: 'Casa em Copacabana')
        expect(page).to have_content('Imóvel em ótimas condições, a uma quadra da praia')
        expect(page).to have_content('Quartos: 2')
        expect(page).to have_content('Banheiros: 2')
        expect(page).to have_content('Tem estacionamento')
        expect(page).to have_content('Aceita pets')
        expect(page).to have_content('Diária: R$ 300,00')
    end

    it 'and require it to have all fields successfully' do
        visit root_path
        click_on 'Cadastrar imóvel'
        click_on 'Cadastrar'

        expect(page).to have_css('h2', text: 'Página de cadastro de imóveis')
    end

    it 'and display alert message if there is any field empty' do
        visit root_path
        click_on 'Cadastrar imóvel'
        click_on 'Cadastrar'

        expect(page).to have_content("Title can't be blank")
        expect(page).to have_content("Description can't be blank")
        expect(page).to have_content("Rooms can't be blank")
        expect(page).to have_content("Bathrooms can't be blank")
        expect(page).to have_content("Daily rate can't be blank")
    end
end
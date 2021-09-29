require 'rails_helper'

describe 'Visitor register property' do
    it 'successfully' do
        praia = PropertyRegion.create!(name: 'Praia')
        casa = PropertyType.create!(name: 'Casa')
        
        visit root_path
        click_on 'Cadastrar imóvel'
        fill_in 'Título', with: 'Casa em Copacabana'
        fill_in 'Descrição', with: 'Imóvel em ótimas condições, a uma quadra da praia'
        fill_in 'Quartos', with: 2
        fill_in 'Banheiros', with: 2
        fill_in 'Diária', with: 300
        select 'Casa', from: 'Tipo'
        select 'Praia', from: 'Região'
        check 'Vaga de garagem'
        check 'Animais de estimação'
        click_on 'Cadastrar'

        expect(page).to have_css('h2', text: 'Casa em Copacabana')
        expect(page).to have_content('Imóvel em ótimas condições, a uma quadra da praia')
        expect(page).to have_content('Quartos: 2')
        expect(page).to have_content('Banheiros: 2')
        expect(page).to have_content('Tem estacionamento')
        expect(page).to have_content('Aceita pets')
        expect(page).to have_content('Diária: R$ 300,00')
        expect(page).to have_content('Tipo: Casa')
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

        expect(page).to have_content("Título não pode ficar em branco")
        expect(page).to have_content("Descrição não pode ficar em branco")
        expect(page).to have_content("Quartos não pode ficar em branco")
        expect(page).to have_content("Banheiros não pode ficar em branco")
        expect(page).to have_content("Diária não pode ficar em branco")
    end
end
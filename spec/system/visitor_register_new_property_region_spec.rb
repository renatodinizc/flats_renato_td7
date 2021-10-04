require 'rails_helper'

describe 'Visitor register new property region' do
    it 'successfully' do
        visit root_path

        click_on 'Cadastrar nova região'
        fill_in 'Região', with: 'Praia'
        click_on 'Cadastrar'

        expect(page).to have_content('Praia')
    end

    it 'and require it to not be empty successfully' do
        visit root_path
        click_on 'Cadastrar nova região de imóvel'
        click_on 'Cadastrar'

        expect(page).to have_content('Página de cadastro de regiões')
    end

    it 'and displays error message if there are empty fields' do
        visit root_path
        click_on 'Cadastrar novo tipo de imóvel'
        click_on 'Cadastrar'

        expect(page).to have_content("Tipo não pode ficar em branco")
    end

    it 'and cannot create repeatable names' do
        PropertyType.create!(name: 'Casa')

        visit root_path
        click_on 'Cadastrar novo tipo de imóvel'
        fill_in 'Tipo', with: 'Casa'
        click_on 'Cadastrar'

        expect(page).to have_content('Página de cadastro de novos tipos de imóveis')
    end
end
require 'rails_helper'

describe 'Visitor register new property type' do
    it 'successfully' do
        visit root_path

        click_on 'Cadastrar novo tipo de imóvel'
        fill_in 'Tipo', with: 'Casa'
        click_on 'Cadastrar'

        expect(page).to have_content('Casa')
    end

    it 'and require it to not be empty successfully' do
        visit root_path
        click_on 'Cadastrar novo tipo de imóvel'
        click_on 'Cadastrar'

        expect(page).to have_content('Página de cadastro de novos tipos de imóveis')
    end

    it 'and displays error message if there are empty fields' do
        visit root_path
        click_on 'Cadastrar novo tipo de imóvel'
        click_on 'Cadastrar'

        expect(page).to have_content("Name can't be blank")
    end
end
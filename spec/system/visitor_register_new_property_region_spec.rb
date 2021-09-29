require 'rails_helper'

describe 'Visitor register new property region' do
    it 'successfully' do
        visit root_path

        click_on 'Cadastrar nova região'
        fill_in 'Região', with: 'Praia'
        click_on 'Cadastrar'

        expect(page).to have_content('Praia')
    end
end
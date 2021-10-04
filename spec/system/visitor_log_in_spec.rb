require 'rails_helper'

describe 'Visitor log in' do
    context 'as property owner' do
        it 'successfully' do
            property_owner = PropertyOwner.create!(email: 'foorbar@foo.com', password: '123456')

            visit root_path
            click_on 'Entrar'
            fill_in 'Email', with: property_owner.email
            fill_in 'Senha', with: property_owner.password
            within 'form' do
                click_on 'Entrar'
            end

            expect(page).to have_content('Login efetuado com sucesso!')
            expect(page).to have_content(property_owner.email)
            expect(page).to have_link('Logout')
            expect(page).not_to have_link('Log in')
        end
        it 'and logs out' do
            property_owner = PropertyOwner.create!(email: 'foorbar@foo.com', password: '123456')
            login_as property_owner, scope: :property_owner
            visit root_path
            click_on 'Logout'

            expect(page).to have_content('Saiu com sucesso')
            expect(page).not_to have_content('Logout')
            expect(page).not_to have_link('Log in')
            expect(page).not_to have_content(property_owner.email)

            
        end

        it 'create an account' do
            visit root_path
            click_on 'Entrar'
            click_on 'Sign up'
            fill_in 'Email', with: 'foobar@foo.com'
            fill_in 'Senha', with: '1231234'
            fill_in 'Confirmar senha', with: '1231234'
            click_on 'Sign up'

            expect(page).to have_content('foobar@foo.com')
            expect(page).to have_content('Logout')
            expect(page).not_to have_content('Entrar')
        end

        it 'and cant create property' do
            visit root_path
            visit new_property_path
            
            expect(page).not_to have_content('Página de cadastro de imóveis')
        end
    end

    context 'as user' do
    end
end
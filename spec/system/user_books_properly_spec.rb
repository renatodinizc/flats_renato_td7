require 'rails_helper'

describe 'User books property' do
    it 'successfully' do
        property_type = PropertyType.create!(name: 'Apartamento')
        property_region = PropertyRegion.create!(name: 'Praia')
        property_owner = PropertyOwner.create!(email: 'foobar@foo.com', password: '123123')
        property = Property.create!(title: 'Apartamento novo', description: 'Um apartamento legal',
                    rooms: 3, bathrooms: 2, pet_friendly: true, parking_spot: false, daily_rate: 100,
                    property_type: property_type, property_region: property_region, property_owner: property_owner)
        user = User.create!(email: 'jane@doe.com', password: '123456')

        login_as user, scope: :user
        visit root_path
        click_on property.title
        fill_in 'Data de início', with: '06/10/2021'
        fill_in 'Data de término', with: '10/10/2021'
        fill_in 'Quantidade de pessoas', with: 3
        click_on 'Enviar reserva'

        expect(page).to have_content('06/10/2021')
        expect(page).to have_content('10/10/2021')
        expect(page).to have_content(/3/)
        expect(page).to have_content('R$ 1.200,00')
        expect(page).to have_content('Pedido de reserva enviado com sucesso!')
    end
end
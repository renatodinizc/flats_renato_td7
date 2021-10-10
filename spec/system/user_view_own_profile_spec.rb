require 'rails_helper'

describe 'User views own profile' do
  it 'successfully' do
    user = User.create!(email: 'foobar@foo.com', password: '123123')
            
    login_as user, scope: :user
    visit root_path
    click_on 'foobar@foo.com'

    expect(page).to have_content 'Meu perfil'
    expect(page).to have_content 'foobar@foo.com'
    expect(current_path).to eq my_profile_path
 
  end
end
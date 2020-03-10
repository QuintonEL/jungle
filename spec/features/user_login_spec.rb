require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  # SETUP
  before :each do
    @user = User.create!(
      first_name: 'first', 
      last_name: 'last', 
      email: 'test@test.com', 
      password: 'password', 
      password_confirmation: 'password')
  end

  scenario "They should be logged in" do

    visit root_path

    click_on 'Login'
    sleep(1)

    page.has_content?('email')
    
    fill_in 'email', with: 'test@test.com'
    fill_in 'password', with: 'password'
    
    click_on 'Submit'
    sleep(1)

    page.has_content?('Products')
    page.has_content?('Signed in as')
    save_and_open_screenshot

  end
end

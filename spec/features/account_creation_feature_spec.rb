require 'spec_helper'

describe 'account creation' do
  it 'allows users to create account' do
    visit root_path
    click_link 'Create Account'
    fill_in 'Name', with: 'Hunter'
    fill_in 'Email', with: 'example@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    fill_in 'Subdomain', with: 'test_subdomain'
    click_button 'Create Account'

    expect(page).to have_content('Signed up successfully')
  end
end
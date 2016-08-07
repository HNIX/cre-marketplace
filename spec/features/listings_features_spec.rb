require 'spec_helper'

describe 'invitations' do
  let!(:account) { create(:account_with_schema) }
  let(:user) { account.owner }


  before do
    set_subdomain(account.subdomain)
    sign_user_in(user)
  end

  it 'allows listings to be created' do
    visit root_path
    click_link  'New Listing'

    fill_in "Name", with: "New Listing"
    fill_in "Address", with: "123 example dr"
    fill_in "City", with: "Nashville"
    fill_in "State", with: "TN"
    fill_in "Zipcode", with: "37211"

    click_button 'Create Listing'
    expect(page).to have_text "New Listing"
    expect(page).to have_text "123 example dr"
  end

  it 'displays listing validations' do
    visit root_path
    click_link "New Listing"
    click_button "Create Listing"
    expect(page).to have_text "can't be blank"
  end

  it 'allows listings to be edited' do
    visit root_path
    click_edit_listing_button listing.name

    fill_in "Name", with: "A new name"

    click_button 'Update Listing'

    expect(page).to have_text "Listing updated!"
    expect(page).to have_text "A new name"
  end

  def click_edit_listing_button(listing_name)
    within find("h3", text: listing_name) do
      page.first("a").click
    end
  end
end

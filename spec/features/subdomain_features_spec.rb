require 'spec_helper'

describe 'subdomains' do
  let!(:account) { create(:account_with_schema) }

  it 'redirects invalid accounts' do
    visit root_url(subdomain: 'randomsubdomain')
    expect(page.current_url).to_not include('randomsubdomain')
  end

  it 'allows valid accounts' do
    visit root_url(subdomain: account.subdomain)
    expect(page.current_url).to include(account.subdomain)
  end

  it 'forces users to login before accessing subdomain content' do
    listing = create(:listing)
    visit root_url(subdomain: account.subdomain)
    within find("h3", text: listing.name) do
      page.first("a").click
    end
    expect(page).to have_content 'sign in or sign up before continuing'
  end

end

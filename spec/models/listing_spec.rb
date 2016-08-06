require 'spec_helper'

RSpec.describe Listing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_uniqueness_of :name }
    it { should validate_presence_of :address }
  end

  describe 'associations' do

  end

  it 'defaults active to false' do
    expect(Listing.new).to_not be_active
  end
end

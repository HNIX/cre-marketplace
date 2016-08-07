FactoryGirl.define do
  factory :listing do
    sequence(:name) { |n| "My Listing #{n}" }
    association :account, factory: :account, strategy: :build
    address "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    active true
  end
end

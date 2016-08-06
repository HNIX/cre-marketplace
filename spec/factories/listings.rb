FactoryGirl.define do
  factory :listing do
    sequence(:name) { |n| "My Listing #{n}" }
    address "MyString"
    city "MyString"
    state "MyString"
    zipcode "MyString"
    active false
  end
end

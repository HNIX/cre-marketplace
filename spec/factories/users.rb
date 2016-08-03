FactoryGirl.define do
  factory :user do
    name 'Hunter'
    sequence(:email) { |n| "email#{n}@example.com"}
    password 'password'
  end
end

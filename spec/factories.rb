FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    password 'password'
  end

  factory :contact_form do
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:name)  { |n| "Person no.#{n}"}
    message "This is a message!"
  end
end


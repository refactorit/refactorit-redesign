FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:name) { |n| "Person #{n}"}
    password 'password'
  end

  factory :contact_form do
    sequence(:email) { |n| "person_#{n}@example.com" }
    sequence(:name)  { |n| "Person no.#{n}"}
    message "This is a message!"
  end

  factory :post do
    association :author, factory: :user
    sequence(:title) { |n| "Post title #{n}" }
    description 'Post description'
    body 'Post body'
    factory :published_post do
      status "published"
    end
  end
end

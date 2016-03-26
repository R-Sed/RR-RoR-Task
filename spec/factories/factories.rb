FactoryGirl.define do

  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    sequence(:name) { |n| "User_#{n}" }
    sequence(:password) { |n|   "#{n}#{n}#{n}#{n}#{n}#{n}" }
  end


  factory :post do
    sequence(:title) { |n| "#{n}_post_title" }
    sequence(:text) { |n| "#{n}_post_text" }

    user nil
  end

  factory :comment do
    sequence(:text) { |n| "#{n}_comment_text" }
    user nil
    post nil
  end
end

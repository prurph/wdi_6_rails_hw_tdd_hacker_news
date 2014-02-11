FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    username  { Faker::Name.first_name }
    password 'swordfish'
  end

  factory :story do
    title       { Faker::Lorem.words(num = 3).join(" ") }
    description { Faker::Lorem.sentences(sentence_count = 4).join(" ") }
    link        { Faker::Internet.url }
    points      { rand(100) }
    user
  end

  factory :comment do
    body        { Faker::Lorem.sentences(sentence_count = 2).join(" ") }
    user
    story
  end
end

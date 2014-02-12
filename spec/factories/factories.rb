FactoryGirl.define do
  factory :user do
    email     { Faker::Internet.email }
    # Random #'s here because Fake doesn't really have that many unique names
    username  { "#{Faker::Name.first_name}#{rand(1000)}" }
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

  factory :vote do |vote|
    user
    vote.votable { |v| v.association(:story) }
    value   { [-1, 0, 1].shuffle.first }
  end
end

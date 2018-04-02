FactoryBot.define do
  factory :comment do
    commenter { Faker::StarWars.character }
    body { Faker::Lorem.sentence }
    done false
    article_id nil
  end
end

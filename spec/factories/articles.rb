FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    summary { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph(25) }
  end
end

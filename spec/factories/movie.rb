FactoryGirl.define do
  factory :movie do
    title { Faker::Name.name }
    tmdb_id { Faker::Number.number(8) }
    release_date { Faker::Date.between(2.days.ago, Date.today).to_s }
    popularity { Faker::Number.number(1) }
    vote_count { Faker::Number.number(3) }
    overview { Faker::Hipster.paragraph }
  end
end

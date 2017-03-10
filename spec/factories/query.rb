FactoryGirl.define do
  factory :query do
    params { { title: Faker::Hipster.word } }
  end
end

FactoryBot.define do
  factory :message do
      author { Faker::Movies::BackToTheFuture.character }
      content { Faker::Movies::BackToTheFuture.quote }
      is_french { true }
  end
end
FactoryBot.define do
  factory :message do
      author { Faker::JapaneseMedia::OnePiece.character }
      content { %w{blue green pink yellow}.sample }
      is_french { true }
  end
end
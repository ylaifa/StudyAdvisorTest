FactoryBot.define do
  factory :message do
      author { Faker::Movies::BackToTheFuture.character }
      content { ["C est un message test", "Il fait beau ici, j espere que chez toi aussi!", "tu rentres quand a la maison, je t ai prepare une tarte a la myrtille"].sample }
      is_french { true }
  end
end
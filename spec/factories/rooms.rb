FactoryBot.define do
  factory :room do
    name { "テスト施設" }
    description { "テスト施設の説明" }
    price { 1000 }
    address { "東京都新宿区" }
    # association :user
  end
end

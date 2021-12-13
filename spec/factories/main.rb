FactoryBot.define do
  factory :main do
    name { "メイン食品" }
    calorie { 100 }
    sugar { 100 }
    lipid { 100 }
    salt { 100 }

    trait :genre do
      genre { noodle }
    end
    trait :genre do
      genre { rice }
    end

    trait :stores do
      stores { seven }
    end
    trait :stores do
      stores { lawson }
    end
    trait :stores do
      stores { family }
    end
  end
end

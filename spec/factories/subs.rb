FactoryBot.define do
  factory :sub do
    name { "サブ食品" }
    calorie { 100 }
    sugar { 100 }
    lipid { 100 }
    salt { 100 }

    trait :stores do
      stores { seven }
    end
    trait :stores do
      stores { lawson }
    end
    trait :family do
      stores { family }
    end
  end
end

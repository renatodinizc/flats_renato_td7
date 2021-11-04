FactoryBot.define do
  factory :property_type do
    name { generate(:name)}
  end
end

FactoryBot.define do
  sequence :name do |n|
    "Tipo#{n}"
  end
end

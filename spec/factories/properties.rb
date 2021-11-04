FactoryBot.define do
  factory :property do
    title {'Casa com quintal em Copacabana'}
    description {'Excelente casa, recém reformada com 2 vagas de garagem'}
    rooms {3}
    bathrooms {2}
    parking_spot {true}
    pet_friendly {true}
    daily_rate {400}
    property_type
    
  end
end
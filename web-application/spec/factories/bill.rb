# This will guess the Client class
FactoryBot.define do
  factory :Bill do
    import 50
    association :client
    association :price
  end
end

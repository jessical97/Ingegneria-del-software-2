# This will guess the Client class
FactoryBot.define do
  factory :Activity do
    hours 10
    association :client
    association :bill
  end
end

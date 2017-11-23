# This will guess the Client class
FactoryBot.define do
  factory :PrivateClient do
    name 'Mario'
    surname 'Rossi'
    address 'Via Milano, 15'
    cap '31030'
    city 'Milano'
    country 'IT'
    ssn 'RSSMRA55T08F205C'
  end

  factory :BusinessClient do
    name 'Tarlo'
    address 'Via Torino, 15'
    cap '25078'
    city 'Torino'
    country 'IT'
    ssn '00488410010'
  end
end

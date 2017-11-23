# Contain the format of client store in DB
class Client < ApplicationRecord
  VALID_CAP = /\A[0-9]{5}\z/i

  validates(:address,
            presence: true)
  validates(:cap,
            presence: true,
            format: { with: VALID_CAP })
  validates(:city,
            presence: true)
  validates(:country,
            presence: true)
end

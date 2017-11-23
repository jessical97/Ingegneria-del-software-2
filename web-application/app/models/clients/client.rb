# Contain the format of client store in DB
class Client < ApplicationRecord
  VALID_CAP = /\A[0-9]{5}\z/i

  has_many :Bill, dependent: :restrict_with_error
  has_many :Activity, dependent: :restrict_with_error

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

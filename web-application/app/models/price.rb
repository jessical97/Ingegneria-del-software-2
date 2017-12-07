# Contain the format of price store in DB
class Price < ApplicationRecord
  validates(:import,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0
            })
end

# Contain the format of activity store in DB
class Activity < ApplicationRecord
  belongs_to :client
  belongs_to :bill, optional: true

  validates(:hours,
            presence: true,
            numericality: {
              greater_than: 0
            })
end

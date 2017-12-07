# Contain the format of activity store in DB
class Activity < ApplicationRecord
  belongs_to :client
  belongs_to :bill, optional: true

  VALID_CAP = /\A(0|[1-9][0-9]*)\z/i
  validates(:hours,
            presence: true,
            format: { with: VALID_CAP })
end

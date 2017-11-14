# Contain the format of activity store in DB
class Activity < ApplicationRecord
  belongs_to :client
end

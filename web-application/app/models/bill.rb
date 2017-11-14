# Contain the format of bill store in DB
class Bill < ApplicationRecord
  belongs_to :client
end

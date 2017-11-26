# Contain the format of bill store in DB
class Bill < ApplicationRecord
  belongs_to :client
  has_attached_file :invoice
  validates_attachment :invoice, content_type: {
    content_type: 'application/pdf'
  }
end

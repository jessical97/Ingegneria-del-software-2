# Contain the format of bill store in DB
class Bill < ApplicationRecord
  belongs_to :client
  has_many :activities, dependent: :nullify
  has_attached_file :invoice
  validates_attachment :invoice, content_type: {
    content_type: 'application/pdf'
  }

  before_create :randomize_file_name

  private

  def randomize_file_name
    invoice.instance_write(:file_name, "#{SecureRandom.hex(16)}.pdf")
  end
end

# Contain the format of bill store in DB
class Bill < ApplicationRecord
  belongs_to :client
  has_many :activities, dependent: :nullify
  has_attached_file :invoice,
                    path: 'public/system/:class/:attachment/'\
                          ':id_partition/:style/'\
                          ':hash.pdf',
                    hash_secret: 'weoBeKrpkL'
  validates_attachment :invoice, content_type: {
    content_type: 'application/pdf'
  }
end

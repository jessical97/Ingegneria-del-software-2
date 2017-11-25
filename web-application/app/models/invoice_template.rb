# Contain the format of bill store in DB
class InvoiceTemplate < ApplicationRecord
    has_attached_file :template
    validates_attachment :template, content_type: { content_type: "text/html" }
end
# This will guess the Client class
FactoryBot.define do
  factory :InvoiceTemplate do
    template do
      File.new("#{Rails.root}/features/file_upload/invoice-format.html")
    end
  end
end

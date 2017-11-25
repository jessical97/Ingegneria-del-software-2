class AddAttachmentInvoiceToBills < ActiveRecord::Migration[5.1]
  create_table :invoice_templates do |t|
    t.attachment :template
    
    t.timestamps
  end

  change_table :bills do |t|
    t.attachment :invoice
  end
end

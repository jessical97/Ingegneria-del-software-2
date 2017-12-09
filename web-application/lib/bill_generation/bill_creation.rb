require(Rails.root.join('lib', 'bill_generation', 'bill_parameter'))

# Function useful for generate pdf of the bill and update data related
module BillCreation
  def self.generate_bill_html_with_invoice_number(invoice_parameter,
                                                  invoice_template_content,
                                                  n_invoice)
    invoice_parameter[:nInvoice] = n_invoice.to_s
    invoice_parameter.reduce(
      invoice_template_content
    ) do |result, (key, value)|
      result.gsub '{{' + key.to_s + '}}', value
    end
  end

  def self.generate_pdf_from_html(invoice_html)
    pdf = WickedPdf.new.pdf_from_string(
      invoice_html
    )
    StringIO.new(pdf)
  end

  def self.update_activity_into_bill(client, bill_id)
    Activity.where(
      client: client,
      bill: nil
    )
            .update_all(
              bill_id: bill_id
            )
  end

  def self.generate_pdf_from_parameter_and_id(invoice_parameter, bill)
    invoice_html = generate_bill_html_with_invoice_number(
      invoice_parameter,
      BillParameter.recovery_invoice_content,
      bill.id
    )
    # Generate PDF
    bill.invoice = generate_pdf_from_html(invoice_html)
    bill
  end

  def self.bill_generation(bill, invoice_parameter, client)
    bill.save!
    bill = BillCreation.generate_pdf_from_parameter_and_id(
      invoice_parameter,
      bill
    )
    bill.save!
    # Activity update
    BillCreation.update_activity_into_bill(client, bill.id)
  end
end

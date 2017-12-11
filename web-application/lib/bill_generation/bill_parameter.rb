require(Rails.root.join('lib', 'exception', 'bill_generation_exception'))

# Function useful for recovery the parameter need for generate a bill
module BillParameter
  def self.bill_initialization(bill_params)
    bill = Bill.new(bill_params)
    unless bill.valid?
      raise BillGenerationException.new(
        'Bill isn\'t valid',
        nil,
        bill
      )
    end
    bill
  end

  def self.bill_fullfilement(bill, number_of_hour, price)
    bill.import = number_of_hour * price
    bill
  end

  def self.client_invoice_param(invoice_parameter, client)
    invoice_parameter[:clientName] = client.complete_name
    invoice_parameter[:SSN] = client.ssn
    invoice_parameter[:address] = client.address
    invoice_parameter[:CAP] = client.cap
    invoice_parameter[:city] = client.city
    invoice_parameter[:country] = client.country
    invoice_parameter
  end

  def self.bill_attribute_param(invoice_parameter, bill, number_of_hour)
    invoice_parameter[:created] = I18n.l(Time.now.to_date, format: :short)
    invoice_parameter[:import] = bill.import.to_s + ' €'
    invoice_parameter[:IVA] = iva_calculation(bill.import)
    invoice_parameter[:total] = bill.import.to_s + ' €'
    invoice_parameter[:hoursNumber] = number_of_hour.to_s
    invoice_parameter
  end

  def self.iva_calculation(import)
    iva = ((import / 122.0) * 22.0).round(2)
    iva.to_s + ' €'
  end

  def self.number_of_hour_test(number_of_hour)
    return unless number_of_hour.zero?
    raise BillGenerationException.new(
      'Bill isn\'t valid',
      'There aren\'t any activity available'
    )
  end

  def self.invoice_template_test(invoice_template)
    return unless invoice_template.nil?
    raise BillGenerationException.new(
      'Bill isn\'t valid',
      'You haven\'t set a template yet'
    )
  end

  def self.price_test(price)
    return unless price.nil?
    raise BillGenerationException.new(
      'Bill isn\'t valid',
      'You haven\'t set a price yet'
    )
  end

  def self.recovery_invoice_content
    invoice_template = InvoiceTemplate.order(created_at: :desc).first
    invoice_template_test(invoice_template)
    Paperclip.io_adapters.for(invoice_template.template).read
  end

  def self.recovery_price
    price = Price.order(created_at: :desc).first
    price_test(price)
    price.import
  end

  def self.recovery_number_of_hour(client)
    number_of_hour = Activity.where(client: client, bill: nil)
                             .sum(:hours)
    number_of_hour_test(number_of_hour)
    number_of_hour
  end

  def self.invoice_parameter_init(client, bill, number_of_hour)
    invoice_parameter = {}
    invoice_parameter = client_invoice_param(
      invoice_parameter,
      client
    )
    bill_attribute_param(
      invoice_parameter,
      bill,
      number_of_hour
    )
  end
end

Given('I set a valid price') do
  @valid_price = create :Price
end

Given('I set a valid invoice template') do
  @valid_price = create :InvoiceTemplate
end

Then('I must find bill in list') do
  visit '/clients'
  table = find('table')
  table_rows = table.all('tr')
  found = false
  table_rows.each do |row|
    contain_all = true
    @insert.each_value do |value|
      inside = row.has_text?(value)
      if inside == false
        contain_all = false
        break
      end
    end
    found = true if contain_all == true
  end
  expect(found).to eq(true)
end

Then('I must see a elaboration error') do
  expect(page).to have_css('.alert-danger')
end

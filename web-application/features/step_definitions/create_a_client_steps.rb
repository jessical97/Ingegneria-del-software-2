Given('I am on the list of clients') do
  visit '/clients'
end

When('I click on {string}') do |string|
  click_on string
end

When('I check the {string} option') do |string|
  check string
end

When('I select in the {string} dropdown {string}') do |field, option_to_select|
  select(option_to_select, from: field)
end

When('I fill in the form') do |table|
  hashes = table.hashes
  hashes.each do |hash|
    hash.each do |key, value|
      fill_in key, with: value
    end
    @insert = hash
  end
end

Then('I must find client in list') do |_table|
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

Then('I must see an error') do
  expect(page).to have_css('.error')
end

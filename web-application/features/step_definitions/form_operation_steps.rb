When('I click on {string}') do |string|
  click_on string
end

When('I check the {string} option') do |string|
  check string
end

When('I uncheck the {string} option') do |string|
  uncheck string
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

Then('I must see an error') do
  expect(page).to have_css('.error')
end

Then('I must see an success message') do
  expect(page).to have_css('#notice')
end

require 'pry'
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
  @insert = {} if @insert.nil?
  @insert['field'] = option_to_select
end

When('I fill in the form') do |table|
  hashes = table.hashes
  hashes.each do |hash|
    hash.each do |key, value|
      fill_in key, with: value
    end
    @insert = {} if @insert.nil?
    @insert = @insert.merge hash
  end
end

When('I upload on {string} the file inside {string}') do |field, file_to_upload|
  attach_file(field, File.absolute_path(file_to_upload))
end

When('I confirm the alert') do
  page.driver.browser.switch_to.alert.accept
end

Then('I must see an error') do
  expect(page).to have_css('.help-block')
end

Then('I must see an success message') do
  expect(page).to have_css('.alert-success')
end

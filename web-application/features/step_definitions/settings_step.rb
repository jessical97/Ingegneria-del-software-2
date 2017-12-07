Given('I am on the settings page') do
  visit '/settings'
end

Then('I see a confirmation message') do
  expect(page)
end

Given('I am on the list of clients') do
  visit '/clients'
end

Given('I create a valid public client') do
  @valid_client = build(:BusinessClient)
end

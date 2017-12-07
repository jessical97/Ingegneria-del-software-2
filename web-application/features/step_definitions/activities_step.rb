Given('I am on the list of activities') do
  visit '/activities'
end

Given('I create a valid activity') do
  @valid_activity = create :Activity, client: @valid_client, bill: nil
end

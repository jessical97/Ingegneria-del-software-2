Feature: delete a activity
  In order to keep track of client
  As a user
  I want to delete a client
  
  @no-txn
  Scenario: delete a activity
    Given I am on the list of activity
    And I create a valid public client
    And I create a valid activity
    When I click on "Destroy"
    Then I must see a success message
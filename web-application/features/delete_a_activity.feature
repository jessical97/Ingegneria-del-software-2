Feature: delete a activity
  In order to keep track of client
  As a user
  I want to delete a client
  
  @no-txn
  Scenario: delete a activity
    Given I create a valid public client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Destroy"
    And I confirm the alert
    Then I must see an success message
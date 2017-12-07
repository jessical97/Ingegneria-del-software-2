Feature: create a client
  In order to keep track of client
  As a user
  I want to delete a client
  
  @no-txn
  Scenario: delete a client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Destroy"
    And I confirm the alert
    Then I must see an success message

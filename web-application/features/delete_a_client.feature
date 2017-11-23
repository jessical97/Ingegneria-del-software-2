Feature: create a client
  In order to keep track of client
  As a user
  I want to delete a client
  
  @no-txn
  Scenario: delete a client
    Given I am on the list of clients
    And I create a valid private client
    When I click on "Destroy"
    Then I must see an success message

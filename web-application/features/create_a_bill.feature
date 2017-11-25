Feature: create a bill
  In order to keep track of bill
  As a user
  I want to create a new bill

  @no-txn
  Scenario: create a valid bill
    Given I am on the list of bill
    And I create a valid public client
    And I create a valid activity
    When I click on "New Bill"
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Bill"
    Then I must find bill in list
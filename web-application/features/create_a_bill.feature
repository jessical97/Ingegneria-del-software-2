Feature: create a bill
  In order to keep track of bill
  As a user
  I want to create a new bill

  @no-txn
  Scenario: create a valid bill
    Given I am on the list of bill
    And I create a valid public client
    And I create a valid activity
    And I set a valid invoice template
    And I set a valid price
    When I click on "New Bill"
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Bill"
    Then I must find bill in list
  
  Scenario: try to create a bill without client
    Given I am on the list of bill
    And I create a valid public client
    And I create a valid activity
    And I set a valid invoice template
    And I set a valid price
    When I click on "New Bill"
    And I select in the "Client" dropdown ""
    And I click on "Create Bill"
    Then I must see an error

  Scenario: try to create a bill without activity
    Given I am on the list of bill
    And I create a valid public client
    And I set a valid invoice template
    And I set a valid price
    When I click on "New Bill"
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Bill"
    Then I must see a elaboration error

  Scenario: try to create a bill without invoice template
    Given I am on the list of bill
    And I create a valid public client
    And I create a valid activity
    And I set a valid price
    When I click on "New Bill"
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Bill"
    Then I must see a elaboration error
  
  Scenario: try to create a bill without hourly price
    Given I am on the list of bill
    And I create a valid public client
    And I create a valid activity
    And I set a valid invoice template
    When I click on "New Bill"
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Bill"
    Then I must see a elaboration error
Feature: create a activity
  In order to keep track of activity
  As a user
  I want to create a new activity

  @no-txn
  Scenario: create a valid activity
    Given I am on the list of activities
    And I create a valid public client
    When I click on "New Activity"
    And I fill in the form
    |Hour|
    |1   |
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Activity"
    Then I must find activity in list

  @no-txn
  Scenario: create a activity with invalid Hour
    Given I am on the list of activities
    And I create a valid public client
    When I click on "New Activity"
    And I fill in the form
    |Hour|
    |-6  |
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Activity"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without Hour
    Given I am on the list of activities
    And I create a valid public client
    When I click on "New Activity"
    And I fill in the form
    |Hour|
    |    |
    And I select in the "Client" dropdown "Tarlo"
    And I click on "Create Activity"
    Then I must see an error
    
  @no-txn
  Scenario: try to create a activity without Client
    Given I am on the list of activities
    And I create a valid public client
    When I click on "New Activity"
    And I fill in the form
    |Hour|
    |1   |
    And I click on "Create Activity"
    Then I must see an error
Feature: update a client
  In order to keep track of client
  As a user
  I want to update a client

  @no-txn
  Scenario: Update valid Hour of a activity
    Given I create a valid public client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Edit"
    And I fill in the form
    |Hour|
    |1   |
    And I click on "Update Activity"
    Then I must find client in list

  @no-txn
  Scenario: Try to update activity with invalid Hour
    Given I create a valid public client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Edit"
    And I fill in the form
    |Hour|
    |-1  |
    And I click on "Update Activity"
    Then I must see an error

  @no-txn
  Scenario: Try to update activity without Hour
    Given I create a valid public client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Edit"
    And I fill in the form
    |Hour|
    |    |
    And I click on "Update Activity"
    Then I must see an error

  @no-txn
  Scenario: Update valid Client of a activity
    Given I create a valid public client
    And I create a valid private client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Edit"
    And I select in the "Client" dropdown "Mario Rossi"
    And I click on "Update Activity"
    Then I must find client in list

  @no-txn
  Scenario: Try to update activity without Client
    Given I create a valid public client
    And I create a valid private client
    And I create a valid activity
    And I am on the list of activities
    When I click on "Edit"
    And I select in the "Client" dropdown ""
    And I click on "Update Activity"
    Then I must see an error
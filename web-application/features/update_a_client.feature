Feature: update a client
  In order to keep track of client
  As a user
  I want to update a client

  @no-txn
  Scenario: Update valid Name of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Name|
    |John|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Name of a private client with invalid Name
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Name |
    |John8|
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Try to update Name of a private client without Name
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Name |
    |     |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Surname of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Surname|
    |Doe    |
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Surname of a private client with invalid Surname
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Surname|
    |Doe8   |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Try to update Surname of a private client without Surname
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Surname|
    |       |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Address of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Address    |
    |Via Man, 15|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Address of a private client without Address
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Address|
    |       |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid CAP of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP  |
    |23091|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update CAP of a private client with invalid CAP
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP |
    |2309|
    And I click on "Update Client"
    Then I must see an error
  
  @no-txn
  Scenario: Try to update CAP of a private client without CAP
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP|
    |   |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid City of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |City    |
    |New York|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update City of a private client without City
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |City|
    |    |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Country of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I select in the "Country" dropdown "United States"
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Country of a private client without Country
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I select in the "Country" dropdown ""
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid SSN of a private client
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn             |
    |DOEJHN34D10Z404C|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update SSN of a private client with invalid SSN
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn          |
    |DOEJHN34D10Z4|
    And I click on "Update Client"
    Then I must see an error
  
  @no-txn
  Scenario: Try to update SSN of a private client without SSN
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn|
    |   |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Name of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Name  |
    |Trinco|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Name of a public client without Name
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Name   |
    |Trinco8|
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Address of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Address    |
    |Via Los, 15|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Address of a public client without Address
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Address|
    |       |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid CAP of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP  |
    |19456|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update CAP of a public client with invalid CAP
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP |
    |1945|
    And I click on "Update Client"
    Then I must see an error
  
  @no-txn
  Scenario: Try to update CAP of a public client without CAP
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |CAP|
    |   |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid City of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |City       |
    |Los Angeles|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update City of a public client without City
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |City|
    |    |
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid Country of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I select in the "Country" dropdown "United States"
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update Country of a public client without Country
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I select in the "Country" dropdown ""
    And I click on "Update Client"
    Then I must see an error

  @no-txn
  Scenario: Update valid SSN of a public client
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn        |
    |16435838201|
    And I click on "Update Client"
    Then I must find client in list

  @no-txn
  Scenario: Try to update SSN of a public client with invalid SSN
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn       |
    |1643583820|
    And I click on "Update Client"
    Then I must see an error
  
  @no-txn
  Scenario: Try to update SSN of a public client without SSN
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I fill in the form
    |Ssn|
    |   |
    And I click on "Update Client"
    Then I must see an error
  
  @no-txn
  Scenario: Try to change type of client from private to public
    Given I create a valid private client
    And I am on the list of clients
    When I click on "Edit"
    And I click on "Business Client"
    And I click on "Update Client"
    Then I must find client in list
  
  @no-txn
  Scenario: Try to change type of client from public to private
    Given I create a valid public client
    And I am on the list of clients
    When I click on "Edit"
    And I click on "Private Client"
    And I click on "Update Client"
    Then I must find client in list

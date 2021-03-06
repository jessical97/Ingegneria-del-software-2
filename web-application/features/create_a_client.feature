Feature: create a client
  In order to keep track of client
  As a user
  I want to create a new client

  @no-txn
  Scenario: create a valid private client
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |City  |Ssn             |
    |Mario|Rossi  |Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must find client in list

  @no-txn
  Scenario: create a private client with invalid Name
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name  |Surname|Address       |CAP  |City  |Ssn             |
    |Mario8|Rossi  |Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without Name
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Surname|Address       |CAP  |City  |Ssn             |
    |Rossi  |Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error
    
  @no-txn
  Scenario: try to create a private client with invalid Surname
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |City  |Ssn             |
    |Mario|Rossi89|Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without Surname
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Address       |CAP  |City  |Ssn             |
    |Mario|Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without Address
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|CAP  |City  |Ssn             |
    |Mario|Rossi  |31030|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client with invalid CAP
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP |City  |Ssn             |
    |Mario|Rossi  |Via Milano, 15|3103|Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without CAP
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|City  |Ssn             |
    |Mario|Rossi  |Milano|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without City
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |Ssn             |
    |Mario|Rossi  |Via Milano, 15|31030|RSSMRA55T08F205C|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without Country
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |City  |Ssn             |
    |Mario|Rossi  |Via Milano, 15|31030|Milano|RSSMRA55T08F205C|
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: create a private client with invalid SSN
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |City  |Ssn        |
    |Mario|Rossi  |Via Milano, 15|31030|Milano|RSSMRA55T08|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a private client without SSN
    Given I am on the list of clients
    When I click on "New Client"
    And I fill in the form
    |Name |Surname|Address       |CAP  |City  |
    |Mario|Rossi  |Via Milano, 15|31030|Milano|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error
    
  @no-txn
  Scenario: create a valid public client
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP  |City  |Ssn        |
    |Tarlo|Via Torino, 15|25078|Torino|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must find client in list

  @no-txn
  Scenario: try to create a public client without Name
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Address       |CAP  |City  |Ssn        |
    |Via Torino, 15|25078|Torino|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client without Address
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |CAP  |City  |Ssn        |
    |Tarlo|25078|Torino|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client with invalid CAP
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP |City  |Ssn        |
    |Tarlo|Via Torino, 15|2507|Torino|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client without CAP
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |City  |Ssn        |
    |Tarlo|Torino|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client without City
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP  |Ssn        |
    |Tarlo|Via Torino, 15|25078|00488410010|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client without Country
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP  |City  |Ssn        |
    |Tarlo|Via Torino, 15|25078|Torino|00488410010|
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: create a public client with invalid SSN
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP  |City  |Ssn        |
    |Tarlo|Via Torino, 15|25078|Torino|RSSMRA55T08|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error

  @no-txn
  Scenario: try to create a public client without SSN
    Given I am on the list of clients
    When I click on "New Client"
    And I click on "Business Client"
    And I fill in the form
    |Name |Address       |CAP  |City  |
    |Tarlo|Via Torino, 15|25078|Torino|
    And I select in the "Country" dropdown "Italy"
    And I click on "Create Client"
    Then I must see an error
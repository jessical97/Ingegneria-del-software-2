Feature: edit setting
  In order to make a flexible invoice layout and change price of facturation
  As a user
  I want to change price and upload invoice template
  
  @no-txn
  Scenario: upload a layout
    Given I am on the settings page
    When I upload on "Invoice Template" the file "validinvoice.html"
    And I click on "Submit"
    Then I see a confirmation message

  Scenario: upload price
    Given I am on the settings page
    When I fill in the form
    |Price|
    |9    |
    And I click on "Submit"
    Then I see a confirmation message

Feature: edit setting
  In order to make a flexible invoice layout and change price of facturation
  As a user
  I want to change price and upload invoice template
  
  @no-txn
  Scenario: upload a layout
    Given I am on the settings page
    When I upload on "Invoice template" the file inside "features/file_upload/invoice-format.html"
    And I click on "Submit"
    Then I must see an success message

  Scenario: upload price
    Given I am on the settings page
    When I fill in the form
    |Price|
    |9    |
    And I click on "Submit"
    Then I must see an success message

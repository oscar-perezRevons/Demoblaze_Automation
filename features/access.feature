Feature: Demoblaze User Access
  In order to buy products in the store
  As a new customer
  I want to register my account and log in to the platform

@maximize
Scenario: Successful user sign up
   Given I am on the Demoblaze homepage "https://www.demoblaze.com"
   And I click the "Sign up" link
   When I enter the registration fields as show below
      | Username | Revons  |
      | Password | Revons  |
    And I click the "Sign up" button in the modal
    Then an alert message saying "This user already exist." is displayed

@maximize   
Scenario: Successful user log in
    Given I am on the Demoblaze homepage "https://www.demoblaze.com"
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | Revons  |
      | Password | Revons  |
    And I click the "Log in" button in the modal
    Then the welcome message "Welcome Revons" should be displayed in the navbar
Feature: Demoblaze User Access
  In order to buy products in the store
  As a new customer
  I want to register my account and log in to the platform

  Background: Open the Demoblaze home page
    Given I am on the Demoblaze homepage

@smoke @maximize
Scenario: User can sign up and log in successfully
    When I register with new valid credentials
    Then an alert message saying "Sign up successful." is displayed
    When I log in with the generated credentials
    Then the welcome message for the generated user should be displayed in the navbar

@smoke
Scenario: User cannot log in with an invalid password
    Given I have a newly registered user account
    When I log in with the generated username and password "WrongPass123"
    Then an alert message saying "Wrong password." is displayed

@smoke
Scenario: User cannot log in with a non-existing user
    When I log in with a generated user that is not registered
    Then an alert message saying "User does not exist." is displayed

@smoke
Scenario: User can log out successfully
    Given I am logged in with a newly registered user
    When I click the "Log out" link
    Then the "Log in" link should be visible in the navbar
    And the welcome message should not be displayed in the navbar

Scenario Outline: User cannot sign up with incomplete credentials
    When I click the "Sign up" link
    And I enter the registration fields as shown below
      | Username | <Username> |
      | Password | <Password> |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Please fill out Username and Password." is displayed

Examples:
    | Username  | Password  |
    | AUTO_USER |           |
    |           | AUTO_PASS |

Feature: Demoblaze User Access
  In order to buy products in the store
  As a new customer
  I want to register my account and log in to the platform

  Background: Open the Demoblaze home page
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"

@smoke @maximize
Scenario: User can sign up and log in successfully
    When I click the "Sign up" link
    And I enter the registration fields as shown below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Sign up successful." is displayed
    And I click the "Log in" link
    And I enter the login credentials as shown below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Log in" button in the modal
    Then the welcome message for the generated user should be displayed in the navbar

@smoke
Scenario: User cannot log in with an invalid password
    When I click the "Sign up" link
    And I enter the registration fields as shown below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Sign up successful." is displayed
    And I click the "Log in" link
    And I enter the login credentials as shown below
      | Username | AUTO_USER |
      | Password | WrongPass123 |
    And I click the "Log in" button in the modal
    Then an alert message saying "Wrong password." is displayed

@smoke
Scenario: User cannot log in with a non-existing user
    When I click the "Log in" link
    And I enter the login credentials as shown below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Log in" button in the modal
    Then an alert message saying "User does not exist." is displayed

@smoke
Scenario: User can log out successfully
    Given I am logged in with a newly registered user
    Then the "Log out" link should be visible in the navbar
    And the "Log in" link should not be visible in the navbar
    When I click the "Log out" link
    Then the "Log in" link should be visible in the navbar
    And the welcome message should not be displayed in the navbar

@regression
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

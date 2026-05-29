Feature: Demoblaze User Access
  In order to buy products in the store
  As a new customer
  I want to register my account and log in to the platform

  Background: Enter to main Demoblaze main page
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"

@maximize
Scenario: Successful user sign up
   And I click the "Sign up" link
   When I enter the registration fields as show below
      | Username | Revons |
      | Password | Revons |
    And I click the "Sign up" button in the modal
    Then an alert message saying "This user already exist." is displayed

@maximize
Scenario: Successful user log in
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | Revons |
      | Password | Revons |
    And I click the "Log in" button in the modal
    Then the welcome message "Welcome Revons" should be displayed in the navbar

Scenario: User cannot sign up with empty credentials
   And I click the "Sign up" link
   When I enter the registration fields as show below
      | Username | |
      | Password | |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Please fill out Username and Password." is displayed

Scenario: User cannot log in with an invalid password
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | Revons |
      | Password | WrongPass123 |
    And I click the "Log in" button in the modal
    Then an alert message saying "Wrong password." is displayed

Scenario: Successful user log out
    Given I am logged in with the credentials as show below
      | Username | Revons |
      | Password | Revons |
    When I click the "Log out" link
    Then the "Log in" link should be visible in the navbar
    And the welcome message should not be displayed in the navbar

Scenario: User cannot log in with empty credentials
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | |
      | Password | |
    And I click the "Log in" button in the modal
    Then an alert message saying "Please fill out Username and Password." is displayed

Scenario: New user can sign up and then log in
    And I click the "Sign up" link
    When I enter the registration fields as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Sign up successful." is displayed
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Log in" button in the modal
    Then the welcome message for the generated user should be displayed in the navbar

Scenario: User cannot log in with a non-existing user
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "Log in" button in the modal
    Then an alert message saying "User does not exist." is displayed

Scenario: Access links are hidden after successful login
    Given I am logged in with the credentials as show below
      | Username | Revons |
      | Password | Revons |
    Then the "Log out" link should be visible in the navbar
    And the "Log in" link should not be visible in the navbar
    And the "Sign up" link should not be visible in the navbar

Scenario Outline: User cannot sign up with incomplete credentials
    And I click the "Sign up" link
    When I enter the registration fields as show below
      | Username | <Username> |
      | Password | <Password> |
    And I click the "Sign up" button in the modal
    Then an alert message saying "Please fill out Username and Password." is displayed

Examples:
    | Username  | Password  |
    | AUTO_USER |           |
    |           | AUTO_PASS |

Scenario Outline: User cannot log in with incomplete credentials
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | <Username> |
      | Password | <Password> |
    And I click the "Log in" button in the modal
    Then an alert message saying "Please fill out Username and Password." is displayed

Examples:
    | Username | Password |
    | Revons   |          |
    |          | Revons   |
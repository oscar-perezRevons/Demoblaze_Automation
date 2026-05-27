Feature: Demoblaze User Access
  In order to buy products in the store
  As a customer
  I want to register my account and log in to the platform

@maximize
Scenario: Successful user sign up
   Given I am on the Demoblaze homepage "$urls.home"
   And I click the "$links.signup" link
   When I enter the registration fields as show below
      | Username | $users.revons.username |
      | Password | $users.revons.password |
    And I click the "$buttons.signup" button in the modal
    Then an alert message saying "$alerts.user_exists" is displayed

Scenario: Successful user log in
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | $users.revons.username |
      | Password | $users.revons.password |
    And I click the "$buttons.login" button in the modal
    Then the welcome message "$messages.welcome_revons" should be displayed in the navbar

Scenario: User cannot sign up with empty credentials
   Given I am on the Demoblaze homepage "$urls.home"
   And I click the "$links.signup" link
   When I enter the registration fields as show below
      | Username | |
      | Password | |
    And I click the "$buttons.signup" button in the modal
    Then an alert message saying "$alerts.fill_credentials" is displayed

Scenario: User cannot log in with an invalid password
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | $users.revons.username |
      | Password | $users.invalid_password |
    And I click the "$buttons.login" button in the modal
    Then an alert message saying "$alerts.wrong_password" is displayed

Scenario: Successful user log out
    Given I am logged in with the credentials as show below
      | Username | $users.revons.username |
      | Password | $users.revons.password |
    When I click the "$links.logout" link
    Then the "$links.login" link should be visible in the navbar
    And the welcome message should not be displayed in the navbar

Scenario: User cannot log in with empty credentials
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | |
      | Password | |
    And I click the "$buttons.login" button in the modal
    Then an alert message saying "$alerts.fill_credentials" is displayed

Scenario: New user can sign up and then log in
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.signup" link
    When I enter the registration fields as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "$buttons.signup" button in the modal
    Then an alert message saying "$alerts.signup_success" is displayed
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "$buttons.login" button in the modal
    Then the welcome message for the generated user should be displayed in the navbar

Scenario: User cannot log in with a non-existing user
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | AUTO_USER |
      | Password | AUTO_PASS |
    And I click the "$buttons.login" button in the modal
    Then an alert message saying "$alerts.user_not_exists" is displayed

Scenario: Access links are hidden after successful login
    Given I am logged in with the credentials as show below
      | Username | $users.revons.username |
      | Password | $users.revons.password |
    Then the "$links.logout" link should be visible in the navbar
    And the "$links.login" link should not be visible in the navbar
    And the "$links.signup" link should not be visible in the navbar

Scenario Outline: User cannot sign up with incomplete credentials
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.signup" link
    When I enter the registration fields as show below
      | Username | <Username> |
      | Password | <Password> |
    And I click the "$buttons.signup" button in the modal
    Then an alert message saying "$alerts.fill_credentials" is displayed

Examples:
    | Username  | Password  |
    | AUTO_USER |           |
    |           | AUTO_PASS |

Scenario Outline: User cannot log in with incomplete credentials
    Given I am on the Demoblaze homepage "$urls.home"
    And I click the "$links.login" link
    When I enter the login credentials as show below
      | Username | <Username> |
      | Password | <Password> |
    And I click the "$buttons.login" button in the modal
    Then an alert message saying "$alerts.fill_credentials" is displayed

Examples:
    | Username | Password |
    | $users.revons.username |          |
    |          | $users.revons.password |

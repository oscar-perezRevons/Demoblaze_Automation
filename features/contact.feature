Feature: Demoblaze Contact and Support
  In order to get support and contact the store
  As a customer
  I want to be able to access the contact page and submit a message

    Background:
      Given I am on the Demoblaze homepage "https://www.demoblaze.com"

    @maximize
    Scenario: Send a message through the contact form
      And I click the "Contact" link in the navbar
      When I fill out the form with the following details
        | Email   | john.doe@example.com |
        | Name    | John Doe             |
        | Message | This is a test message. |
        And I click the "Send message" button
        Then an alert message saying "Thanks for the message!!" is displayed

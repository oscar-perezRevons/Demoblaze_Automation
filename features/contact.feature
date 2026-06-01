Feature: Demoblaze Contact and Support
  In order to get support and contact the store
  As a customer
  I want to be able to access the contact page and submit a message

  Background: Open the Demoblaze home page
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"

@regression @maximize
Scenario: Send a message through the contact form
    When I click the "Contact" link in the navbar
    And I fill out the form with the following details
      | Email   | camila.rojas@mail.com             |
      | Name    | Camila Rojas                      |
      | Message | Consulta sobre tiempos de entrega. |
    And I click the "Send message" button
    Then an alert message saying "Thanks for the message!!" is displayed

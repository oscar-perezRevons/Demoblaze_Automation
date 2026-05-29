Feature: Demoblaze Product Purchase
  In order to get my items delivered
  As a logged-in customer
  I want to checkout my cart and finalize the purchase

@maximize
Scenario: Successful checkout and purchase execution
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    And I click the "Log in" link
    When I enter the login credentials as show below
      | Username | Revons  |
      | Password | Revons  |
    And I click the "Log in" button in the modal
    Then the welcome message "Welcome Revons" should be displayed in the navbar

    When I click on the product "Samsung galaxy s6"
    And I click the "Add to cart" button
    Then an alert message saying "Product added." is displayed
    
    When I click the "Cart" link in the navbar
    And I click the "Place Order" button
    And I fill out the order form with the following details
      | Name    | Oscar Perez |
      | Country | Bolivia     |
      | City    | Cochabamba  |
      | Card    | 1234567890  |
      | Month   | 05          |
      | Year    | 2026        |
    And I click the "Purchase" button in the checkout modal
    Then a confirmation message "Thank you for your purchase!" should be displayed

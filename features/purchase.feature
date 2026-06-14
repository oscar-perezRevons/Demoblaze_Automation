Feature: Demoblaze Product Purchase
  In order to get my items delivered
  As a logged-in customer
  I want to checkout my cart and finalize the purchase

@smoke @maximize @cart
Scenario: Successful checkout and purchase execution
    Given I am logged in with a newly registered user

    When I open the product detail for "Samsung galaxy s6"
    And I add the current product to the cart successfully
    And I go to the cart page
    And I place an order with the details below
      | Name        | Valeria Perez    |
      | Country     | Bolivia          |
      | City        | Cochabamba       |
      | Credit card | 4578123412341234 |
      | Month       | 05               |
      | Year        | 2026             |
    Then the purchase confirmation should be displayed
    And the purchase confirmation should include "Thank you for your purchase!"

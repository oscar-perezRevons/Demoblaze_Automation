Feature: Demoblaze Product Purchase
  In order to get my items delivered
  As a logged-in customer
  I want to checkout my cart and finalize the purchase

@smoke @maximize @cart
Scenario: Successful checkout and purchase execution
    Given I am logged in with a newly registered user

    When I add to my cart the products below 
      | Category | Product Name |
      | Phones   | Samsung galaxy s6 |
      | Laptops  | Dell i7 8gb |
      | Monitors | ASUS Full HD |
    And  I click the "Cart" link in the navbar
    And I place an order with the details below
      | Name        | Valeria Perez    |
      | Country     | Bolivia          |
      | City        | Cochabamba       |
      | Credit card | 4578123412341234 |
      | Month       | 05               |
      | Year        | 2026             |
    Then the purchase confirmation should be displayed
    And the purchase confirmation should include "Thank you for your purchase!"

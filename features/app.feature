Feature: Demoblaze Store App
  In order to buy products in the store
  As a customer
  I want to browse products and manage my cart

Scenario: User can browse laptops and open a product detail
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I filter products by category "Laptops"
    Then I should see the product card "Sony vaio i5"
    When I open the product detail for "Sony vaio i5"
    Then the product detail title should be "Sony vaio i5"
    And the "Add to cart" action should be visible

Scenario: User can add a product to cart from product detail
    Given I start with an empty cart
    And I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I open the product detail for "Samsung galaxy s6"
    And I add the current product to the cart
    Then an alert message saying "Product added" is displayed
    When I go to the cart page
    Then the cart should contain the product "Samsung galaxy s6"

Scenario: User can remove a product from cart
    Given I start with an empty cart
    And I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I open the product detail for "Nokia lumia 1520"
    And I add the current product to the cart
    Then an alert message saying "Product added" is displayed
    When I go to the cart page
    And I remove the product "Nokia lumia 1520" from the cart
    Then the cart should not contain the product "Nokia lumia 1520"

Scenario: User can complete checkout from cart
    Given I start with an empty cart
    And I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I open the product detail for "Samsung galaxy s6"
    And I add the current product to the cart
    Then an alert message saying "Product added" is displayed
    When I go to the cart page
    And I place an order with the details below
      | Name        | QA Buyer         |
      | Country     | Bolivia          |
      | City        | La Paz           |
      | Credit card | 4111111111111111 |
      | Month       | 12               |
      | Year        | 2028             |
    Then the purchase confirmation should be displayed
    And the purchase confirmation should include "Thank you for your purchase!"
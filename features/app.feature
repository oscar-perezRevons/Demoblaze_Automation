Feature: Demoblaze Store App
  In order to buy products in the store
  As a customer
  I want to browse products and manage my cart

@smoke
Scenario: User can browse laptops and open a product detail
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I filter products by category "Laptops"
    Then I should see the product card "Sony vaio i5"
    When I open the product detail for "Sony vaio i5"
    Then the product detail title should be "Sony vaio i5"
    And the "Add to cart" action should be visible

@smoke @cart
Scenario Outline: User can add a product to cart from product detail
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I open the product detail for "<Product>"
    And I add the current product to the cart
    Then an alert message saying "Product added" is displayed
    When I go to the cart page
    Then the cart should contain the product "<Product>"

Examples:
    | Product           |
    | Samsung galaxy s6 |

@regression @cart
Scenario: User can remove a product from cart
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"
    When I open the product detail for "Nokia lumia 1520"
    And I add the current product to the cart
    Then an alert message saying "Product added" is displayed
    When I go to the cart page
    And I remove the product "Nokia lumia 1520" from the cart
    Then the cart should not contain the product "Nokia lumia 1520"

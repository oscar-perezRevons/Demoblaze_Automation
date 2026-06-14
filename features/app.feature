Feature: Demoblaze Store App
  In order to buy products in the store
  As a customer
  I want to browse products and manage my cart

  Background: Open the Demoblaze home page
    Given I am on the Demoblaze homepage
@smoke @cart
Scenario Outline: User can add a product to cart from product detail
    When  I Click the "<Category>" and select "<Product Name>" on the landing page
    And I Add to the cart 
    And I click the "Cart" link in the navbar
    Then the cart should contain the product "<Product Name>"

Examples:
    | Category |     Product Name    |
    |  Phones  |  Samsung galaxy s6  |
    |  Phones  |  Nokia lumia 1520   |
    |  Phones  |     Nexus 6         |
    |  Laptops |     MacBook air     |
    |  Laptops | 2017 Dell 15.6 Inch |
    | Monitors |     ASUS Full HD    |

@regression @cart
Scenario: User can remove a product from cart
    When I add to my cart the products below 
      | Category | Product Name |
      | Phones   | Samsung galaxy s6 |
      | Laptops  | Dell i7 8gb |
      | Monitors | ASUS Full HD |
    And  I click the "Cart" link in the navbar
    And I remove to my cart the products below 
      | Product Name |
      | ASUS Full HD |
    Then the cart should not contain the products below
      | Product Name |
      | ASUS Full HD |

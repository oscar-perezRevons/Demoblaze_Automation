Feature: Demoblaze Store App
  In order to buy products in the store
  As a customer
  I want to browse products and manage my cart

Scenario: User can browse laptops and open a product detail
    Given I am on the Demoblaze homepage "$urls.home"
    When I filter products by category "$categories.laptops"
    Then I should see the product card "$products.sony_vaio_i5"
    When I open the product detail for "$products.sony_vaio_i5"
    Then the product detail title should be "$products.sony_vaio_i5"
    And the "$actions.add_to_cart" action should be visible

Scenario: User can add a product to cart from product detail
    Given I start with an empty cart
    And I am on the Demoblaze homepage "$urls.home"
    When I open the product detail for "$products.samsung_galaxy_s6"
    And I add the current product to the cart
    Then an alert message saying "$alerts.product_added" is displayed
    When I go to the cart page
    Then the cart should contain the product "$products.samsung_galaxy_s6"

Scenario: User can remove a product from cart
    Given I start with an empty cart
    And I am on the Demoblaze homepage "$urls.home"
    When I open the product detail for "$products.nokia_lumia_1520"
    And I add the current product to the cart
    Then an alert message saying "$alerts.product_added" is displayed
    When I go to the cart page
    And I remove the product "$products.nokia_lumia_1520" from the cart
    Then the cart should not contain the product "$products.nokia_lumia_1520"

Scenario: User can complete checkout from cart
    Given I start with an empty cart
    And I am on the Demoblaze homepage "$urls.home"
    When I open the product detail for "$products.samsung_galaxy_s6"
    And I add the current product to the cart
    Then an alert message saying "$alerts.product_added" is displayed
    When I go to the cart page
    And I place an order with the details below
      | Name        | $orders.qa_name    |
      | Country     | $orders.qa_country |
      | City        | $orders.qa_city    |
      | Credit card | $orders.qa_card    |
      | Month       | $orders.qa_month   |
      | Year        | $orders.qa_year    |
    Then the purchase confirmation should be displayed
    And the purchase confirmation should include "$messages.purchase_success"

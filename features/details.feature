Feature: Product Details Navigation
  As a Customer 
  I want to be see the detail of a different products
  In order to add products to my cart for buy it 

  Background: Open the Demoblaze home page
    Given: I am on the Demoblaze homepage

  Scenario Outline: Navigate to a Product Details for products on the landing page
    When I Click the <product_name> on the landing page
    Then I should see the <product_price> and <product_description>

    examples:
      |    product_name    |   product_price   |   product_description   |
      | Samsung galaxy s6  |        $360       | The Samsung Galaxy S6 is powered by 1.5GHz octa-core Samsung Exynos 7420 processor and it comes with 3GB of RAM. The phone packs 32GB of internal storage cannot be expanded. |
      | Nokia lumia 1520   |        $820       | The Nokia Lumia 1520 is powered by 2.2GHz quad-core Qualcomm Snapdragon 800 processor and it comes with 2GB of RAM. |
      |      Nexus 6       |        $650       | The Motorola Google Nexus 6 is powered by 2.7GHz quad-core Qualcomm Snapdragon 805 processor and it comes with 3GB of RAM. |

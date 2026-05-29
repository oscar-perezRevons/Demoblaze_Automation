Feature: Categorie Filter Navigation
  As a customer
  I want to be able to navigate through the different categories of products
  So that I can easily find the products I am interested in

  Background:
    Given I am on the Demoblaze homepage "https://www.demoblaze.com/index.html"

  @maximize
  Scenario: Navegate to Phones category
    When I click the "Phones" category link in the sidebar
    Then I should see a list of products related to the "Phones" category at the top
      | Product Name       | Price |
      | Samsung galaxy s6  | $360  |
      | Nokia lumia 1520   | $820  |
      | Nexus 6            | $650  |
      | Samsung galaxy s7  | $800  |
      | Iphone 6 32gb      | $790  |
      | Sony xperia z5     | $320  |
      | HTC One M9         | $700  |

  @maximize
  Scenario: Navegate to Laptops category
    When I click the "Laptops" category link in the sidebar
    Then I should see a list of products related to the "Laptops" category at the top
      | Product Name         | Price |
      | Sony vaio i5         | $790  |
      | Sony vaio i7         | $790  |
      | MacBook air          | $700  |
      | Dell i7 8gb          | $700  |
      | 2017 Dell 15.6 Inch  | $700  |
      | MacBook Pro          | $1100 |

  @maximize
  Scenario: Navegate to Monitors category
    When I click the "Monitors" category link in the sidebar
    Then I should see a list of products related to the "Monitors" category at the top
      | Product Name      | Price |
      | Apple monitor 24  | $400  |
      | ASUS Full HD      | $230  |

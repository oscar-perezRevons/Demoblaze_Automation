Feature: Categorie Filter Navigation
  As a customer
  I want to be able to navigate through the different categories of products
  So that I can easily find the products I am interested in

  Background:
    Given I am on the Demoblaze homepage "https://www.demoblaze.com"

  @smoke @maximize
  Scenario: Navegate to Phones category
    When I click the "Phones" category link in the sidebar
    Then I should see a list of products related to the "Phones" category at the top
      | Product Name       | Price |
      | Samsung galaxy s6  | $360  |
      | Nokia lumia 1520   | $820  |

  @regression @maximize
  Scenario: Navegate to Laptops category
    When I click the "Laptops" category link in the sidebar
    Then I should see a list of products related to the "Laptops" category at the top
      | Product Name         | Price |
      | Sony vaio i5         | $790  |
      | MacBook Pro          | $1100 |

  @regression @maximize
  Scenario: Navegate to Monitors category
    When I click the "Monitors" category link in the sidebar
    Then I should see a list of products related to the "Monitors" category at the top
      | Product Name      | Price |
      | Apple monitor 24  | $400  |
      | ASUS Full HD      | $230  |

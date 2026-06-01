Feature: Demoblaze Home Page
  In order to navigate through the store
  As a user
  I want to access the homepage and see the main elements of the page

    Background: Enter to main Demoblaze main page
    Given I am on the Demoblaze homepage "https://www.demoblaze.com"

    @regression @maximize
    Scenario: Access to the homepage and verify main elements
        Then I should see the main categories in the left sidebar
        | Category Name |
        | Phones       |
        | Laptops      |
        | Monitors     |
        And I should see a product list without any category selected
        | Product Name          | Price  |
        | Samsung galaxy s6    | $360   |
        | Nokia lumia 1520    | $820   |
        | Sony vaio i5         | $790   |

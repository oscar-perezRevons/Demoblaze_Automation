Feature: Demoblaze Home Page
  In order to navigate through the store
  As a user
  I want to access the homepage and see the main elements of the page

    Background: Enter to main Demoblaze main page
    Given I am on the Demoblaze homepage "https://www.demoblaze.com"

    @maximize
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
        | Nexus 6             | $650   |
        | Samsung galaxy s7    | $800   |
        | Iphone 6 32gb       | $790   |
        | Sony xperia z5      | $320   |
        | HTC One M9          | $700   |
        | Sony vaio i5         | $790   |
        | Sony vaio i7         | $790  |
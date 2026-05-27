Feature: Categorie Filter Navigation

    As a customer
    I want to be able to navigate through the different categories of products
    So that I can easily find the products I am interested in

    Background:
        Given I am on the Demoblaze homepage "https://www.demoblaze.com"
    
    @maximize
    Scenario: Navegate to Phones category
        When I click the "Phones" category link in the sidebar
        Then I should see a list of products related to the "Phones" category at the top
        | Product Name          | Price  |
        | Samsung Galaxy S6    | $360   |
        | Nokia Lumia 1520    | $820   |
        | Nexus 6             | $650   |
        | Samsung Galaxy S7    | $800   |
        | iPhone 6 32gb       | $790   |
        | Sony xperia z5      | $320   |
        | HTC One M9          | $700   |

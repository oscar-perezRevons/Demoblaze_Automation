Feature: Product Details Navigation
  As a Customer 
  I want to be see the detail of a different products
  In order to add products to my cart for buy it 

  Background: Open the Demoblaze home page
    Given I am on the Demoblaze homepage
  
  @smoke
  Scenario Outline: Navigate to a Product Details for products on the landing page
    When I Click the "<Category>" and select "<Product Name>" on the landing page
    Then I should see the "<Product Name>", "<Price>" and "<Description>"
    
    Examples:
    | Category |     Product Name    |        Price      |   Description   |
    |  Phones  |  Samsung galaxy s6  |        $360       | The Samsung Galaxy S6 is powered by 1.5GHz octa-core Samsung Exynos 7420 processor and it comes with 3GB of RAM. The phone packs 32GB of internal storage cannot be expanded. |
    |  Phones  |  Nokia lumia 1520   |        $820       | The Nokia Lumia 1520 is powered by 2.2GHz quad-core Qualcomm Snapdragon 800 processor and it comes with 2GB of RAM. |
    |  Phones  |     Nexus 6         |        $650       | The Motorola Google Nexus 6 is powered by 2.7GHz quad-core Qualcomm Snapdragon 805 processor and it comes with 3GB of RAM. |
    |  Laptops |     MacBook air     |        $700       | 1.6GHz dual-core Intel Core i5 (Turbo Boost up to 2.7GHz) with 3MB shared L3 cache Configurable to 2.2GHz dual-core Intel Core i7 (Turbo Boost up to 3.2GHz) with 4MB shared L3 cache. |
    |  Laptops | 2017 Dell 15.6 Inch |        $700       | 7th Gen Intel Core i7-7500U mobile processor 2.70 GHz with Turbo Boost Technology up to 3.50 GHz, Intel HD Graphics 62015.6 inch Full HD IPS TrueLife LED-backlit touchscreen (1920 x 1080), 10-finger multi-touch support, 360° flip-and-fold design,8GB DDR4 2400 MHz Memory, 1TB 5400 RPM HDD, No optical drive, 3 in 1 card reader (SD SDHC SDXC) |
    | Monitors |     ASUS Full HD    |        $230       | ASUS VS247H-P 23.6- Inch Full HD |

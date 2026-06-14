module Constants
  APP_URL = ENV.fetch('LANDING_PAGE_URL').freeze
  AUTO_USER_TOKEN = 'AUTO_USER'.freeze
  AUTO_PASS_TOKEN = 'AUTO_PASS'.freeze

  NAVBAR_LINK_SELECTORS = {
    'Home' => '#navbarExample a[href="index.html"]',
    'Contact' => '#navbarExample a[data-target="#exampleModal"]',
    'About us' => '#navbarExample a[data-target="#videoModal"]',
    'Cart' => '#cartur',
    'Log in' => '#login2',
    'Sign up' => '#signin2',
    'Log out' => '#logout2'
  }.freeze

  CATEGORY_LINK_SELECTORS = {
    'Phones' => "//a[@id='itemc' and normalize-space()='Phones']",
    'Laptops' => "//a[@id='itemc' and normalize-space()='Laptops']",
    'Monitors' => "//a[@id='itemc' and normalize-space()='Monitors']"
  }.freeze

  BUTTON_SELECTORS = {
    'Place Order' => 'button[data-target="#orderModal"]',
    'Add to cart' => 'a.btn.btn-success.btn-lg',
    'Send message' => '#exampleModal button.btn.btn-primary',
    'Next' => '#next2',
    'Previous' => '#prev2'
  }.freeze

  CONTACT_FORM_SELECTORS = {
    'Email' => '#recipient-email',
    'Name' => '#recipient-name',
    'Message' => '#message-text'
  }.freeze

  HOME_PRODUCTS = {
    'Samsung galaxy s6' => 'div.col-md-6:nth-child(1)',
    'Nokia lumia 1520' => 'div.col-lg-4:nth-child(2)',
    'Nexus 6' => 'div.col-md-6:nth-child(3)',
    'Samsung galaxy s7' => 'div.col-md-6:nth-child(4)',
    'Iphone 6 32gb' => 'div.col-md-6:nth-child(5)',
    'Sony xperia z5' => 'div.col-md-6:nth-child(6)',
    'HTC One M9' => 'div.col-md-6:nth-child(7)',
    'Sony vaio i5' => 'div.col-md-6:nth-child(8)',
    'Sony vaio i7' => 'div.col-md-6:nth-child(9)'
  }.freeze
end

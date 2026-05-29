module UiMaps
  NAVBAR_LINK_SELECTORS = {
    'Home' => 'li.nav-item:nth-child(1) > a:nth-child(1)',
    'Contact' => 'li.nav-item:nth-child(2) > a:nth-child(1)',
    'About us' => 'li.nav-item:nth-child(3) > a:nth-child(1)',
    'Cart' => 'li.nav-item:nth-child(4) > a:nth-child(1)',
    'Log in' => 'li.nav-item:nth-child(5) > a:nth-child(1)',
    'Sign up' => 'li.nav-item:nth-child(6) > a:nth-child(1)'
  }.freeze

  CATEGORY_LINK_SELECTORS = {
    'Phones' => 'a.list-group-item:nth-child(2)',
    'Laptops' => 'a.list-group-item:nth-child(3)',
    'Monitors' => 'a.list-group-item:nth-child(4)'
  }.freeze

  BUTTON_SELECTORS = {
    'Place Order' => 'button.btn:nth-child(3)',
    'Add to cart' => 'a.btn',
    'Send message' => '#exampleModal > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(2)',
    'Next' => '#next2',
    'Previous' => '#prev2'
  }.freeze

  CONTACT_FORM_SELECTORS = {
    'Email' => '#recipient-email',
    'Name' => '#recipient-name',
    'Message' => '#message-text'
  }.freeze

  HOME_PRODUCTS = {
    'Samsung galaxy s6' => 'div.col-md-6:nth-child(1) ',
    'Nokia lumia 1520' => 'div.col-lg-4:nth-child(2) ',
    'Nexus 6' => 'div.col-md-6:nth-child(3) ',
    'Samsung galaxy s7' => 'div.col-md-6:nth-child(4) ',
    'Iphone 6 32gb' => 'div.col-md-6:nth-child(5) ',
    'Sony xperia z5' => 'div.col-md-6:nth-child(6) ',
    'HTC One M9' => 'div.col-md-6:nth-child(7) ',
    'Sony vaio i5' => 'div.col-md-6:nth-child(8) ',
    'Sony vaio i7' => 'div.col-md-6:nth-child(9) '
  }.freeze
end

def navbar_link_selector(link_text)
  UiMaps::NAVBAR_LINK_SELECTORS.fetch(link_text) do
    raise "Unknown navbar link selector for '#{link_text}'"
  end
end

def category_link_selector(category_name)
  UiMaps::CATEGORY_LINK_SELECTORS.fetch(category_name) do
    raise "Unknown category selector for '#{category_name}'"
  end
end

def button_selector(button_text)
  UiMaps::BUTTON_SELECTORS.fetch(button_text) do
    raise "Unknown button selector for '#{button_text}'"
  end
end

def contact_form_selector(field_name)
  UiMaps::CONTACT_FORM_SELECTORS.fetch(field_name) do
    raise "Unknown contact form selector for '#{field_name}'"
  end
end

def home_product_name_selector(product_name)
  base_selector = UiMaps::HOME_PRODUCTS.fetch(product_name) do
    raise "Unknown home product selector for '#{product_name}'"
  end

  "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
end

def home_product_price_selector(product_name)
  base_selector = UiMaps::HOME_PRODUCTS.fetch(product_name) do
    raise "Unknown home product selector for '#{product_name}'"
  end

  "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)"
end

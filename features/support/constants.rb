module Constants
  APP_URL = ENV['DEFAULT_HOME_PAGE'].freeze
  AUTO_USER_TOKEN = 'AUTO_USER'.freeze
  AUTO_PASS_TOKEN = 'AUTO_PASS'.freeze
  
  FIRST_NAMES = %w[maria carlos ana luis sofia diego paula marco laura andres].freeze

  LAST_NAMES = %w[rios perez lopez vargas castro mendoza herrera flores torres guzman].freeze
 
  ACCEPTED_SIGN_UP_MESSAGES = ['Sign up successful', 'This user already exist'].freeze

  NAVBAR_LINK_SELECTORS = {
    'Home' => '#navbarExample a[href="index.html"]',
    'Contact' => '#navbarExample a[data-target="#exampleModal"]',
    'About us' => '#navbarExample a[data-target="#videoModal"]',
    'Cart' => '#cartur',
    'Log in' => '#login2',
    'Sign up' => '#signin2',
    'Log out' => '#logout2',
    'Profile' => '#nameofuser'
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
    'Previous' => '#prev2',
    'Log in' => '#logInModal > div > div > div.modal-footer > button.btn.btn-primary',
    'Sign up' => '#signInModal > div > div > div.modal-footer > button.btn.btn-primary'
  }.freeze

  CONTACT_FORM_SELECTORS = {
    'Email' => '#recipient-email',
    'Name' => '#recipient-name',
    'Message' => '#message-text'
  }.freeze

  LOGIN_FORM_SELECTOR={
    'Username' => '#loginusername',
    'Password' => '#loginpassword',
    'WelcomeMessage' => '#nameofuser'
  }.freeze

  SIGN_UP_FORM_SELECTOR={
    'Username' => '#sign-username',
    'Password' => '#sign-password'
  }

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
  CATEGORY_PRODUCTS_LINK_SELECTOR = {
    'Phones' => {
      'Samsung galaxy s6' => '#tbodyid > div:nth-child(1) > div > div',
      'Nokia lumia 1520' => '#tbodyid > div:nth-child(2) > div > div',
      'Nexus 6' => '#tbodyid > div:nth-child(3) > div > div',
      'Samsung galaxy s7' => '#tbodyid > div:nth-child(4) > div > div',
      'Iphone 6 32gb' => '#tbodyid > div:nth-child(5) > div > div',
      'Sony xperia z5' => '#tbodyid > div:nth-child(6) > div > div',
      'HTC One M9' => '#tbodyid > div:nth-child(7) > div > div'
    },
    'Laptops' => {
      'Sony vaio i5' => '#tbodyid > div:nth-child(1) > div > div',
      'Sony vaio i7' => '#tbodyid > div:nth-child(2) > div > div',
      'MacBook air' => '#tbodyid > div:nth-child(3) > div > div',
      'Dell i7 8gb' => '#tbodyid > div:nth-child(4) > div > div',
      '2017 Dell 15.6 Inch' => '#tbodyid > div:nth-child(5) > div > div',
      'MacBook Pro' => '#tbodyid > div:nth-child(6) > div > div'
    },
    'Monitors' =>{
      'Apple monitor 24' => '#tbodyid > div:nth-child(1) > div > div',
      'ASUS Full HD' => '#tbodyid > div:nth-child(2) > div > div'
    }
  }
DETAIL_PRODUCT_STRUCTURE = {
    'Name' => '#tbodyid > h2',
    "Price" => '#tbodyid > h3',
    "Description" => '#more-information > p'
  }
end

module ProductField
  Price = 0
  Name = 1
end
def detail_structure_selector(field_name)
  Constants::DETAIL_PRODUCT_STRUCTURE.fetch(field_name) do
    raise "Unknown selector for that field #{field_name}"
  end
end
def category_product_selector(category_name,product_name,type)
  base_selector = Constants::CATEGORY_PRODUCTS_LINK_SELECTOR.fetch(category_name).fetch(product_name) do
    raise "Unknown selector for catrgory or product"
  end
  case type
  when ProductField::Price
    base_selector = "#{base_selector} > h5"
  when ProductField::Name
    base_selector = "#{base_selector} > h4 > a"
  else
    raise "Invalid Type selected"
  end
end

def navbar_link_selector(link_text)
  Constants::NAVBAR_LINK_SELECTORS.fetch(link_text) do
    raise "Unknown navbar link selector for '#{link_text}'"
  end
end

def category_link_selector(category_name)
  Constants::CATEGORY_LINK_SELECTORS.fetch(category_name) do
    raise "Unknown category selector for '#{category_name}'"
  end
end

def button_selector(button_text)
  Constants::BUTTON_SELECTORS.fetch(button_text) do
    raise "Unknown button selector for '#{button_text}'"
  end
end

def contact_form_selector(field_name)
  Constants::CONTACT_FORM_SELECTORS.fetch(field_name) do
    raise "Unknown contact form selector for '#{field_name}'"
  end
end

def login_form_selector(field_name)
  Constants::LOGIN_FORM_SELECTOR.fetch(field_name) do
    raise "Unknown Login form selector for '#{field_name}'"
  end
end

def sign_up_form_selector(field_name)
  Constants::SIGN_UP_FORM_SELECTOR.fetch(field_name) do
    raise "Unknown Sign Up form selector for '#{field_name}'"
  end
end

def home_product_name_selector(product_name)
  base_selector = Constants::HOME_PRODUCTS.fetch(product_name) do
    raise "Unknown home product selector for '#{product_name}'"
  end

  "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
end

def home_product_price_selector(product_name)
  base_selector = Constants::HOME_PRODUCTS.fetch(product_name) do
    raise "Unknown home product selector for '#{product_name}'"
  end

  "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)"
end


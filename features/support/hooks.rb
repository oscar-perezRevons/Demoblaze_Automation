
After do 
  Capybara.current_session.driver.quit
end

Before '@maximize' do
  @navbar_links_css_selector = {
    "Home" => 'li.nav-item:nth-child(1) > a:nth-child(1)',
    "Contact" => 'li.nav-item:nth-child(2) > a:nth-child(1)',
    "About us" => 'li.nav-item:nth-child(3) > a:nth-child(1)',
    "Cart" => 'li.nav-item:nth-child(4) > a:nth-child(1)',
    "Log in" => 'li.nav-item:nth-child(5) > a:nth-child(1)',
    "Sign up" => 'li.nav-item:nth-child(6) > a:nth-child(1)'
  }
  @categories_link_css_selector = {
    "Phones" => "a.list-group-item:nth-child(2)",
    "Laptops" => "a.list-group-item:nth-child(3)",
    "Monitors" => "a.list-group-item:nth-child(4)"
  }
  @button_css_selector = {
    "Place Order" => 'button.btn:nth-child(3)',
    "Add to cart" => "a.btn",
    "Send message" => '#exampleModal > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(2)',
    "Next" => '#next2',
    "Previous" => '#prev2',
  }
  page.driver.browser.manage.window.maximize
end
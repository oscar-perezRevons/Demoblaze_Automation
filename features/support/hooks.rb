After do
  Capybara.reset_sessions!
  Capybara.use_default_driver
end

Before '@cart' do
  home_page.load
  cart_page.open
  cart_page.clear
end

Before '@maximize' do
  base_page.maximize_window
end

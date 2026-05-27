
After do
  Capybara.reset_sessions!
  Capybara.use_default_driver
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

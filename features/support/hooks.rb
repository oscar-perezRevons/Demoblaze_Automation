After do
  Capybara.reset_sessions!
  Capybara.use_default_driver
end

Before '@cart' do
  visit 'https://www.demoblaze.com/index.html'
  click_link('Cart')
  expect(page).to have_text('Products', wait: Capybara.default_max_wait_time)

  loop do
    delete_link = first('#tbodyid a', text: 'Delete', minimum: 0, wait: 1)
    break unless delete_link

    delete_link.click
  end
end

Before '@maximize' do
  page.driver.browser.manage.window.maximize
end

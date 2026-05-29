When('I click on the product {string}') do |product_name|
  click_link(product_name)
end

When('I fill out the order form with the following details') do |table|
  data = table.rows_hash
  fill_in 'name', with: data['Name']
  fill_in 'country', with: data['Country']
  fill_in 'city', with: data['City']
  fill_in 'card', with: data['Card']
  fill_in 'month', with: data['Month']
  fill_in 'year', with: data['Year']
end

When('I click the {string} button in the checkout modal') do |button_text|
  find('button', text: button_text, wait: Capybara.default_max_wait_time).click
end

Then('a confirmation message {string} should be displayed') do |expected_message|
  expect(page).to have_css('.sweet-alert.visible h2', text: expected_message, wait: Capybara.default_max_wait_time)
  find('.sweet-alert.visible button.confirm', wait: Capybara.default_max_wait_time).click
end
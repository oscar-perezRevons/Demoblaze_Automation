When('I click on the product {string}') do |product_name|
  click_link(product_name)
end

When('I click the {string} button.') do |button_text|
  click_link_or_button(button_text) 
end

When('I fill out the order form with the following details') do |table|
  data = table.rows_hash 
  fill_in 'name',    with: data['Name']
  fill_in 'country', with: data['Country']
  fill_in 'city',    with: data['City']
  fill_in 'card',    with: data['Card']
  fill_in 'month',   with: data['Month']
  fill_in 'year',    with: data['Year']
end

When('I click the {string} button in the checkout modal') do |button_text|
  find('button', text: button_text).click
  sleep 2 
end

Then('a confirmation message {string} should be displayed') do |expected_message|
  expect(page).to have_css('h2', text: expected_message, wait: 5)
  sleep 1
  find('button', text: 'OK').click
end
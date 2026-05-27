When('I filter products by category {string}') do |category_name|
  find('#itemc', text: resolve_dynamic_value(category_name), wait: Capybara.default_max_wait_time).click
end

Then('I should see the product card {string}') do |product_name|
  expect(page).to have_css('a.hrefch', text: resolve_dynamic_value(product_name), wait: Capybara.default_max_wait_time)
end

When('I open the product detail for {string}') do |product_name|
  find('a.hrefch', text: resolve_dynamic_value(product_name), wait: Capybara.default_max_wait_time).click
end

Then('the product detail title should be {string}') do |expected_title|
  expect(page).to have_css('.name', text: resolve_dynamic_value(expected_title), wait: Capybara.default_max_wait_time)
end

Then('the {string} action should be visible') do |action_text|
  expect(page).to have_link(resolve_dynamic_value(action_text), wait: Capybara.default_max_wait_time)
end

When('I add the current product to the cart') do
  click_link(resolve_dynamic_value('$actions.add_to_cart'))
end

When('I go to the cart page') do
  click_link(resolve_dynamic_value('$links.cart'))
  expect(page).to have_text(resolve_dynamic_value('$labels.products'), wait: Capybara.default_max_wait_time)
end

Given('I start with an empty cart') do
  visit resolve_dynamic_value('$urls.home')
  click_link(resolve_dynamic_value('$links.cart'))
  expect(page).to have_text(resolve_dynamic_value('$labels.products'), wait: Capybara.default_max_wait_time)

  loop do
    delete_link = first('#tbodyid a', text: 'Delete', minimum: 0, wait: 1)
    break unless delete_link

    delete_link.click
  end
end

Then('the cart should contain the product {string}') do |product_name|
  expect(page).to have_css('#tbodyid tr', text: resolve_dynamic_value(product_name), wait: Capybara.default_max_wait_time)
end

When('I remove the product {string} from the cart') do |product_name|
  row = find('#tbodyid tr', text: resolve_dynamic_value(product_name), wait: Capybara.default_max_wait_time)

  within(row) do
    click_link('Delete')
  end
end

Then('the cart should not contain the product {string}') do |product_name|
  expect(page).to have_no_css('#tbodyid tr', text: resolve_dynamic_value(product_name), wait: Capybara.default_max_wait_time)
end

When('I place an order with the details below') do |table|
  data = table.rows_hash
  find('button', text: resolve_dynamic_value('$buttons.place_order'), wait: Capybara.default_max_wait_time).click

  within('#orderModal') do
    fill_in 'name', with: resolve_dynamic_value(data['Name'])
    fill_in 'country', with: resolve_dynamic_value(data['Country'])
    fill_in 'city', with: resolve_dynamic_value(data['City'])
    fill_in 'card', with: resolve_dynamic_value(data['Credit card'])
    fill_in 'month', with: resolve_dynamic_value(data['Month'])
    fill_in 'year', with: resolve_dynamic_value(data['Year'])
    find('button', text: resolve_dynamic_value('$buttons.purchase')).click
  end
end

Then('the purchase confirmation should be displayed') do
  expect(page).to have_css('.sweet-alert.visible', wait: Capybara.default_max_wait_time)
end

Then('the purchase confirmation should include {string}') do |expected_text|
  expect(page).to have_css('.sweet-alert.visible h2', text: resolve_dynamic_value(expected_text), wait: Capybara.default_max_wait_time)
  find('.sweet-alert.visible button.confirm').click
end

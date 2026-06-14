When('I filter products by category {string}') do |category_name|
  home_page.click_category(category_name)
end

Then('I should see the product card {string}') do |product_name|
  expect(home_page).to have_product_card(product_name)
end

When('I open the product detail for {string}') do |product_name|
  home_page.open_product_detail(product_name)
end

Then('the product detail title should be {string}') do |expected_title|
  expect(product_page).to have_product_title(expected_title)
end

Then('the {string} action should be visible') do |action_text|
  expect(product_page).to have_action(action_text)
end

When('I add the current product to the cart') do
  product_page.add_to_cart
end

When('I go to the cart page') do
  cart_page.open
end

Then('the cart should contain the product {string}') do |product_name|
  expect(cart_page).to have_product(product_name)
end

When('I remove the product {string} from the cart') do |product_name|
  cart_page.remove_product(product_name)
end

Then('the cart should not contain the product {string}') do |product_name|
  expect(cart_page).to have_no_product(product_name)
end

When('I place an order with the details below') do |table|
  checkout_page.place_order(table.rows_hash)
end

Then('the purchase confirmation should be displayed') do
  expect(checkout_page).to have_confirmation
end

Then('the purchase confirmation should include {string}') do |expected_text|
  expect(checkout_page).to have_confirmation_text(expected_text)
  checkout_page.accept_confirmation
end

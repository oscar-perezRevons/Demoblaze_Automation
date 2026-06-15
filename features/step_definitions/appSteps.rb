Before do
  @purchase_page = PurchasePage.new
  @details_page = DetailsPage.new
end

Then('the cart should contain the product {string}') do |product_name|
  expect(@purchase_page.product_in_the_cart?(product_name)).to be_truthy
end
When('I Add to the cart') do
  @details_page.agregar_al_carrito
end

When('I remove to my cart the products below') do |table|
  products = table.hashes
  products.all? do |product|
    product_name = product['Product Name']
    @purchase_page.remove_product_to_the_cart(product_name)
  end
end

Then('the cart should not contain the products below') do |table|
  products = table.hashes
  products.all? do |product|
    product_name = product['Product Name']
    expect(page).to have_no_css('#tbodyid tr', text: product_name, wait: Capybara.default_max_wait_time)
  end 
end



Then('the purchase confirmation should be displayed') do
  expect(page).to have_css('.sweet-alert.visible', wait: Capybara.default_max_wait_time)
end

Then('the purchase confirmation should include {string}') do |expected_text|
  expect(page).to have_css('.sweet-alert.visible h2', text: expected_text, wait: Capybara.default_max_wait_time)
  find('.sweet-alert.visible button.confirm').click
end

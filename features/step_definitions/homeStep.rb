Then('I should see the main categories in the left sidebar') do |table|
  table.hashes.each do |row|
    category_name = row['Category Name']
    expect(find(category_link_selector(category_name), text: category_name, wait: Capybara.default_max_wait_time)).to be_visible
  end
end

Then('I should see a product list without any category selected') do |table|
  table.hashes.each do |row|
    product_name = row['Product Name']
    expected_price = row['Price']

    expect(find(home_product_name_selector(product_name), wait: Capybara.default_max_wait_time)).to have_text(product_name)
    expect(find(home_product_price_selector(product_name), wait: Capybara.default_max_wait_time)).to have_text(expected_price)
  end
end

Then('I should see the pagination controls at the bottom of the product list') do
  expect(page).to have_css(button_selector('Previous'), wait: Capybara.default_max_wait_time)
end
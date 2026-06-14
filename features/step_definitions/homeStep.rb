Then('I should see the main categories in the left sidebar') do |table|
  table.hashes.each do |row|
    category_name = row['Category Name']
    expect(home_page).to have_category(category_name)
  end
end

Then('I should see a product list without any category selected') do |table|
  table.hashes.each do |row|
    product_name = row['Product Name']
    expected_price = row['Price']

    expect(home_page).to have_default_product(product_name, expected_price)
  end
end

Then('I should see the pagination controls at the bottom of the product list') do
  expect(home_page).to have_pagination_controls
end

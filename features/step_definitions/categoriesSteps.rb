When('I click the {string} category link in the sidebar') do |category_name|
  home_page.click_category(category_name)
end

Then('I should see a list of products related to the {string} category at the top') do |_category_name, table|
  table.hashes.each do |row|
    product_name = row['Product Name']
    expected_price = row['Price']

    expect(home_page).to have_category_product(product_name, expected_price)
  end
end

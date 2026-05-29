When('I click the {string} category link in the sidebar') do |category_name|
  selector = @categories_link_css_selector && @categories_link_css_selector[category_name]
  raise "Unknown category selector for '#{category_name}'" unless selector

  find(selector, wait: Capybara.default_max_wait_time).click
end

Then('I should see a list of products related to the {string} category at the top') do |_category_name, table|
  table.hashes.each do |row|
    product_name = row['Product Name']
    expected_price = row['Price']

    card_xpath = "//div[contains(@class,'card h-100')][.//h4[contains(@class,'card-title')]/a[normalize-space()='#{product_name}'] and .//h5[normalize-space()='#{expected_price}']]"
    expect(page).to have_xpath(card_xpath, wait: Capybara.default_max_wait_time)
  end
end
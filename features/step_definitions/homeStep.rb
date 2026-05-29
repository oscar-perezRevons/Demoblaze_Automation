Before do
    @products_main = {
      "Samsung galaxy s6" => "div.col-md-6:nth-child(1) ",
      "Nokia lumia 1520" => "div.col-lg-4:nth-child(2) ",
      "Nexus 6" => "div.col-md-6:nth-child(3) ",
      "Samsung galaxy s7" => "div.col-md-6:nth-child(4) ",
      "Iphone 6 32gb" => "div.col-md-6:nth-child(5) ",
      "Sony xperia z5" => "div.col-md-6:nth-child(6) ",
      "HTC One M9" => "div.col-md-6:nth-child(7) ",
      "Sony vaio i5" => "div.col-md-6:nth-child(8) ",
      "Sony vaio i7" => "div.col-md-6:nth-child(9) ",
      # "Apple monitor 24" => "div.col-md-6:nth-child(1) ",
      # "MacBook air" => "div.col-lg-4:nth-child(2) ",
      # "Dell i7 8gb" => "div.col-md-6:nth-child(3) ",
      # "2017 Dell 15.6 Inch" => "div.col-lg-4:nth-child(4) ",
      # "ASUS Full HD" => "div.col-lg-4:nth-child(5)",
      # "MacBook Pro" => "div.col-lg-4:nth-child(6) "
    }
    @products_name_css_selector = @products_main.transform_values do |base_selector|
        "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
    end
    @products_price_css_selector = @products_main.transform_values do |base_selector|
        "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)"
    end
end

Then('I should see the main categories in the left sidebar') do |table|
    table.hashes.each do |row|
        category_name = row['Category Name']
        expect(find(@categories_link_css_selector[category_name], text: category_name)).to be_visible
    end
end

Then('I should see a product list without any category selected') do |table|
    table.hashes.each do |row|
        product_name = row['Product Name']
        expected_price = row['Price']
        puts "Verifying product: #{product_name} with expected price: #{expected_price}"
        expect(find(@products_name_css_selector[product_name])).to be_visible
        expect(find(@products_name_css_selector[product_name])).to have_text(product_name)
        expect(find(@products_price_css_selector[product_name])).to be_visible
        expect(find(@products_price_css_selector[product_name])).to have_text(expected_price)
    end
end

Then('I should see the pagination controls at the bottom of the product list') do
  sleep 5
  expect(find(@button_css_selector["Previous"])).to be_visible
end

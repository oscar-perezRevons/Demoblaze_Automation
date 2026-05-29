Before do  
    @products_identifiers = {
        "Phones" => {
            "Samsung galaxy s6" => "div.col-md-6:nth-child(1) ",
            "Nokia lumia 1520" => "div.col-lg-4:nth-child(2) ",
            "Nexus 6" => "div.col-md-6:nth-child(3) ",
            "Samsung galaxy s7" => "div.col-md-6:nth-child(4) ",
            "Iphone 6 32gb" => "div.col-md-6:nth-child(5) ",
            "Sony xperia z5" => "div.col-md-6:nth-child(6) ",
            "HTC One M9" => "div.col-md-6:nth-child(7) ", 
        },
        "Laptops" => {
            "Sony vaio i5" => "div.col-md-6:nth-child(8) ",
            "Sony vaio i7" => "div.col-md-6:nth-child(9) ",
            "MacBook air" => "div.col-md-6:nth-child(3) ",
            "Dell i7 8gb" => "div.col-lg-4:nth-child(4) ",
            "2017 Dell 15.6 Inch" => "div.col-lg-4:nth-child(5) ",
            "MacBook Pro" => "div.col-lg-4:nth-child(6) ",
        },
        "Monitors" => {
            "Apple monitor 24" => "div.col-md-6:nth-child(1) ",
            "ASUS Full HD" => "div.col-lg-4:nth-child(2)"
        } 
    }
    @categories_link_css_selector = {
        "Phones" => "a.list-group-item:nth-child(2)",
        "Laptops" => "a.list-group-item:nth-child(3)",
        "Monitors" => "a.list-group-item:nth-child(4)"
    }
    @products_name_css_selector = @products_identifiers.transform_values do |productos|
        productos.transform_values do |base_selector|
            "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
        end
    end
    @products_price_css_selector = @products_identifiers.transform_values do |productos|
        productos.transform_values do |base_selector|
            "#{base_selector} > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)"
        end
    end
end


When('I click the {string} category link in the sidebar') do |category_name|
    find(@categories_link_css_selector[category_name]).click
end

Then('I should see a list of products related to the {string} category at the top') do |category_name, table|
    table.hashes.each do |row|
    product_name = row['Product Name']
    expected_price = row['Price']
    puts "Verifying product: #{product_name} with expected price: #{expected_price}"
    expect(find(@products_name_css_selector[category_name][product_name])).to be_visible
    expect(find(@products_name_css_selector[category_name][product_name])).to have_text(product_name)
    expect(find(@products_price_css_selector[category_name][product_name])).to be_visible
    expect(find(@products_price_css_selector[category_name][product_name])).to have_text(expected_price)
  end
end

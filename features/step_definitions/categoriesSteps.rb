Before do 
    @categoriesCssSelector = {
        "Phones" => "a.list-group-item:nth-child(2)",
        "Laptops" => "a.list-group-item:nth-child(3)",
        "Monitors" => "a.list-group-item:nth-child(4)"
    }
    @productsNameCssSelector = {
        "Samsung galaxy s6" => "div.col-md-6:nth-child(1) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "Nokia lumia 1520" => "div.col-lg-4:nth-child(2) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "Nexus 6" => "div.col-md-6:nth-child(3) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "Samsung galaxy s7" => "div.col-md-6:nth-child(4) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "iPhone 6 32gb" => "div.col-md-6:nth-child(5) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "Sony xperia z5" => "div.col-md-6:nth-child(6) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)",
        "HTC One M9" => "div.col-md-6:nth-child(7) > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
    }
    @productsPriceCssSelector = {
        "Samsung galaxy s6" => "div.col-md-6:nth-child(1) > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)",
        "Nokia lumia 1520" => "div.col-md-6:nth-child(2) > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)",
        
    }
end

Given('I click the {string} category link in the sidebar') do |category_name|
    find(@categoriesCssSelector[category_name]).click
end

When()
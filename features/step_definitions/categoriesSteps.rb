Before do 
  @home_page = HomePage.new
end

When('I click the {string} category link in the sidebar') do |category_name|
  @home_page.ir_a_categoria(category_name)
end

Then('I should see a list of products related to the {string} category at the top') do |_category_name, table|
  list_of_products = table.hashes
  expect(@home_page.nombres_de_productos_de_categorias_cargados?(list_of_products,_category_name)).to be_truthy
  expect(@home_page.precios_de_productos_de_categorias_cargados?(list_of_products,_category_name)).to be_truthy
  expect(@home_page.nombres_de_productos_de_categorias_correctos?(list_of_products,_category_name)).to be_truthy
  expect(@home_page.precios_de_productos_de_categorias_correctos?(list_of_products,_category_name)).to be_truthy
end

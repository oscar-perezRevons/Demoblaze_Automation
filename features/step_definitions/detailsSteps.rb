Before do
  @home_page = HomePage.new
  @detail_page = DetailsPage.new
end

When('I Click the {string} and select {string} on the landing page') do |category_name,product_name|
  @home_page.cargar_pagina()
  @home_page.ir_a_categoria(category_name)
  expect(page).to have_text(product_name, wait:Capybara.default_max_wait_time)
  @home_page.ir_al_producto(category_name,product_name)
end

Then('I should see the {string}, {string} and {string}') do |product_name,price,description|
  product = {
    'Product Name' => product_name,
    'Price' => price,
    'Description' => description
  }
  expect(@detail_page.informacion_del_producto_cargada?).to be_truthy
  expect(@detail_page.informacion_del_producto_correcta?(product)).to be_truthy
end

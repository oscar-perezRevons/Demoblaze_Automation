Before do
  @home_page = HomePage.new
  @details_page = DetailsPage.new
  @purchase_page = PurchasePage.new
end

When('I add to my cart the products below') do |table|
  products = table.hashes
  products.all? do |product|
    product_name = product['Product Name']
    category_name = product['Category']
    @home_page.cargar_pagina()
    @home_page.ir_a_categoria(category_name)
    expect(page).to have_text(product_name,wait:Capybara.default_max_wait_time)
    @home_page.ir_al_producto(category_name,product_name)
    @details_page.agregar_al_carrito()
  end
end

When('I place an order with the details below') do |table|
  order_info = table.rows_hash
  @purchase_page.place_order()
  @purchase_page.fill_place_order_form(order_info)
  @purchase_page.purchase_order()
end

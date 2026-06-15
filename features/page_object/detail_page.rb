class DetailsPage
  include Capybara::DSL
  def informacion_del_producto_cargada?()
    find(detail_structure_selector('Name'),wait:Capybara.default_max_wait_time).visible?
    find(detail_structure_selector('Price'),wait:Capybara.default_max_wait_time).visible?
    find(detail_structure_selector('Description'),wait:Capybara.default_max_wait_time).visible?
  end
  def informacion_del_producto_correcta?(product)
    find(detail_structure_selector('Name'),wait:Capybara.default_max_wait_time).has_text?(product['Product Name'])
    find(detail_structure_selector('Price'),wait:Capybara.default_max_wait_time).has_text?(product['Price'])
    find(detail_structure_selector('Description'),wait:Capybara.default_max_wait_time).has_text?(product['Description'])
  end
  def agregar_al_carrito()
    accept_alert do
      find(button_selector('Add to cart')).click 
    end
  end
end

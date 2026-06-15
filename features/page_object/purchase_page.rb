class PurchasePage
  include Capybara::DSL
  def fill_place_order_form(order_info)
    find(place_order_form_selector('Name')).set(order_info['Name'])
    find(place_order_form_selector('Country')).set(order_info['Country'])
    find(place_order_form_selector('City')).set(order_info['City'])
    find(place_order_form_selector('Credit card')).set(order_info['Credit card'])
    find(place_order_form_selector('Month')).set(order_info['Month'])
    find(place_order_form_selector('Year')).set(order_info['Year'])
  end
  def place_order()
    find(button_selector('Place Order')).click
  end
  def purchase_order()
    find(button_selector('Purchase')).click
  end
  def product_in_the_cart?(product_name)
    find(product_in_the_cart,text: product_name,wait: Capybara.default_max_wait_time).visible?
    find(product_in_the_cart,text: product_name,wait: Capybara.default_max_wait_time).has_text?(product_name)
  end
  def remove_product_to_the_cart(product_name)
    row = find(product_in_the_cart,text: product_name,wait: Capybara.default_max_wait_time)
    within(row)do
      row.find('a', text:'Delete',wait:Capybara.default_max_wait_time).click
    end
  end
end

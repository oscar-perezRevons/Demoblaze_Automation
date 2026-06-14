class HomePage
  include Capybara::DSL
  def cargar_pagina
    visit('/')
  end 
  def ir_a_login
    find(navbar_link_selector('Log in')).click()
  end
  def ir_a_categoria(category_name)
    find(:xpath,category_link_selector(category_name),wait:Capybara.default_max_wait_time).click()
  end
  def ir_a_producto(product_name)
    find(home_product_name_selector(product_name),wait:Capybara.default_max_wait_time).click()
  end
  def categorias_correctas_visibles?(list_of_categories)
    list_of_categories.all? do |row|
      category_name = row['Category Name']
      find(:xpath, category_link_selector(category_name),wait: Capybara.default_max_wait_time).has_text?(category_name)
    end
  end
  def categorias_cargadas?(list_of_categories)
    list_of_categories.all? do |row|
      category_name = row['Category Name']
      find(:xpath, category_link_selector(category_name),wait: Capybara.default_max_wait_time).visible?
    end
  end
  def precios_de_productos_cargados?(list_of_products)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      find(home_product_price_selector(product_name)).visible?
    end
  end
  def nombres_de_productos_cargados?(list_of_products)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      find(home_product_name_selector(product_name)).visible?
    end
  end
  def nombres_de_productos_correctos?(list_of_products)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      find(home_product_name_selector(product_name)).has_text?(product_name)
    end
  end
  def precios_de_productos_correctos?(list_of_products)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      product_price = row['Price']
      find(home_product_price_selector(product_name)).has_text?(product_price)
    end
  end
  def nombres_de_productos_de_categorias_cargados?(list_of_products,category_name)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      find(category_product_selector(category_name,product_name,ProductField::Name)).visible?
    end
  end
  def precios_de_productos_de_categorias_cargados?(list_of_products,category_name)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      product_price = row['Price']
      find(category_product_selector(category_name,product_name,ProductField::Price)).visible?
    end
  end
  def nombres_de_productos_de_categorias_correctos?(list_of_products,category_name)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      product_price = row['Price']
      find(category_product_selector(category_name,product_name,ProductField::Name)).has_text?(product_name)
    end
  end
  def precios_de_productos_de_categorias_correctos?(list_of_products,category_name)
    list_of_products.all? do |row|
      product_name = row['Product Name']
      product_price = row['Price']
      find(category_product_selector(category_name,product_name,ProductField::Price)).has_text?(product_price)
    end
  end
  def ir_al_producto(category_name,product_name)
    producto =find(category_product_selector(category_name,product_name,ProductField::Name),wait:10)
    producto.click()
  end
end

Then('I should see the main categories in the left sidebar') do |table|
  @home_page = HomePage.new
  expect(@home_page.categorias_cargadas?(table.hashes)).to be_truthy
  expect(@home_page.categorias_correctas_visibles?(table.hashes)).to be_truthy
end

Then('I should see a product list without any category selected') do |table|
  @home_page = HomePage.new
  expect(@home_page.nombres_de_productos_cargados?(table.hashes)).to be_truthy
  expect(@home_page.precios_de_productos_cargados?(table.hashes)).to be_truthy
  expect(@home_page.nombres_de_productos_correctos?(table.hashes)).to be_truthy
  expect(@home_page.precios_de_productos_correctos?(table.hashes)).to be_truthy
end

Then('I should see the pagination controls at the bottom of the product list') do
  expect(page).to have_css(button_selector('Previous'), wait: Capybara.default_max_wait_time)
end

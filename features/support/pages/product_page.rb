require_relative 'base_page'

class ProductPage < BasePage
  def add_to_cart
    click_link('Add to cart')
  end

  def has_product_title?(expected_title)
    page.has_css?('.name', text: expected_title, wait: Capybara.default_max_wait_time)
  end

  def has_action?(action_text)
    page.has_link?(action_text, wait: Capybara.default_max_wait_time)
  end
end

require_relative 'base_page'

class HomePage < BasePage
  def load
    visit_landing_page
  end

  def click_navbar_link(link_text)
    selector = Constants::NAVBAR_LINK_SELECTORS[link_text]

    if selector
      find(selector, wait: Capybara.default_max_wait_time).click
    else
      click_link(link_text)
    end
  end

  def click_category(category_name)
    find(:xpath, category_link_selector(category_name), wait: Capybara.default_max_wait_time).click
  end

  def open_product_detail(product_name)
    find('a.hrefch', text: product_name, wait: Capybara.default_max_wait_time).click
  end

  def has_category?(category_name)
    page.has_xpath?(category_link_selector(category_name), wait: Capybara.default_max_wait_time)
  end

  def has_product_card?(product_name)
    page.has_css?('a.hrefch', text: product_name, wait: Capybara.default_max_wait_time)
  end

  def has_category_product?(product_name, expected_price)
    card_xpath = "//div[contains(@class,'card h-100')][.//h4[contains(@class,'card-title')]/a[normalize-space()='#{product_name}'] and .//h5[normalize-space()='#{expected_price}']]"
    page.has_xpath?(card_xpath, wait: Capybara.default_max_wait_time)
  end

  def has_default_product?(product_name, expected_price)
    page.has_css?(home_product_name_selector(product_name), text: product_name, wait: Capybara.default_max_wait_time) &&
      page.has_css?(home_product_price_selector(product_name), text: expected_price, wait: Capybara.default_max_wait_time)
  end

  def has_pagination_controls?
    page.has_css?(button_selector('Previous'), wait: Capybara.default_max_wait_time)
  end

  private

  def category_link_selector(category_name)
    Constants::CATEGORY_LINK_SELECTORS.fetch(category_name) do
      raise "Unknown category selector for '#{category_name}'"
    end
  end

  def button_selector(button_text)
    Constants::BUTTON_SELECTORS.fetch(button_text) do
      raise "Unknown button selector for '#{button_text}'"
    end
  end

  def home_product_name_selector(product_name)
    "#{home_product_selector(product_name)} > div:nth-child(1) > div:nth-child(2) > h4:nth-child(1) > a:nth-child(1)"
  end

  def home_product_price_selector(product_name)
    "#{home_product_selector(product_name)} > div:nth-child(1) > div:nth-child(2) > h5:nth-child(2)"
  end

  def home_product_selector(product_name)
    Constants::HOME_PRODUCTS.fetch(product_name) do
      raise "Unknown home product selector for '#{product_name}'"
    end
  end
end

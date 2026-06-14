require_relative 'base_page'

class CartPage < BasePage
  def open
    find(navbar_link_selector('Cart'), wait: Capybara.default_max_wait_time).click
    page.has_text?('Products', wait: Capybara.default_max_wait_time)
  end

  def clear
    loop do
      delete_link = first('#tbodyid a', text: 'Delete', minimum: 0, wait: 1)
      break unless delete_link

      delete_link.click
    end
  end

  def remove_product(product_name)
    row = find('#tbodyid tr', text: product_name, wait: Capybara.default_max_wait_time)

    within(row) do
      click_link('Delete')
    end
  end

  def has_product?(product_name)
    page.has_css?('#tbodyid tr', text: product_name, wait: Capybara.default_max_wait_time)
  end

  def has_no_product?(product_name)
    page.has_no_css?('#tbodyid tr', text: product_name, wait: Capybara.default_max_wait_time)
  end

  private

  def navbar_link_selector(link_text)
    Constants::NAVBAR_LINK_SELECTORS.fetch(link_text) do
      raise "Unknown navbar link selector for '#{link_text}'"
    end
  end
end

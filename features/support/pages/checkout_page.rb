require_relative 'base_page'

class CheckoutPage < BasePage
  def place_order(data)
    find(button_selector('Place Order'), wait: Capybara.default_max_wait_time).click

    within('#orderModal') do
      fill_in 'name', with: data['Name']
      fill_in 'country', with: data['Country']
      fill_in 'city', with: data['City']
      fill_in 'card', with: data['Credit card']
      fill_in 'month', with: data['Month']
      fill_in 'year', with: data['Year']
      find('button', text: 'Purchase').click
    end
  end

  def has_confirmation?
    page.has_css?('.sweet-alert.visible', wait: Capybara.default_max_wait_time)
  end

  def has_confirmation_text?(expected_text)
    page.has_css?('.sweet-alert.visible h2', text: expected_text, wait: Capybara.default_max_wait_time)
  end

  def accept_confirmation
    find('.sweet-alert.visible button.confirm').click
  end

  private

  def button_selector(button_text)
    Constants::BUTTON_SELECTORS.fetch(button_text) do
      raise "Unknown button selector for '#{button_text}'"
    end
  end
end

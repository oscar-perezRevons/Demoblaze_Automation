class BasePage
  include Capybara::DSL

  def visit_landing_page
    visit Constants::APP_URL
  end

  def wait_for_browser_alert(timeout: Capybara.default_max_wait_time)
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      begin
        page.driver.browser.switch_to.alert
      rescue Selenium::WebDriver::Error::NoSuchAlertError
        nil
      end
    end
  end

  def read_and_accept_alert
    alert = wait_for_browser_alert
    message = alert.text
    alert.accept
    message
  end

  def normalize_alert_text(text)
    text.to_s.gsub(/\.+\z/, '')
  end

  def maximize_window
    page.driver.browser.manage.window.maximize
  end
end

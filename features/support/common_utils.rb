class CommonUtils
  include Capybara::DSL

  def wait_for_browser_alert(timeout: Capybara.default_max_wait_time)
    Selenium::WebDriver::Wait.new(timeout: timeout).until do
      begin
        page.driver.browser.switch_to.alert
      rescue Selenium::WebDriver::Error::NoSuchAlertError
        nil
      end
    end
  end
  def normalize_alert_text(text)
    text.to_s.gsub(/\.+\z/, '')
  end
end

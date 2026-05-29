def wait_for_browser_alert(timeout: Capybara.default_max_wait_time)
  Selenium::WebDriver::Wait.new(timeout: timeout).until do
    begin
      page.driver.browser.switch_to.alert
    rescue Selenium::WebDriver::Error::NoSuchAlertError
      nil
    end
  end
end

def resolve_dynamic_value(raw_value)
  normalized = raw_value.to_s.strip

  case normalized
  when 'AUTO_USER'
    @generated_username ||= "qa_auto_#{Time.now.to_i}_#{rand(1000..9999)}"
  when 'AUTO_PASS'
    @generated_password ||= "QaAuto_#{Time.now.to_i}_#{rand(1000..9999)}"
  else
    raw_value.to_s
  end
end

Given('I am on the Demoblaze homepage {string}') do |url|
  visit url
end

Given('I click the {string} link') do |link_text|
  click_link(link_text)
end

When('I enter the registration fields as show below') do |table|
  data = table.rows_hash
  fill_in 'sign-username', with: resolve_dynamic_value(data['Username'])
  fill_in 'sign-password', with: resolve_dynamic_value(data['Password'])
end

When('I click the {string} button in the modal') do |button_text|
  find('button', text: button_text).click
end

Then('an alert message saying {string} is displayed') do |expected_alert_text|
  alert = wait_for_browser_alert
  normalized_expected = expected_alert_text.gsub(/\.+\z/, '')
  normalized_actual = alert.text.gsub(/\.+\z/, '')
  expect(normalized_actual).to eq(normalized_expected)
  alert.accept
end

When('I enter the login credentials as show below') do |table|
  data = table.rows_hash
  fill_in 'loginusername', with: resolve_dynamic_value(data['Username'])
  fill_in 'loginpassword', with: resolve_dynamic_value(data['Password'])
end

Then('the welcome message {string} should be displayed in the navbar') do |expected_welcome_text|
  expect(page).to have_css('#nameofuser', text: expected_welcome_text, wait: Capybara.default_max_wait_time)
end

Given('I am logged in with the credentials as show below') do |table|
  data = table.rows_hash

  visit 'https://www.demoblaze.com/index.html'
  click_link('Log in')
  fill_in 'loginusername', with: resolve_dynamic_value(data['Username'])
  fill_in 'loginpassword', with: resolve_dynamic_value(data['Password'])
  find('button', text: 'Log in').click

  expected_username = resolve_dynamic_value(data['Username'])
  expect(page).to have_css('#nameofuser', text: "Welcome #{expected_username}", wait: Capybara.default_max_wait_time)
end

Then('the {string} link should be visible in the navbar') do |link_text|
  expect(page).to have_css('#navbarExample a', text: link_text, wait: Capybara.default_max_wait_time)
end

Then('the {string} link should not be visible in the navbar') do |link_text|
  expect(page).to have_no_css('#navbarExample a', text: link_text, visible: :visible, wait: Capybara.default_max_wait_time)
end

Then('the welcome message should not be displayed in the navbar') do
  expect(page).to have_no_css('#nameofuser', visible: :visible, wait: Capybara.default_max_wait_time)
end

Then('the welcome message for the generated user should be displayed in the navbar') do
  raise 'AUTO_USER was not generated in this scenario.' unless @generated_username

  expect(page).to have_css(
    '#nameofuser',
    text: "Welcome #{@generated_username}",
    wait: Capybara.default_max_wait_time
  )
end
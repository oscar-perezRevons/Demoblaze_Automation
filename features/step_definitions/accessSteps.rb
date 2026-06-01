require 'securerandom'

FIRST_NAMES = %w[maria carlos ana luis sofia diego paula marco laura andres].freeze
LAST_NAMES = %w[rios perez lopez vargas castro mendoza herrera flores torres guzman].freeze

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

def build_human_username
  first_name = FIRST_NAMES.sample
  last_name = LAST_NAMES.sample
  suffix = SecureRandom.hex(2)
  "#{first_name}.#{last_name}.#{suffix}"
end

def build_human_password
  suffix = SecureRandom.hex(2)
  "ClaveDemo2026!#{suffix}"
end

def resolve_dynamic_value(raw_value)
  normalized = raw_value.to_s.strip

  case normalized
  when Constants::AUTO_USER_TOKEN
    @generated_username ||= build_human_username
  when Constants::AUTO_PASS_TOKEN
    @generated_password ||= build_human_password
  else
    raw_value.to_s
  end
end

def sign_up_user(username:, password:)
  click_link('Sign up')
  fill_in 'sign-username', with: username
  fill_in 'sign-password', with: password
  find('button', text: 'Sign up').click

  alert = wait_for_browser_alert
  normalized_alert_text = normalize_alert_text(alert.text)
  accepted_messages = ['Sign up successful', 'This user already exist']

  unless accepted_messages.include?(normalized_alert_text)
    raise "Unexpected sign up alert: '#{alert.text}'"
  end

  alert.accept
end

def log_in_user(username:, password:)
  click_link('Log in')
  fill_in 'loginusername', with: username
  fill_in 'loginpassword', with: password
  find('button', text: 'Log in').click
end

Given('I am on the Demoblaze homepage {string}') do |url|
  visit url
end

Given('I am logged in with a newly registered user') do
  visit Constants::APP_URL
  username = resolve_dynamic_value(Constants::AUTO_USER_TOKEN)
  password = resolve_dynamic_value(Constants::AUTO_PASS_TOKEN)

  sign_up_user(username: username, password: password)
  log_in_user(username: username, password: password)

  expect(page).to have_css('#nameofuser', text: "Welcome #{username}", wait: Capybara.default_max_wait_time)
end

Given('I click the {string} link') do |link_text|
  selector = Constants::NAVBAR_LINK_SELECTORS[link_text]

  if selector
    find(selector, wait: Capybara.default_max_wait_time).click
  else
    click_link(link_text)
  end
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
  normalized_expected = normalize_alert_text(expected_alert_text)
  normalized_actual = normalize_alert_text(alert.text)
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

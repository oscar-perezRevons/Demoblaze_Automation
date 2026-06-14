require 'securerandom'

FIRST_NAMES = %w[maria carlos ana luis sofia diego paula marco laura andres].freeze
LAST_NAMES = %w[rios perez lopez vargas castro mendoza herrera flores torres guzman].freeze

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

def generated_username
  @generated_username ||= build_human_username
end

def generated_password
  @generated_password ||= build_human_password
end

def resolve_dynamic_value(raw_value)
  normalized = raw_value.to_s.strip

  case normalized
  when Constants::AUTO_USER_TOKEN
    generated_username
  when Constants::AUTO_PASS_TOKEN
    generated_password
  else
    raw_value.to_s
  end
end

Given('I am on the Demoblaze homepage') do
  home_page.load
end

Given('I have a newly registered user account') do
  home_page.load
  auth_page.register_and_accept(username: generated_username, password: generated_password)
end

Given('I am logged in with a newly registered user') do
  home_page.load
  username = generated_username
  password = generated_password

  auth_page.register_and_accept(username: username, password: password)
  auth_page.log_in(username: username, password: password)

  expect(auth_page).to have_welcome_message("Welcome #{username}")
end

When('I register with new valid credentials') do
  auth_page.register(username: generated_username, password: generated_password)
end

Given('I click the {string} link') do |link_text|
  home_page.click_navbar_link(link_text)
end

When('I enter the registration fields as shown below') do |table|
  data = table.rows_hash
  auth_page.fill_registration(
    username: resolve_dynamic_value(data['Username']),
    password: resolve_dynamic_value(data['Password'])
  )
end

When('I click the {string} button in the modal') do |button_text|
  auth_page.submit_modal_button(button_text)
end

Then('an alert message saying {string} is displayed') do |expected_alert_text|
  actual_alert_text = base_page.read_and_accept_alert
  normalized_expected = base_page.normalize_alert_text(expected_alert_text)
  normalized_actual = base_page.normalize_alert_text(actual_alert_text)
  expect(normalized_actual).to eq(normalized_expected)
end

When('I enter the login credentials as shown below') do |table|
  data = table.rows_hash
  auth_page.fill_login(
    username: resolve_dynamic_value(data['Username']),
    password: resolve_dynamic_value(data['Password'])
  )
end

When('I log in with the generated credentials') do
  auth_page.log_in(username: generated_username, password: generated_password)
end

When('I log in with the generated username and password {string}') do |password|
  auth_page.log_in(username: generated_username, password: resolve_dynamic_value(password))
end

When('I log in with a generated user that is not registered') do
  @generated_username = build_human_username
  @generated_password = build_human_password

  auth_page.log_in(username: generated_username, password: generated_password)
end

Then('the welcome message {string} should be displayed in the navbar') do |expected_welcome_text|
  expect(auth_page).to have_welcome_message(expected_welcome_text)
end

Then('the {string} link should be visible in the navbar') do |link_text|
  expect(auth_page).to have_navbar_link(link_text)
end

Then('the {string} link should not be visible in the navbar') do |link_text|
  expect(auth_page).to have_no_navbar_link(link_text)
end

Then('the welcome message should not be displayed in the navbar') do
  expect(auth_page).to have_no_welcome_message
end

Then('the welcome message for the generated user should be displayed in the navbar') do
  raise 'AUTO_USER was not generated in this scenario.' unless @generated_username

  expect(auth_page).to have_welcome_message("Welcome #{@generated_username}")
end

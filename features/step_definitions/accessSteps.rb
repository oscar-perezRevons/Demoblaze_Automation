Before do
  @account_utils = AccountUtils.new
  @sign_up_page = SignUpPage.new
  @login_page = LoginPage.new
  @nav_bar = NavBarComponent.new
  @common_utils = CommonUtils.new
end

Given('I am on the Demoblaze homepage') do
  @home_page = HomePage.new
  @home_page.cargar_pagina
end

Given('I am logged in with a newly registered user') do 
  @generated_username = @account_utils.build_human_username
  @generated_password = @account_utils.build_human_password
  @sign_up_page.sign_up_user(@generated_username,@generated_password)
  @home_page.cargar_pagina
  @login_page.log_in_user(@generated_username,@generated_password) 
end

Given('I click the {string} link') do |link_text|
  @nav_bar.navegar_a(link_text)
end

When('I enter the registration fields as shown below') do |table|
  data = table.rows_hash
  @generated_username = @account_utils.resolve_dynamic_value(data['Username'])
  @generated_password = @account_utils.resolve_dynamic_value(data['Password'])
  @sign_up_page.fill_sign_up_form(@generated_username,@generated_password)
end

When('I click the {string} button in the modal') do |button_text|
   find('button', text: button_text).click
end

Then('an alert message saying {string} is displayed') do |expected_alert_text|
  alert = @common_utils.wait_for_browser_alert
  normalized_expected = @common_utils.normalize_alert_text(expected_alert_text)
  normalized_actual = @common_utils.normalize_alert_text(alert.text)
  expect(normalized_actual).to eq(normalized_expected)
  alert.accept
end

When('I enter the login credentials as shown below') do |table|
  data = table.rows_hash
  @generated_username = @account_utils.resolve_dynamic_value(data['Username'])
  @generated_password = @account_utils.resolve_dynamic_value(data['Password'])
  @login_page.fill_log_in_form(@generated_username,@generated_password)
end

Then('the welcome message for {string} should be displayed in the navbar') do |username|
  expect(@navbar.tiene_una_sesion_activa?(username)).to be_truthy
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

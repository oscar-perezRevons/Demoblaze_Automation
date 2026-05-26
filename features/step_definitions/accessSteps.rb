Given('I am on the Demoblaze homepage {string}') do |url|
    visit url
end

Given('I click the {string} link') do |link_text|
    click_link(link_text)
end

When('I enter the registration fields as show below') do |table|
    data = table.rows_hash
    fill_in 'sign-username', with: data['Username']
    fill_in 'sign-password', with: data['Password']
end

When('I click the {string} button in the modal') do |button_text|
  find('button', text: button_text).click
end 

Then('an alert message saying {string} is displayed') do |expected_alert_text|
    sleep 2
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(expected_alert_text)
    alert.accept
end

When('I enter the login credentials as show below') do |table|
  data = table.rows_hash
  fill_in 'loginusername', with: data['Username']
  fill_in 'loginpassword', with: data['Password']
end

Then('the welcome message {string} should be displayed in the navbar') do |expected_welcome_text|
  sleep 2
  expect(page).to have_css('#nameofuser', text: expected_welcome_text)
end
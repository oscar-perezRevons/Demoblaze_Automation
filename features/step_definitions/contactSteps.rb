Given('I click the {string} link in the navbar') do |link_text|
  find(navbar_link_selector(link_text), wait: Capybara.default_max_wait_time).click
end

When('I fill out the form with the following details') do |table|
  data = table.rows_hash
  find(contact_form_selector('Email')).set(data['Email'])
  find(contact_form_selector('Name')).set(data['Name'])
  find(contact_form_selector('Message')).set(data['Message'])
end

When('I click the {string} button') do |button_text|
  selector = UiMaps::BUTTON_SELECTORS[button_text]

  if selector
    find(selector, wait: Capybara.default_max_wait_time).click
  else
    click_link_or_button(button_text)
  end
end
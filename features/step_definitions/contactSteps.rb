Given('I click the {string} link in the navbar') do |link_text|
  home_page.click_navbar_link(link_text)
end

When('I fill out the form with the following details') do |table|
  contact_page.fill_form(table.rows_hash)
end

When('I click the {string} button') do |button_text|
  contact_page.click_button(button_text)
end

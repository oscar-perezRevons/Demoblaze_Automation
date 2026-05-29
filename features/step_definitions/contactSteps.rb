Before do
    @contactFormCssSelector = {
        "Email" => "#recipient-email",
        "Name" => "#recipient-name",
        "Message" => "#message-text",
        "Send message" => "" 
    };
    @categoriesLinkCssSelector = {
        "Phones" => "a.list-group-item:nth-child(2)",
        "Laptops" => "a.list-group-item:nth-child(3)",
        "Monitors" => "a.list-group-item:nth-child(4)"
    }
end


Given('I click the {string} link in the navbar') do |link_text|
    find(@navbar_links_css_selector[link_text]).click
end

When('I fill out the form with the following details') do |table|
    data = table.rows_hash
    find(@contactFormCssSelector['Email']).set(data['Email'])
    find(@contactFormCssSelector['Name']).set(data['Name'])
    find(@contactFormCssSelector['Message']).set(data['Message'])
end

When('I click the {string} button') do |button_text|
    find(@button_css_selector[button_text]).click
end

When('I click on the {string} button') do |button_text|
    find(@button_css_selector[button_text]).click
end

Then('an alert message saying {string} should be displayed') do |expected_alert_text|
    sleep 2
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(expected_alert_text)
    alert.accept
end
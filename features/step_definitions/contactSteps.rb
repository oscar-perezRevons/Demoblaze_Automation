Before do
    @contactFormCssSelector = {
        "Contact" => "li.nav-item:nth-child(2) > a:nth-child(1)",
        "Email" => "#recipient-email",
        "Name" => "#recipient-name",
        "Message" => "#message-text",
        "Send message" => "#exampleModal > div:nth-child(1) > div:nth-child(1) > div:nth-child(3) > button:nth-child(2)" 
    }
end


Given('I click the {string} link in the navbar') do |link_text|
    find(@contactFormCssSelector[link_text]).click
end

When('I fill out the form with the following details') do |table|
    data = table.rows_hash
    find(@contactFormCssSelector['Email']).set(data['Email'])
    find(@contactFormCssSelector['Name']).set(data['Name'])
    find(@contactFormCssSelector['Message']).set(data['Message'])
end

When('I click the {string} button') do |button_text|
    find(@contactFormCssSelector[button_text]).click
end

Then('an alert message saying {string} should be displayed') do |expected_alert_text|
    sleep 2
    alert = page.driver.browser.switch_to.alert
    expect(alert.text).to eq(expected_alert_text)
    alert.accept
end
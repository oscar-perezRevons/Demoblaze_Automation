require_relative 'base_page'

class ContactPage < BasePage
  def fill_form(data)
    find(contact_form_selector('Email')).set(data['Email'])
    find(contact_form_selector('Name')).set(data['Name'])
    find(contact_form_selector('Message')).set(data['Message'])
  end

  def click_button(button_text)
    selector = Constants::BUTTON_SELECTORS[button_text]

    if selector
      find(selector, wait: Capybara.default_max_wait_time).click
    else
      click_link_or_button(button_text)
    end
  end

  private

  def contact_form_selector(field_name)
    Constants::CONTACT_FORM_SELECTORS.fetch(field_name) do
      raise "Unknown contact form selector for '#{field_name}'"
    end
  end
end

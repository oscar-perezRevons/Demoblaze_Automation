require_relative 'base_page'

class AuthPage < BasePage
  ACCEPTED_SIGN_UP_MESSAGES = ['Sign up successful', 'This user already exist'].freeze

  def register(username:, password:)
    open_signup_modal
    fill_registration(username: username, password: password)
    submit_signup
  end

  def register_and_accept(username:, password:)
    register(username: username, password: password)
    alert_text = normalize_alert_text(read_and_accept_alert)

    unless ACCEPTED_SIGN_UP_MESSAGES.include?(alert_text)
      raise "Unexpected sign up alert: '#{alert_text}'"
    end
  end

  def log_in(username:, password:)
    open_login_modal
    fill_login(username: username, password: password)
    submit_login
  end

  def open_signup_modal
    close_visible_modal
    find(navbar_link_selector('Sign up'), wait: Capybara.default_max_wait_time).click
  end

  def open_login_modal
    close_visible_modal
    find(navbar_link_selector('Log in'), wait: Capybara.default_max_wait_time).click
  end

  def fill_registration(username:, password:)
    fill_in 'sign-username', with: username
    fill_in 'sign-password', with: password
  end

  def fill_login(username:, password:)
    fill_in 'loginusername', with: username
    fill_in 'loginpassword', with: password
  end

  def submit_signup
    find('button', text: 'Sign up', wait: Capybara.default_max_wait_time).click
  end

  def submit_login
    find('button', text: 'Log in', wait: Capybara.default_max_wait_time).click
  end

  def submit_modal_button(button_text)
    case button_text
    when 'Sign up'
      submit_signup
    when 'Log in'
      submit_login
    else
      find('button', text: button_text, wait: Capybara.default_max_wait_time).click
    end
  end

  def has_welcome_message?(expected_text)
    page.has_css?('#nameofuser', text: expected_text, wait: Capybara.default_max_wait_time)
  end

  def has_navbar_link?(link_text)
    page.has_css?('#navbarExample a', text: link_text, wait: Capybara.default_max_wait_time)
  end

  def has_no_navbar_link?(link_text)
    page.has_no_css?('#navbarExample a', text: link_text, visible: :visible, wait: Capybara.default_max_wait_time)
  end

  def has_no_welcome_message?
    page.has_no_css?('#nameofuser', visible: :visible, wait: Capybara.default_max_wait_time)
  end

  private

  def navbar_link_selector(link_text)
    Constants::NAVBAR_LINK_SELECTORS.fetch(link_text) do
      raise "Unknown navbar link selector for '#{link_text}'"
    end
  end

  def close_visible_modal
    modal = first('.modal.show', visible: :visible, minimum: 0, wait: 1)
    return unless modal

    within(modal) do
      find('button.close', visible: :visible, wait: Capybara.default_max_wait_time).click
    end

    page.has_no_css?('.modal.show', visible: :visible, wait: Capybara.default_max_wait_time)
  end
end

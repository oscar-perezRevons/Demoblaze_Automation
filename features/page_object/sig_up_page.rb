class SignUpPage
  include Capybara::DSL

  def fill_sign_up_form(username,password)
    find(sign_up_form_selector("Username")).set(username)
    find(sign_up_form_selector("Password")).set(password)
  end
  
  def click_sign_up_button()
    accept_alert do
      find(button_selector("Sign up")).click()
    end
  end

  def sign_up_user(username,password)
    navbar = NavBarComponent.new
    navbar.navegar_a("Sign up")
    fill_sign_up_form(username,password)
    click_sign_up_button()
  end

   
  def is_sign_up_succesfully()
    alert = wait_for_browser_alert
    normalized_alert_text = normalize_alert_text(alert.text)
    unless Constants::ACCEPTED_SIGIN_MESSAGES.include(normalized_alert_text)
      raise "Unexpected sign up alert: '#{alert.text}'"
    end
    alert.accept
  end
end

require 'securerandom'
class LoginPage
  include Capybara::DSL

  def fill_log_in_form(username,password)
    find(login_form_selector('Username')).set(username)
    find(login_form_selector('Password')).set(password)
  end

  def log_in_user(username, password)
    navbar = NavBarComponent.new
    navbar.navegar_a('Log in')
    fill_log_in_form(username,password)
    find(button_selector('Log in')).click
  end 

end

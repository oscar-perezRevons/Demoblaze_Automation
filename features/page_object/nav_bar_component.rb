class NavBarComponent
  include Capybara::DSL
  def navegar_a(link_name)
    find(navbar_link_selector(link_name)).click()
  end
  def tiene_una_sesion_activa?(username)
    find(navbar_link_selector('User')).has_text?("Welcome #{username}")
  end
end

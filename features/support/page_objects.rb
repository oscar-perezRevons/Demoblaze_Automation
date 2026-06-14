module PageObjects
  def base_page
    @base_page ||= BasePage.new
  end

  def home_page
    @home_page ||= HomePage.new
  end

  def auth_page
    @auth_page ||= AuthPage.new
  end

  def product_page
    @product_page ||= ProductPage.new
  end

  def cart_page
    @cart_page ||= CartPage.new
  end

  def checkout_page
    @checkout_page ||= CheckoutPage.new
  end

  def contact_page
    @contact_page ||= ContactPage.new
  end
end

World(PageObjects)

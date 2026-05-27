begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'.
ENV['BROWSER'] ||= 'firefox' 
ENV['USER']    ||= "Pepazo"
ENV['PSW']     ||= "ILoveQA"

NAVEGADOR_ACTUAL = ENV['BROWSER'].downcase.to_sym

class CapybaraRegisterDriver

  def self.get_selenium_options(browser)
    browser_klass = browser.to_s.capitalize
    Selenium::WebDriver.const_get(browser_klass).const_get('Options').new
  end

  def self.register_selenium_driver(browser)
    options = self.get_selenium_options(browser)
    
    if browser == :firefox
    elsif browser == :chrome
      options.add_argument('--start-maximized')
    end

    Capybara.register_driver "selenium_#{browser}".to_sym do |app|
      Capybara::Selenium::Driver.new(app, browser: browser, options: options)
    end
  end
end

CapybaraRegisterDriver.register_selenium_driver(NAVEGADOR_ACTUAL)

DRIVER_DINAMICO = "selenium_#{NAVEGADOR_ACTUAL}".to_sym

Capybara.default_driver    = DRIVER_DINAMICO
Capybara.javascript_driver = DRIVER_DINAMICO

Capybara.default_max_wait_time = 15
Capybara.app_host = "https://www.demoblaze.com/index.html"
Capybara.run_server = false
#World(Capybara)
Capybara.default_driver = :chrome_testing
Capybara.javascript_driver = :chrome_testing

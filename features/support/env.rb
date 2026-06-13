require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec/expectations'

SUPPORTED_BROWSERS = %w[firefox chrome].freeze
selected_browser = ENV.fetch('BROWSER', 'firefox').strip.downcase

unless SUPPORTED_BROWSERS.include?(selected_browser)
  raise ArgumentError,
        "Unsupported BROWSER='#{ENV['BROWSER']}'. Supported values: #{SUPPORTED_BROWSERS.join(', ')}."
end

ENV['BROWSER'] = selected_browser
ENV['USER'] = 'Revons'
ENV['PSSW'] = 'Revons'
ENV['DEFAULT_HOME_PAGE'] = 'https://www.demoblaze.com/'

NAVEGADOR_ACTUAL = ENV['BROWSER'].to_sym

class CapybaraRegisterDriver
  def self.get_selenium_options(browser)
    browser_klass = browser.to_s.capitalize
    Selenium::WebDriver.const_get(browser_klass).const_get('Options').new
  end

  def self.register_selenium_driver(browser)
    Capybara.register_driver "selenium_#{browser}".to_sym do |app|
      options = self.get_selenium_options(browser)
      options.add_argument('--start-maximized') if browser == :chrome

      Capybara::Selenium::Driver.new(app, browser: browser, options: options)
    end
  end
end

CapybaraRegisterDriver.register_selenium_driver(NAVEGADOR_ACTUAL)

DRIVER_DINAMICO = "selenium_#{NAVEGADOR_ACTUAL}".to_sym
Capybara.default_driver = DRIVER_DINAMICO
Capybara.javascript_driver = DRIVER_DINAMICO

Capybara.default_max_wait_time = 15
Capybara.app_host = ENV['DEFAULT_HOME_PAGE'] # Usamos la variable para la URL base
Capybara.run_server = false

# Capybara maneja la apertura y cierre del navegador automáticamente entre escenarios, 
# por lo que ya no necesitas los bloques Before y After para instanciar/cerrar el driver.

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'selenium-webdriver'

SUPPORTED_BROWSERS = %w[firefox chrome].freeze

selected_browser = ENV.fetch('BROWSER', 'firefox').strip.downcase
unless SUPPORTED_BROWSERS.include?(selected_browser)
  raise ArgumentError,
        "Unsupported BROWSER='#{ENV['BROWSER']}'. Supported values: #{SUPPORTED_BROWSERS.join(', ')}. " \
        "Example: BROWSER=chrome cucumber"
end

ENV['BROWSER'] = selected_browser
ENV['USER']    ||= "Pepazo"
ENV['PSW']     ||= "ILoveQA"

NAVEGADOR_ACTUAL = ENV['BROWSER'].downcase.to_sym

class CapybaraRegisterDriver

  def self.get_selenium_options(browser)
    browser_klass = browser.to_s.capitalize
    Selenium::WebDriver.const_get(browser_klass).const_get('Options').new
  end

  def self.register_selenium_driver(browser)
    Capybara.register_driver "selenium_#{browser}".to_sym do |app|
      options = self.get_selenium_options(browser)

      if browser == :chrome
        options.add_argument('--start-maximized')
      end

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


require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require 'byebug'

DATA = YAML.load(File.read("features/data/login_data.yml"))
SIGN_DATA = YAML.load(File.read("features/data/sign_up_data.yml"))

Capybara.configure do |c|
  c.default_driver = :selenium_chrome
  c.default_max_wait_time = 10
  c.app_host = 'https://amaro.com/'
end
#Capybara.page.driver.browser.manage.window.maximize
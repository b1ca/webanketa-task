$LOAD_PATH.unshift(File.join(File.dirname('__FILE__'), '..', 'lib'))

require 'rspec'
require 'page-object'
require 'selenium-webdriver'
require 'require_all'

require_all 'lib'

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before do
    @browser = Selenium::WebDriver.for :firefox
  end

  config.after do
    @browser.quit
  end
end
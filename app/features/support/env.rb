# frozen_string_literal: true
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', '..', 'app.rb')

# require 'capybara'
# require 'capybara/cucumber'
require 'rspec'
require 'rack/test'
require 'factory_girl'

FactoryGirl.find_definitions

# Capybara.app = MyApp

module AppHelper
  def app
    MyApp
  end
end

class MyAppWorld
  # include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers
  include FactoryGirl::Syntax::Methods
  include Rack::Test::Methods
  include AppHelper
end

World do
  MyAppWorld.new
end

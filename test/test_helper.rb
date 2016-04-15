ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require 'pry-rails'
require 'minitest/pride'
require 'mocha/test_unit'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def teardown
    reset_session!
  end
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end

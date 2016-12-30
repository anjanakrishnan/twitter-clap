ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/spec"
require 'simplecov'
SimpleCov.start

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
def sign_in(user:)
    post user_session_path \
      "user[email]"    => user.email
      
  end
  # Add more helper methods to be used by all tests here...
end
class ActionController::TestCase
  include Devise::Test::ControllerHelpers

  
end

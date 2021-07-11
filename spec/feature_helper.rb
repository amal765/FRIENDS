# frozen_string_literal: true
require 'rails_helper'
require 'capybara/rspec'

Capybara.configure do |config|
    config.default_max_wait_time = 10 #seconds
    config.default_driver = :selenium
end

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end

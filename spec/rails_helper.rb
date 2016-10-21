ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'capybara/poltergeist'

# Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include Devise::Test::ControllerHelpers, type: :controller
  config.include Devise::Test::IntegrationHelpers, type: :feature

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  config.after(:each) { DatabaseCleaner.clean }
  config.before(:each) do |example|
    strategy = example.metadata.key?(:js) ? :truncation : :transaction
    DatabaseCleaner.strategy = strategy
    DatabaseCleaner.start
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
  end
end

Capybara.configure do |config|
  config.server_port = 56_120
  config.javascript_driver = :poltergeist
end

source 'https://rubygems.org'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'

gem 'pg', '~> 0.19', group: [:development, :test]
gem 'mysql2', '~> 0.4.4', group: :production

gem 'slim-rails', '~> 3.1.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem 'turbolinks', '~> 5'

gem 'activeadmin', github: 'activeadmin', branch: :master
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise', '~> 4.2'

gem 'foreman', '~> 0.63.0', require: false, group: :production

group :development, :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-nav'
  gem 'rspec-rails', '~> 3.5', '>= 3.5.2'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec', require: false

  gem 'mina', require: false
  gem 'mina-puma', require: false

  # Detect code smells
  gem 'rubocop', require: false
  gem 'rubocop-rspec', require: false
  gem 'reek', require: false
end

group :test do
  gem 'fuubar'
  gem 'shoulda-matchers', '~> 3.1.1'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'poltergeist'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

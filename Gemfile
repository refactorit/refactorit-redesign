source 'https://rubygems.org'

ruby '2.3.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta2', '< 5.1'
# Use PostgresSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# CSS framework
gem 'foundation-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Solves issues with jquery and turbolinks
gem 'jquery-turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Action Cable dependencies for the Redis adapter
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Template engine
gem 'slim-rails'
# Authentication
gem 'devise', git: 'https://github.com/plataformatec/devise.git'

gem 'simple_form'

# Markdown converter
gem 'redcarpet'
# Syntax highlighting
gem 'rouge'
# Find by slug instead of id
gem 'friendly_id'
# Wrapper for the Dribbble API
gem 'dribbble'
# Background job processing
gem 'sidekiq'
gem 'mailgun_rails'
# Loading environment variables
gem 'dotenv-rails'
# File upload
gem 'paperclip'

# Deployment related gems
gem 'capistrano', '~> 3.1.0'
gem 'capistrano-bundler', '~> 1.1.2'
gem 'capistrano-rails', '~> 1.1.1'
gem 'capistrano-rbenv', github: "capistrano/rbenv"

group :production do
  # Server
  gem 'unicorn'
end



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Test suite
  gem 'rspec-rails', '~> 3.0'
end

group :test do
  # Fixtures
  gem 'factory_girl_rails'
  gem 'capybara', git: 'https://github.com/jnicklas/capybara.git'
  gem 'capybara-email'
  # Helpers for validation specs
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  # Stubbing HTTP requests
  gem 'webmock'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem "letter_opener"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "3.2.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.5"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use mysql as the database for Active Record
gem "mysql2", "~> 0.5"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Boostrap and Sprockets
gem "bootstrap"

# Use Redis adapter to run Action Cable in production
gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html]
gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
gem "sass-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html]
# gem "image_processing", "~> 1.2"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "rubocop", "~> 1.26", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.14.0", require: false
  gem 'guard'
  gem 'guard-minitest' # Nếu bạn sử dụng Minitest
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem 'minitest-reporters'
end

gem 'webpacker', '~> 5.0'

gem 'rails-controller-testing'

gem 'bootstrap-sass', '~> 3.3.6'

gem 'hotwire-rails' 

gem 'jquery-rails'

gem 'jquery-ui-rails'

gem 'faker'

gem 'will_paginate', '~> 3.3.0'

gem 'bootstrap-will_paginate', '1.0.0'

gem 'mini_magick'

gem 'carrierwave'

gem 'active_storage_validations'

gem 'image_processing'

group :production do
  gem 'pg'
  gem 'aws-sdk-s3',  require: false
end

gem 'google-authenticator-rails'

gem 'omniauth'

gem 'omniauth-github', '~> 2.0.0'

gem 'devise'

gem 'omniauth-rails_csrf_protection'

gem 'dotenv-rails', groups: [:development, :test]
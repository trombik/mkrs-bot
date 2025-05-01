# frozen_string_literal: true

source "https://rubygems.org"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 8.0.1"
# The modern asset pipeline for Rails [https://github.com/rails/propshaft]
gem "propshaft"
# Use sqlite3 as the database for Active Record
gem "sqlite3", ">= 2.1"
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"
# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"
# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"
# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"
# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: [:windows, :jruby]

# Use the database-backed adapters for Rails.cache, Active Job, and Action Cable
gem "solid_cable"
gem "solid_cache"
gem "solid_queue"

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Deploy this application anywhere as a Docker container [https://kamal-deploy.org]
gem "kamal", require: false

# Add HTTP asset caching/compression and X-Sendfile acceleration to Puma [https://github.com/basecamp/thruster/]
gem "thruster", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem "devise", "~> 4.9"

gem "htmlbeautifier", "~> 1.4"

gem "view_component", "~> 3.22"

gem "kramdown", "~> 2.5"

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: [:mri, :windows], require: "debug/prelude"

  # Static analysis for security vulnerabilities [https://brakemanscanner.org/]
  gem "brakeman", require: false

  # https://github.com/rubocop/rubocop-rails
  gem "rubocop-rails", require: false

  gem "rubocop-rspec"

  gem "rubocop-capybara"

  gem "rubocop-factory_bot"

  gem "rubocop-rspec_rails"

  gem "rspec-rails"

  gem "factory_bot_rails"
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # use lookbook for component development
  gem "lookbook", ">= 2.3.8"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end

gem "dartsass-rails", "~> 0.5.1"

gem "foreman", "~> 0.88.1"

gem "bootstrap", "~> 5.3"

gem "bootstrap_form", "~> 5.4"

group :pry do
  gem "awesome_print"
  # https://github.com/deivid-rodriguez/pry-byebug
  # use 3.10.0 or later to surpress deprecation warnings
  # chore: use pry-byebug 3.10.0 to surpress deprecation warnings
  gem "pry"
  gem "pry-byebug", "~> 3.11.0"
  # https://github.com/pry/pry-doc
  gem "pry-doc"
  # https://github.com/pry/pry-rails
  gem "pry-rails"
end

gem "telegram-bot", "~> 0.16.7"

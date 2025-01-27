source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"
gem "rails", "~> 7.0.4"
gem "sprockets-rails"
gem "pg"
gem "puma", "~> 5.6.7"
gem "jsbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "redis", "~> 4.0"
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
gem "bootsnap", require: false
gem "image_processing", "~> 1.2"
gem "pg_search"
gem "ransack"
gem "bundle-audit"
gem "brakeman", require: false
gem "simple_form"
gem "will_paginate", "~> 4.0.0"


# Add platform-specific declarations for the non-platform-specific gems
platforms :ruby do
  gem "devise", "~> 4.8", ">= 4.8.1"
  gem "friendly_id", "~> 5.4", ">= 5.4.2"
  gem "cssbundling-rails"
  gem "name_of_person"
  gem "sidekiq", "~> 6.5", ">= 6.5.4"
  gem "stripe"
end

group :development, :test do
  gem "debug", platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem "web-console"
end

group :test do
  gem "selenium-webdriver"
  gem "webdrivers"
end

group :development, :test do
  gem "capybara"
  gem "rspec-rails"
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'pry'
end

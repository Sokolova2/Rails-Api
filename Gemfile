# frozen_string_literal: true

source 'https://rubygems.org'

gem 'cssbundling-rails'
gem 'importmap-rails'
gem 'jbuilder'
gem 'pg', '~> 1.1'
gem 'propshaft'
gem 'puma', '>= 5.0'
gem 'rails', '~> 8.0.4'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'tzinfo-data', platforms: %i[windows jruby]

gem 'solid_cable'
gem 'solid_cache'
gem 'solid_queue'

gem 'bootsnap', require: false

gem 'kamal', require: false

gem 'thruster', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'

  gem 'brakeman', require: false

  gem 'factory_bot_rails'

  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'web-console'

  gem 'haml-rails'
  gem 'html2haml'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem 'dotenv-rails'

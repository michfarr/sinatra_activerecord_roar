# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.3.1'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-activerecord'
gem 'rake'
gem 'roar'
gem 'hyperresource'
gem 'jwt'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'rubocop'
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'cucumber'
  gem 'capybara'
  gem 'rspec'
end

group :development do
  gem 'pry-byebug'
  gem 'guard-cucumber'
  gem 'guard-rubocop'
end

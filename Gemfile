source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "pg", ">= 0.18", "< 2.0"
gem "rails", "~> 6.0.3", ">= 6.0.3.6"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "devise"
gem 'bootstrap-sass', '3.4.1'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'enumerize'
gem "slim-rails"
gem 'simple_form'

gem 'decent_exposure', '~> 3.0'

group :development, :test do
  gem 'pry'
  gem 'rubocop'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
end

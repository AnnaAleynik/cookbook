source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.5"

gem "action_policy"
gem "bootstrap-sass", "3.4.1"
gem "devise"
gem "jbuilder", "~> 2.7"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "rails", "~> 6.0.5", ">= 6.0.5.1"
gem "sass-rails", ">= 6"
gem "turbolinks", "~> 5"
gem "webpacker", "~> 5.0"

gem "bootsnap", ">= 1.4.2", require: false
gem "enumerize"
gem "simple_form"
gem "slim-rails"

gem "decent_exposure", "~> 3.0"
gem "devise_invitable"
gem "interactor", "~> 3.0"
gem "sidekiq", "~> 6.4"

group :development, :test do
  gem "brakeman"
  gem "bundler-audit"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails", "~> 5.0.0"
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem "rubocop-rspec"
end

group :development do
  gem "letter_opener"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara", ">= 2.15"
  gem "database_cleaner-active_record"
  gem "selenium-webdriver"
  gem "webdrivers"
end

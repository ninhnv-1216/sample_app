source "https://rubygems.org"
git_source(:github){|repo| "https://github.com/#{repo}.git"}

ruby "2.6.9"

gem "bcrypt", "3.1.13"

gem "faker", "2.1.2"

gem "pagy"

gem "figaro"

gem "image_processing", "1.9.3"

gem "mini_magick", "4.9.5"

gem "i18n-js"

gem "pry-rails"

gem "config"

gem "bootstrap-sass", "3.4.1"

gem "jquery-rails"

gem "rails", "~> 6.0.4", ">= 6.0.4.4"

gem "active_storage_validations", "0.8.2"

gem "rails-i18n"

gem "i18n_lazy_scope"

gem "mysql2", ">= 0.5"

gem "puma", "~> 4.1"

gem "sass-rails", ">= 6"

gem "webpacker", "~> 5.0"

gem "turbolinks", "~> 5"

gem "jbuilder", "~> 2.7"

gem "bootsnap", ">= 1.4.2", require: false

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
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
end

group :development, :test do
  gem "webdrivers"
end

gem "tzinfo-data", platforms: %i(mingw mswin x64_mingw jruby)

group :development, :test do
  gem "debug", platforms: %i(mri mingw x64_mingw)
  gem "rubocop", "~> 0.74.0", require: false
  gem "rubocop-checkstyle_formatter", require: false
  gem "rubocop-rails", "~> 2.3.2", require: false
end

group :production do
  gem 'pg',             '0.17.1'
  gem 'rails_12factor', '0.0.2'
end

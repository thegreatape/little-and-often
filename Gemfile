source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'webpacker'
gem 'pg'
gem "haml-rails", "~> 0.9"
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem "twitter-bootstrap-rails"
gem "devise"
gem 'uglifier', '>= 1.3.0'
gem 'bcrypt', '~> 3.1.7'
gem 'rspec-rails'
gem 'simple_form'
gem "jquery-rails"
gem "select2-rails"
gem "simple_calendar", "~> 2.0"
gem 'devise-bootstrap-views'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

source 'https://rubygems.org'

gem 'rails', '~> 5.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'haml'
  gem 'haml-rails'
  gem 'simple_form'
  gem 'nokogiri' # required for minitest-have_tag
  gem "minitest", "5.10.1"
  gem 'minitest-color'
  gem "administrate"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# my additions
gem 'devise', '~> 4.2.0'
group :production do
  gem 'pg', '0.18.4'
  gem 'puma'
end
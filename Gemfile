source 'https://rubygems.org'

gem 'rails'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'simple_form'

# Adding security
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'pundit'
# gem "administrate"
gem 'nokogiri' # required for minitest-have_tag

group :development, :test do
  gem 'byebug'
  gem 'haml'
  gem 'haml-rails'
  gem "minitest", "5.10.1"
  gem 'minitest-color'
  gem "awesome_print"
  gem "table_print"
  gem 'guard' # NOTE: this is necessary in newer versions
  gem 'guard-minitest'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
end

group :production do
  gem 'pg', '0.18.4'
  gem 'puma'
end
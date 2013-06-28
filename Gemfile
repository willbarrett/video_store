source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Application Dependencies
gem 'sqlite3' # Because this isn't production code...
gem 'rb-readline' # just in case readline isn't installed.
gem "paperclip", "~> 3.4.2" # file handling
gem 'bcrypt-ruby' # for has_secure_password
gem "draper", "~> 1.2.1"
gem "money-rails" # for prices

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.3.2.0'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :test do
  gem "rspec-rails"
end

group :development, :test do
  gem "guard-rspec"
end

group :test do
  gem 'factory_girl_rails'
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

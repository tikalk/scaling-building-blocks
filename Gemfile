source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'
gem 'puma'
gem 'dalli'   # memcached client
gem 'redis-rails'   # another cache store
gem 'sunspot_rails', github: 'sunspot/sunspot', branch: 'master'

gem 'mysql2'
gem 'devise'
gem 'cancan'
gem "rolify", :git => "git://github.com/EppO/rolify.git"
gem 'rails_admin'
gem 'carrierwave', git: "git://github.com/jnicklas/carrierwave.git"
gem "rmagick"
gem 'activemerchant'
gem 'kaminari'
gem "redis", "~> 3.0.1"
gem 'redis-objects'
gem 'sidekiq'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'bootstrap-sass', '~> 2.3.1.0'

  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  # optional pre-packaged Solr distribution for use in development
  gem 'sunspot_solr', github: 'sunspot/sunspot', branch: 'master'
  gem 'rails-dev-boost', :git => 'git://github.com/thedarkone/rails-dev-boost.git'
  gem 'annotate', ">=2.5.0"
end

group :test do
  gem 'cucumber'
  gem 'guard'
  gem 'libnotify'
  gem 'rspec-rails'
  # DRb server for testing frameworks
  gem 'spork'
  gem "capybara"
  gem "factory_girl_rails", "~> 4.0"
  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-spork' 
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-stack_explorer'
  gem 'pry-debugger'
  gem 'pry-doc'
  gem 'progress_bar'
end

gem 'jquery-rails'

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


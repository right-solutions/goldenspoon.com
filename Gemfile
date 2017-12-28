source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'state_machines'
gem 'state_machines-activerecord'

# If you are working parallely on development version of kuppayam or usman,
# and would like to use them use the kuppayam project path of your system
# gem 'sbidu_generators', path: "/Users/rightsolutions/Projects/Products/sbidu_generators"
# gem 'kuppayam', path: "/Users/rightsolutions/Projects/Products/kuppayam"
# gem 'pattana', path: "/Users/rightsolutions/Projects/Products/pattana"
# gem 'usman', path: "/Users/rightsolutions/Projects/Products/usman"
# gem 'dhatu', path: "/Users/rightsolutions/Projects/Products/dhatu"

# otherwise just use a published gem
gem "sbidu_generators"
gem "kuppayam", '~> 0.1', ">= 0.1.30"
gem "pattana", '~> 0.1', ">= 0.1.22"
gem "usman", '~> 0.3', ">= 0.3.33"
gem "dhatu", '~> 0.1', ">= 0.1.15"

gem "filesize", "~> 0.1", ">= 0.1.0"
gem "colorize"
gem 'carrierwave', "~> 1.1", ">= 1.1.0"
gem 'carrierwave-base64'
# gem 'fog'
gem 'mini_magick', "~> 4.8", ">= 4.8.0"
gem "kaminari"

gem "active_model_serializers"
gem 'listen', '>= 3.0.5', '< 3.2'

group :development do
  # Access an IRB console on exception pages or by using console anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano',         require: false
  gem 'capistrano-rbenv',   require: false,   github: "capistrano/rbenv"
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
  
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'

  gem 'rspec-rails', '~> 3.5'
  gem 'factory_bot_rails'

  gem 'pry', '~> 0.10.4'

  gem "shoulda"
  gem 'database_cleaner'

  #gem 'cucumber-rails', :require => false
  #gem 'cucumber-websteps'
  #gem 'pickle'
  #gem 'capybara'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

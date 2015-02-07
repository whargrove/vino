source 'https://rubygems.org'

gem 'rails', '~> 4.2.0'

# Use postgreSQL as the database for Active Record
gem 'pg', '~> 0.18.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0.1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '~> 2.7.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# Use jquery as the JavaScript library
gem 'jquery-rails', '~> 4.0.3'

# Use V8 JavaScript interpreter
gem 'therubyracer', '~> 0.12.1'

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.1.5'

# Use RedCloth for converting posts into HTML
gem 'RedCloth', '~> 4.2.9'

# Use bootstrap-sass
gem 'bootstrap-sass', '~> 3.3.3'

# Use friendly_id for user readable URLs and better SEO
# TODO Upgrade to v5.1.0
gem 'friendly_id', '~> 5.0.0'

# Use will_paginate-bootstrap to paginate on Posts#index
gem 'will_paginate-bootstrap', '~> 1.0.1'

# Use whenever to publish posts
gem 'whenever', '~> 0.9.4'

# Social media gems to extend posts
gem 'twitter', '~> 5.13.0'

# Use rspec-rails for testing
group :development, :test do
  gem 'sqlite3', '~> 1.3.10'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec-collection_matchers'
  gem 'factory_girl_rails', '~> 4.0'
  gem 'fuubar', '~> 2.0.0'
  gem 'spring', '~> 1.3.0'
  gem 'codeclimate-test-reporter', '~> 0.4.6', require: nil
end

# Development gems
group :development do
  # TODO Add pessimistic operators for capistrano* gems
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
end

source 'https://rubygems.org'

gem 'rails',                   '5.0.1'
gem 'bcrypt',                  '3.1.11'
gem 'faker',                   '1.6.6'
gem 'carrierwave',             '0.11.2'
gem 'mini_magick',             '4.5.1'
gem 'fog',                     '1.38.0'
gem 'will_paginate',           '3.1.0'
gem 'bootstrap-will_paginate', '0.0.10'
gem 'bootstrap-sass',          '3.3.6'
gem 'puma',                    '3.9.1'
gem 'sass-rails',              '5.0.6'
gem 'uglifier',                '3.0.0'
gem 'coffee-rails',            '4.2.1'
gem 'jquery-rails',            '4.1.1'
gem 'turbolinks',              '5.0.1'
gem 'jbuilder',                '2.4.1'
gem 'mail_form'
gem 'simple_form'
gem "recaptcha", require: "recaptcha/rails"

group :development, :test do
  gem 'sqlite3', '1.3.12'
  gem 'byebug',  '9.0.0', platform: :mri
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  gem 'web-console',           '3.1.1'
  gem 'listen',                '3.0.8'
  gem 'spring'
  gem 'spring-watcher-listen'
  gem 'annotate'
end

group :test do
  gem 'rails-controller-testing', '0.1.1'
  gem 'minitest-reporters',       '1.1.9'
  gem 'guard',                    '2.13.0'
  gem 'guard-minitest',           '2.4.4'
end

group :production do
  gem 'pg',   '0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#gems added for API development..

gem 'pundit'
gem "active_model_serializers", "~> 0.10.0"
gem 'active_hash_relation', '~> 1.4.0'
gem 'rack-cors', :require => 'rack/cors'
gem 'flexible_permissions'
gem 'rack-attack'
gem 'redis-activesupport'

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'database_cleaner'
  gem 'rspec-json_schema', :git => "git://github.com/blazed/rspec-json_schema.git"

end
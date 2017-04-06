source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'sqlite3'
gem 'rails', '~> 5.0.2'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'haml', '~> 4.0', '>= 4.0.7'
gem 'bootstrap-sass', '~> 3.3', '>= 3.3.7'
gem 'rubocop', require: false
gem 'simple_form'
gem 'twitter'
gem 'koala'
gem 'therubyracer'
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'trix'
gem 'paperclip'
gem 'omniauth-twitter'
gem 'omniauth-vkontakte'
gem 'omniauth-google-oauth2'
gem 'google-api-client', '~> 0.10'
#gem 'vk-ruby'
gem 'vkontakte_api', '~> 1.4'

#group :production do
#  gem 'pg'
#  gem 'rails_12factor'
#end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '~> 3.5'
  gem 'pry-rails'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

ruby '2.3.1'

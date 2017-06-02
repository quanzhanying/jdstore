source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0'
# Use sqlite3 as the database for Active Record

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
#gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#账号系统
gem 'devise'

#前端框架
gem 'bootstrap-sass'
gem 'simple_form'
gem 'font-awesome-rails'

#记录schema for model
gem 'annotate'

#图片功能
gem 'carrierwave'
gem 'mini_magick'

#订单信息提醒
gem 'letter_opener', group: :development

#订单状态
gem 'aasm'
#客服系统
gem "intercom-rails"

#搜索功能
gem 'ransack'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'seo_helper'

#后台商品排序
gem 'acts_as_list'

#七牛图片存储
gem 'carrierwave-qiniu'
gem 'qiniu-rs'

#密码管理
gem 'figaro'

#验证码(只能在本地运行)
gem 'rucaptcha'
gem 'dalli'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  #debug
  gem 'pry'
  #美化rails c界面
  gem 'awesome_rails_console'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  #gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
group :production do
  gem 'pg'
end

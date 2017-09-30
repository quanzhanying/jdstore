# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

# 针对 gem 'annotate' 的设定，执行rake db:migrate 后，直接将栏位信息注释到model中

Annotate.load_tasks

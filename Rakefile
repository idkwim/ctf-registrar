#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

CtfRegistrar::Application.load_tasks

namespace :assets do
  desc 'set thumbnails for cheevos'
  task :cheevos do
    FileList['app/assets/images/cheevos/*-32.png'].each do |f|
      bigger = f.gsub(/-32.png$/, '-64.png')
      sh "convert #{f} -sample 64x64 #{bigger}"
    end
  end
end

namespace :deploy do
  task :staging do
    sh "git push heroku master"
    sh "heroku run rake db:migrate --app ctf-registrar"
  end

  task :prod do
    sh "git push heroku-prod master"
    sh "heroku run rake db:migrate --app ctf-registrar-2014-prod"
  end
end

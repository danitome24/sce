# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'sce'
set :repo_url, 'git@bitbucket.org:danitome/sce.git'
set :linked_dirs, %w(
  bin log vendor/bundle public/system
  tmp/pids tmp/cache tmp/sockets
)
set :puma_bind, 'tcp://0.0.0.0:8080'
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

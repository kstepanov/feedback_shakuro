require 'mina/bundler'
require 'mina/rails'
require 'mina/git'
require 'mina/rvm'
require 'mina/puma'

set :domain, 'shakuro.com'
set :deploy_to, '/var/www/shakuro_feedback'
set :repository, 'git@github.com:kstepanov/feedback_shakuro.git'
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

set :user, 'shakuro_feedback'
set :rails_env, 'production'
set :application, "imin-#{rails_env}"
set :forward_agent, true
set :keep_releases, 3

set :shared_paths, (lambda do
  [
    'config/database.yml',
    'config/secrets.yml',
    "config/puma_#{rails_env}.rb",
    'log',
    'tmp/pids',
    'tmp/sockets',
    '.env'
  ]
end)

set :puma_config, -> { "#{deploy_to}/#{shared_path}/config/puma_#{rails_env}.rb" }

task :environment do
  ruby_version = IO.read("#{Dir.pwd}/.ruby-version").strip
  ruby_gemset = IO.read("#{Dir.pwd}/.ruby-gemset").strip
  invoke "rvm:use[#{ruby_version}@#{ruby_gemset}]"
end

# Put any custom mkdir's in here for when `mina setup` is ran.
# For Rails apps, we'll make some of the shared paths that are shared between
# all releases.
task setup: :environment do
  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/log")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/log")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/config")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/config")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/tmp")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/tmp/sockets")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/sockets")

  queue! %(mkdir -p "#{deploy_to}/#{shared_path}/tmp/pids")
  queue! %(chmod g+rx,u+rwx "#{deploy_to}/#{shared_path}/tmp/pids")

  queue! %(touch "#{deploy_to}/#{shared_path}/config/database.yml")
  queue  %(echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/database.yml'.")

  queue! %(touch "#{deploy_to}/#{shared_path}/config/secrets.yml")
  queue  %(echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/secrets.yml'.")

  queue! %(touch "#{deploy_to}/#{shared_path}/config/puma_production.rb")
  queue  %(echo "-----> Be sure to edit '#{deploy_to}/#{shared_path}/config/puma_production.rb'.")

  if repository
    repo_host = repository.split(%r{@|://}).last.split(%r{:|\/}).first
    repo_port = /:([0-9]+)/.match(repository) && /:([0-9]+)/.match(repository)[1] || '22'

    queue %(
      if ! ssh-keygen -H  -F #{repo_host} &>/dev/null; then
        ssh-keyscan -t rsa -p #{repo_port} -H #{repo_host} >> ~/.ssh/known_hosts
      fi
    )
  end
end

desc 'Deploys the current version to the server.'
task deploy: :environment do
  deploy do
    invoke :'git:clone'
    invoke :'deploy:link_shared_paths'
    invoke :'bundle:install'
    invoke :'rails:db_migrate'
    invoke :'rails:assets_precompile'
    invoke :'deploy:cleanup'

    to :launch do
      invoke :'puma:phased_restart'
    end
  end
end

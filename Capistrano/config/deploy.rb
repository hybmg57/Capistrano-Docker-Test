# config valid only for Capistrano 3.1
lock '3.2.1'

set :application, 'SecureAccountsServices'
set :repo_url, 'ssh://git@stash.sportsbet.com.au:7999/ssas/secureaccountservices.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/var/www/'

# Default value for :scm is :git
set :scm, :git

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{SecureAccountsServices/config/app.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

set :use_sudo, false

# set :config_files, %w()

namespace :deploy do

  before :deploy, 'deploy:ssh_agent'
  before :deploy, 'host_setup:setup_config'
  before :deploy, 'deploy:check_write_permissions'
  #before :deploy, 'deploy:check_revision'

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end


  desc 'Run ssh-agent on host machine for agent forwarding'
  task :ssh_agent do
    on roles(:all) do
      system 'SSH_AUTH_SOCK=/tmp/ssh-mZueDP7822/agent.7822; export SSH_AUTH_SOCK;'
      system 'SSH_AGENT_PID=7823; export SSH_AGENT_PID;'
      system 'echo Agent pid 7823;'
      system 'ssh-add'
    end
  end

end

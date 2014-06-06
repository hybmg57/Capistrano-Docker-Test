# require 'capistrano/notifier/mail'

# set :notifier_mail_options, {
#    :method  => :test, # :smtp, :sendmail, or any other valid ActionMailer delivery method
#    :from    => 'deploy@sportsbet.com.au',
#    :to      => ['jae.choi@sportsbet.com.au'],
#    :subject => "Successfully deployed #{application.titleize} to #{stage}", # OPTIONAL
#    :github  => 'MyCompany/project-name'
#}

# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

role :app, %w{root@172.17.0.2 root@172.17.0.3 root@172.17.0.4 root@172.17.0.5}
role :gold, %w{root@172.17.0.6}

set :branch, "HHVM_Reg_Mocked"
# set :branch, "master"

set :log_level, :debug
set :deploy_via, :remote_cache
# set :filter, :roles => %w{app gold}
# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

set :password, ask('Sever password', nil, echo: false)
# server '172.17.0.2', password: fetch(:password), roles: %w{app gold}, primary: true

set :rsync_options, %w[--recursive --delete --delete-excluded --exclude .git* --exclude cache --exclude log]

# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
  set :ssh_options, {
    keys: %w(~/.ssh/id_rsa),
    forward_agent: true,
    user: 'root',
    password: fetch(:password),
    port: 22
  }
#
# And/or per server (overrides global)
# ------------------------------------
# server 'example.com',
#   user: 'user_name',
#   roles: %w{web app},
#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }

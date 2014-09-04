# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary server in each group
# is considered to be the first unless any hosts have the primary
# property set.  Don't declare `role :all`, it's a meta role.

set :stage, :production
set :branch, "talking_quickly"

set :full_app_name, "#{fetch(:application)}"
set :server_name, "www.example.com example.com"

set :deploy_to, "/home/#{fetch(:deploy_user)}/#{fetch(:full_app_name)}"

set :rails_env, :production

set :unicorn_worker_count, 5

set :enable_ssl, false

role :app, %w{rails@localhost}
role :web, %w{rails@localhost}
role :db,  %w{rails@localhost}


# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server definition into the
# server list. The second argument is a, or duck-types, Hash and is
# used to set extended properties on the server.

server 'localhost', user: 'rails', roles: %w{web app, db}, primary: true


# Custom SSH Options
# ==================
# You may pass any option but keep in mind that net/ssh understands a
# limited set of options, consult[net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start).
#
# Global options
# --------------
 set :ssh_options, {
   keys: %w(/Users/koizumi/vagrant/alice/id_rsa),
   port: 2222,
   forward_agent: true,
   auth_methods: %w(publickey)
 }
#
# And/or per server (overrides global)
# ------------------------------------
server 'localhost',
  user: 'rails',
  roles: %w{web app},
  ssh_options: {
    user: 'rails', # overrides user setting above
    keys: %w(/Users/koizumi/vagrant/alice/id_rsa),
    forward_agent: true,
    auth_methods: %w(publickey)
    # password: 'please use keys'
  }

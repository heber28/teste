require 'bundler/capistrano'

set :domain, "railsapp.pro.br"
set :application, "teste"
set :repository, "git://github.com/heber28/teste.git"
set :scm, :git
set :user, "railsapps"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"

server domain, :app, :web, :db, :primary => true
after "deploy:update_code", "deploy:custom_symlinks"

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "your web-server here"                          # Your HTTP server, Apache/etc
#role :app, "your app-server here"                          # This may be the same as your `Web` server
#role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
#role :db,  "your slave db-server here"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
  task :custom_symlinks do
    run "rm -rf #{release_path}/db/production.sqlite3"
    run "ln -s #{shared_path}/production.sqlite3 #{release_path}/db/production.sqlite3"
  end
end



# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'refactorit-redesign'
set :repo_url, 'git@github.com:refactorit/refactorit-redesign.git'

# Default branch is :master
set :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/srv/www/refactorit'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5\

# rbenv related
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip
set :rbenv_custom_path, "/opt/rbenv/"

# bundler related
set :bundle_binstubs, -> { shared_path.join('bin') }
set :bundle_gemfile, -> { release_path.join('Gemfile') }

namespace :sidekiq do

  desc 'Start sidekiq'
  task :start do
    on roles(:web) do
      execute "cd #{ current_path } && bundle exec sidekiq -e #{ fetch(:stage) } -L log/sidekiq.log -d"
    end
  end
end


namespace :deploy do

  desc 'Start application'
  task :start do
    on roles(:web) do
      execute "cd #{ current_path } && bundle exec unicorn -c config/unicorn.rb -E #{ fetch(:stage) } -D"
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:web) do
      execute "kill `cat #{current_path}/tmp/pids/unicorn.pid`"
    end
  end

  desc 'Restart application'
  task :restart do
    invoke 'deploy:stop'
    invoke 'deploy:start'
  end

  after :publishing, :restart

end

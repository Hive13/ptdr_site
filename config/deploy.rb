set :application, 'pdtr_hive13_org'
set :repo_url, 'git@github.com:Hive13/ptdr_site.git'
set :deploy_to, '/var/www/ptdr.iwcg.net'
set :bundle_dir, ''
set :bundle_flags, '--deployment --quiet'
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.1.2'
set :bundle_roles, :all



# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'
# set :scm, :git

# set :format, :pretty
# set :log_level, :debug
# set :pty, true

# set :linked_files, %w{config/database.yml}
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
# set :keep_releases, 5

set :linked_files, %w{config/database.yml config/secrets.yml}


namespace :deploy do

  task :fix_absent_manifest_bug do
    on roles(:web) do
      within release_path do
        execute :rm, release_path.join('public', fetch(:assets_prefix), '.sprockets-manifest-*')
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end

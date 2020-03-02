# config valid for current version and patch releases of Capistrano
lock "~> 3.11.0"

set :application, "orth"
set :repo_url, "git@github.com:Danissss/orthology_db.git"
set :deploy_to, '/apps/orthdb/project'
set :use_sudo, false
set :linked_files, []
set :linked_dirs, %w{tmp/tmp_fasta log tmp/pids tmp/sockets 
  tmp/csv tmp/database_fasta_db tmp/filtered_result tmp/uploads}
set :keep_releases, 3

namespace :deploy do
  desc 'Start application'
  task :start do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "start"
      end
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "stop"
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:web) do
      within release_path do
        execute "script/puma.sh", "restart"
      end
    end
  end

  after :publishing, :restart, :cleanup
end
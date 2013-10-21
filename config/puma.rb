environment 'production'
pidfile '/var/app/support/pids/puma.pid'
bind 'tcp://0.0.0.0:80'
daemonize true
threads ENV['MIN_THREADS'], ENV['MAX_THREADS']
workers ENV['WORKERS']
preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end

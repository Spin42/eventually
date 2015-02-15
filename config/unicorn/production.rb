working_directory "/home/eventually/current"
worker_processes 4
preload_app true
timeout 180
listen "127.0.0.1:4242"
stderr_path "/home/eventually/current/log/production.log"
stdout_path "/home/eventually/current/log/production.log"
pid "/home/eventually/current/tmp/pids/unicorn.pid"

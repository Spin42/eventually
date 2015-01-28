working_directory "/home/spin42-reporting/current"
worker_processes 4
preload_app true
timeout 180
listen "127.0.0.1:4242"
stderr_path "/home/spin42-reporting/current/log/production.log"
stdout_path "/home/spin42-reporting/current/log/production.log"
pid "/home/spin42-reporting/current/tmp/pids/unicorn.pid"

# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/var/www/my_app"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "tmp/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "log/unicorn.log"
stdout_path "log/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.sock"
listen "/tmp/unicorn.skiprope.sock"

# Number of processes
worker_processes 4

# Time-out
timeout 30

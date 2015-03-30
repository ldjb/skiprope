# Set the working application directory
# working_directory "/path/to/your/app"

root = File.expand_path('../../', __FILE__)

working_directory root

preload_app true

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "#{root}/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.sock"
listen "/tmp/unicorn.skiprope.sock"

# Number of processes
worker_processes 4

# Time-out
timeout 30

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  Signal.trap "TERM" do
    Process.kill "QUIT", Process.pid
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection

  Signal.trap "TERM" do
    # nothing
  end
end

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = "#{root}/Gemfile"
end

#!/usr/bin/env ruby

if ENV["PORT"].nil?
  ENV["PORT"] = "3434"
end

trap "SIGINT" do
  puts "\n"
  exit
end

`bundle exec unicorn -p #{ENV["PORT"]} -c ./config/unicorn.rb`

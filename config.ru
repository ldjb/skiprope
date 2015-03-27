require 'rubygems'
require 'bundler/setup'
Bundler.require(:default)
require 'sass/plugin/rack'
require 'sinatra-index'
require './serve'

# use scss for stylesheets
Sass::Plugin.options[:style] = :compressed
Sass::Plugin.options[:css_location] = File.dirname(__FILE__) + "/style/sass"
Sass::Plugin.options[:template_location] = File.dirname(__FILE__) + "/style/sass"
use Sass::Plugin::Rack
set :static, true
set :public_folder, File.dirname(__FILE__)
use_static_index 'index.html'

run Sinatra::Application

require 'appengine-rack'

AppEngine::Rack.configure_app(
  :application => 'step_counter',
  :version => 1
)

require 'step_counter'

run Sinatra::Application


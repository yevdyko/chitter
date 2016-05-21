ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require 'tilt/haml'
require 'haml'
require 'time-lord'

require_relative 'data_mapper_setup'

require_relative 'helpers/helpers'
require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/peeps_controller'

class Chitter < Sinatra::Base

  enable :sessions
  enable :partial_underscores

  set :session_secret, 'super secret'

  set :root, File.dirname(__FILE__)
  set :views, Proc.new { File.join(root, 'views') }

  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  helpers Helpers

  get '/' do
    redirect to '/peeps'
  end

  # start the server if ruby file executed directly
  run! if __FILE__ == $PROGRAM_NAME
end

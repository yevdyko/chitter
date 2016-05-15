ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'data_mapper_setup'

require_relative 'helpers'
require_relative 'controllers/users'
require_relative 'controllers/sessions'
require_relative 'controllers/peeps'

class Chitter < Sinatra::Base

  enable :sessions
  enable :partial_underscores

  set :session_secret, 'super secret'
  set :partial_template_engine, :erb

  set :views, Proc.new { File.join(root, '../views') }

  register Sinatra::Flash
  register Sinatra::Partial

  use Rack::MethodOverride

  helpers Helpers

  get '/' do
    redirect to '/peeps' if current_user
    @user = User.new
    erb :index
  end

  # start the server if ruby file executed directly
  run! if __FILE__ == $PROGRAM_NAME
end

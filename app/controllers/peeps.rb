class Chitter < Sinatra::Base

  get '/peeps' do
    @peeps = Peep.all
    haml :'peeps/index'
  end

  get '/peeps/new' do
    haml :'peeps/new'
  end

  post '/peeps' do
    peep = Peep.create(message: params[:message])
    current_user.peeps << peep
    current_user.save
    redirect to '/peeps'
  end

end

class Chitter < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email],
                             params[:password])
    if user
      user = User.first(email: params[:email])
      session[:user_id] = user.id
      redirect to('/')
    else
      flash.now[:errors] = ['The email or password is incorrect']
      erb :'sessions/new'
    end
  end

  delete '/sessions' do
    name = current_user.full_name
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye, #{name}!"
    redirect to('/sessions/new')
  end
end
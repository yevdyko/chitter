class Chitter < Sinatra::Base

  get '/sessions/new' do
    haml :'sessions/new'
  end

  post '/sessions' do
    email, password = params[:email], params[:password]
    user = User.authenticate(email, password)
    if user
      session[:user_id] = user.id
      redirect to '/'
    else
      flash.now[:errors] = ['The email or password is incorrect']
      haml :'sessions/new'
    end
  end

  delete '/sessions' do
    name = current_user.full_name
    session[:user_id] = nil
    flash.next[:notice] = "Goodbye, #{name}!"
    redirect to '/'
  end

end

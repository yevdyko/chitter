class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    haml :'users/new'
  end

  post '/users' do
    @user = User.new(name: params[:name],
                     username: params[:username],
                     email: params[:email],
                     password: params[:password],
                     password_confirmation: params[:password_confirmation])
    if @user.save
      user = User.first(email: params[:email])
      session[:user_id] = @user.id
      redirect to '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      haml :'users/new'
    end
  end
end

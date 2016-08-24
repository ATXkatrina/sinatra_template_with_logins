get '/login'  do
  erb :'users/login'
end

post '/login' do
  @user = User.find_by(email: params[:email])
  p @user
  if @user.authenticate(params[:password])
    # returning FALSE
    session[:id] = @user.id
    # or session[:id]?
    redirect :'/'
  else
    erb :'/users/login'
  end
end

get '/register' do
  erb :'/users/register'
end

post '/register' do
  new_user = User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])

  redirect :'/login'
end

get '/logout' do
  session.delete(:id)
  redirect '/'
end

get '/session_viewer' do
  session.inspect
end
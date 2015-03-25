get '/accounts/register' do
  erb :register
end

post '/accounts/register' do
  @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password_hash: params[:password])
  if @user.save
    session[:current_user_id] = @user.id
    redirect '/accounts/'+@user.username
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end

get '/accounts/login' do
  erb :login
end

post '/accounts/login' do
  user = User.find_by(email: params[:email])
  db_password = user.password_hash
  if db_password == params[:password]
    session[:current_user_id] = user.id
    redirect ('/accounts/' + user.username)
  else
    @error = 'Your email or password did not match. Please try again.'
    erb :login
  end
end

get '/accounts/:username/edit' do
  @user = session_current_user
  erb :edit_account
end

put '/accounts/:username/edit' do
  session_current_user.update_attributes(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], email: params[:email], password: params[:password], img_url: params[:img_url])
  redirect ('/accounts/'+session_current_user.username)
end

get '/accounts/:username/delete' do
  @user = session_current_user
  erb :delete_confirmation
end

delete '/accounts/:username/delete' do
  session_current_user.delete
  session.clear
  redirect ('/')
end

get '/accounts/:username' do
  @user = session_current_user
  @locations = current_users_locations
  erb :profile
end
get '/authentication/signin' do
  erb :'authentication/signin'
end

get '/authentication/signup' do
  erb :'authentication/signup'
end

post '/authentication/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    redirect '/?error=true'
  end
end

post '/authentication/register_user' do
  if params[:password] == params[:password_confirm]
    user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password])
    user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/?error=true'
  end

end

get '/authentication/logout' do
  session[:user_id] = nil
  redirect '/'
end

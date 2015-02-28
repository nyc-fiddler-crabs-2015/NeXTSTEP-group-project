get '/task/new' do
  @day = params[:day]
  @category = Category.all
  erb :'/task/create'
end

post '/task/create' do
  user = User.find(session[:user_id])
  Task.create(title: params[:title], completed: false, day: params[:day], user_id: user.id , category_id: params[:category])
  redirect '/users/#{user.id}'
end

get '/task/new' do
  @day = parms[:day]
  @category = Category.all
  erb :'/task/create'
end

post '/task' do
  user = User.find(session[:user_id])
  Task.create(title: params[:title], completed: false, day: params[:day], user: user.id , caegory: params[:category])
  redirect '/users/:id'
end

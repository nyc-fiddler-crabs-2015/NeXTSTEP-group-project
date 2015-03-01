get '/task/new' do
  @title = params[:title]
  @day = params[:day]
  @category = Category.all
  erb :'/task/create'
end

post '/task/create' do
  user = User.find(session[:user_id])
  Task.create(title: params[:title], completed: false, day: params[:day], user_id: user.id , category_id: params[:category])
  redirect '/users/#{user.id}'
end

get '/task/:id' do
 @task = Task.find(params[:id])
 erb :'task/show'
end

get '/task/:id/edit' do
  @task = Task.find(params[:id])
  erb :'task/edit'
end

put '/task/:id' do
  @task = Task.find(params[:id])
  @task.update_attributes(params[:title])
  redirect '/task/#{id}'
end

delete '/task/:id' do
  @task = Task.find(params[:id]).destroy
  redirect '/users/<%= user.id %>'
end

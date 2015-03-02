get '/task/new' do
  @title = params[:title]
  @day = params[:day]
  p params[:title]
  @category = Category.all
  erb :'/task/create'
end

post '/task/create' do
  user = User.find(session[:user_id])
  Task.create(title: params[:title], completed: false, day: params[:day], user_id: user.id, category_id: params[:category])
  redirect "/users/#{user.id}"
end

get '/task/:id' do
 @task = Task.find(params[:id])
 erb :'task/edit'
end

get '/task/:id/edit' do
  @task = Task.find(params[:id])
  erb :'task/edit'
end

put '/task/:id' do
  @task = Task.find(params[:id])
  @task.update(title: params[:title])
  redirect "/users/#{@task.user_id}"
end

delete '/task/:id' do
  @task = Task.find(params[:id]).destroy
  redirect "/users/#{@task.user_id}"
end

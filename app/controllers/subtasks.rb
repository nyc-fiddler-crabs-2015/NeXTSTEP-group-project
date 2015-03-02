get '/task/:id/subtask/new' do
 @task = Task.find(params[:id])
 erb :'subtask/new'
end

post '/task/:id/subtask' do
  @subtask = Subtask.create(params[:subtask])
  redirect '/task/<%= @task.id %>'
end

put '/subtask/:id' do
  subtask = Subtask.find(params[:id])
  subtask.update(completed: true)
  redirect "/users/#{session[:user_id]}"
end

delete '/subtask/:id' do
  Subtask.destroy(params[:id])
  redirect "/users/#{session[:user_id]}"
end

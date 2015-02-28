get '/users/:id' do
  @user = User.find(params[:id])
  @tasks = @user.fetch_tasks
  erb :'users/show'
end

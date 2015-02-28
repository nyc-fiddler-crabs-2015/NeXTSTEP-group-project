get '/users/:id' do
  @user = User.find(params[:id])
  @tasks = {}

  erb :'users/show'
end

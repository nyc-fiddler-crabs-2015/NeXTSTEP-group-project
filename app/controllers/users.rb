get '/users/:id' do
  @user = User.find(params[:id])
  @tasks = {}
  ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Weekend'].each do |day|
    @tasks[day] = @user.tasks.where(day: day)
  end
  erb :'users/show'
end

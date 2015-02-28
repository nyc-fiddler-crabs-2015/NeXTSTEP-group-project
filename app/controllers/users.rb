get '/users/:id' do
  @user = User.find(params[:id])
  @tasks = {}
  ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Weekend'].each do |day|
    @tasks[day] = @user.tasks.find_by(day: day)
  end

  erb :'users/show'
end

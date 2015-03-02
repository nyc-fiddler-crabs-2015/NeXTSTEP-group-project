require_relative '../spec_helper'

describe "Task controller"  do
let(:task) {Task.create(title:"Demo App", completed: false, day: "Monday", user_id: 1, category_id: 1)}

 describe "GET /task/new" do
  it "loads the tasks new page" do
    get '/task/new'
    expect(last_response).to be_ok
  end
 end

describe "POST /task/create" do
  it "creates a task and redirects to user page" do
   post '/task/create', params={task:{title:"Demo App", completed: false, day: "Monday", user_id: 1, category_id: 1}}
   expect(last_response).to be_redirect
   follow_redirect!
   last_request.path.should == "/users/<%= user.id %>"
  end
end

describe "GET /task/:id" do
  it "should display the task with a specific id" do
    get "/task/#{task.id}"
    expect(last_response).to be_ok
  end
 end

describe "GET /task/:id/edit" do
  it "should display task edit page" do
    get "/task/#{task.id}/edit"
    expect(last_response.body).to include("Edit Task")
  end
 end

end
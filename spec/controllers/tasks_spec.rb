require_relative '../spec_helper'

describe "Task controller"  do
let(:task) {Task.create(title:"Demo App", completed: false, day: "Monday", user_id: 1, category_id: 1)}

 describe "GET /tasks/new" do
  it "loads the tasks new page" do
    get '/tasks/new'
    expect(last_response).to be_ok
  end
 end




end
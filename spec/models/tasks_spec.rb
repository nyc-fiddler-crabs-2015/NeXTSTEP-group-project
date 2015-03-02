require_relative '../spec_helper'

describe 'Task Model' do
   # Use LET Syntax to dry up code
  #  let(:task) {be something }

  it 'marked the task as completed in the model object' do
    task = Task.new(title: 'This task should be complete', day: 'Monday', user_id: 1, category_id: 1)

    #Setting Attributes is something that ActiveRecord tests for us.
    task.completed = true
    expect(task.completed).to eq(true)
  end

  it 'marked the task as completed in the database' do
    task = Task.create(title: 'This task should be complete', day: 'Monday', user_id: 1, category_id: 1)
    task.completed = true
    task.save
    updated_task = Task.find_by(title: 'This task should be complete')
    expect(updated_task.completed).to eq(true)
  end
end

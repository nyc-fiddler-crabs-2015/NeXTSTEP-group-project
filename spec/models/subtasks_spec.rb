require_relative '../spec_helper'

describe 'Subtasks Model' do
  it 'marked the subtask as completed in the model object' do
    task = task.create(title: 'test task', day: 'Monday', user_id: 1, category_id: 1)
    subtask = Subtask.new(title: 'This subtask should be complete', task_id: task.id)
    subtask.completed = true
    expect(subtask.completed).to eq(true)
  end

  it 'marked the task as completed in the database' do
    task = task.create(title: 'test task', day: 'Monday', user_id: 1, category_id: 1)
    subtask = Subtask.create(title: 'This subtask should be complete', task_id: task.id)
    subtask.completed = true
    subtask.save
    updated_subtask = Subtask.find_by(title: 'This subtask should be complete')
    expect(updated_subtask.completed).to eq(true)
  end
end

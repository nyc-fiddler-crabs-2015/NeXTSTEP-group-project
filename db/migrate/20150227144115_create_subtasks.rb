class CreateSubtasks < ActiveRecord::Migration
  def change
    create_table :subtasks do |t|
      t.string :title
      t.boolean :completed
      t.references :task
    end
  end
end

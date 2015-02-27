class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :title
      t.boolean :completed
      t.string :day
      t.references :user
      t.references :category

      t.timestamps
    end
  end
end

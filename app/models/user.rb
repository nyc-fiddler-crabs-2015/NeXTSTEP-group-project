class User < ActiveRecord::Base
  has_secure_password
  has_many :tasks

  def fetch_tasks
    output_tasks = {}
    ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Weekend'].each do |day|
      output_tasks[day] = {open: tasks.where(day: day, completed: false),
                           complete: tasks.where(day: day, completed: true)}
    end
    output_tasks
  end

  def task_categories(day_of_week = nil)
    output_tasks = {}
    tasks_array = day_of_week ? tasks.where(day: day_of_week) : tasks
    Category.all.each do |cat|
      if tasks_array.select {|task| task.category_id == cat.id}.count > 0
        output_tasks[cat.title] = tasks_array.select {|task| task.category_id == cat.id}.count
      end
    end
    output_tasks
  end
end

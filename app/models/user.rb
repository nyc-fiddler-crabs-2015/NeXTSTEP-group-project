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
end

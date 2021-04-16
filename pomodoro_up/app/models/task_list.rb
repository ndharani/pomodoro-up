class TaskList < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy  # remove associated tasks when removing a task list

    validates :name, presence: true

    def active_tasks
      self.tasks.where(status: Task.active_task_status).all
    end

    def finished_tasks
      self.tasks.where(status: Task.finished_task_status).all
    end

    def deleted_tasks
      self.tasks.where(status: Task.deleted_task_status).all
    end
end

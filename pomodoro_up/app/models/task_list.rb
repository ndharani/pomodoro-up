class TaskList < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy  # remove associated tasks when removing a task list
end

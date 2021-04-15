class Task < ApplicationRecord
  belongs_to :task_list

  validates :name, presence: true
end

class Task < ApplicationRecord
  belongs_to :task_list

  validates :name, presence: true

  # authoritative task status definitions
  def self.active_task_status
    "active"
  end

  def self.finished_task_status
    "done"
  end

  def self.deleted_task_status
    "deleted"
  end
end

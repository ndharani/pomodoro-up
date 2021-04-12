class AddDefaultToTaskListStatus < ActiveRecord::Migration[6.1]
  def up
    change_column :task_lists, :status, :string, :default => "active"
    change_column :task_lists, :pomodoros_started, :integer, :default => 0
    change_column :task_lists, :pomodoros_completed, :integer, :default => 0
  end

  def down
    # don't change anything on rollback
  end
end

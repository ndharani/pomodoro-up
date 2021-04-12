class CreateTaskLists < ActiveRecord::Migration[6.1]
  def change
    create_table :task_lists do |t|
      t.string :name
      t.integer :user_id
      t.string :status
      t.integer :pomodoros_started
      t.integer :pomodoros_completed
      t.timestamps
    end
  end
end

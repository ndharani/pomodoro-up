class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.integer :task_list_id
      t.string :name, null: false
      t.string :status, default: "active"
      t.timestamps
    end
  end
end

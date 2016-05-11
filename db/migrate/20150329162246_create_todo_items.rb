class CreateTodoItems < ActiveRecord::Migration
  def change
    create_table :todo_items do |t|
      t.datetime :due_date
      t.string :task_title
      t.string :description
      t.references :todo_list

      t.timestamps
    end
    add_index :todo_items, :todo_list_id
  end
end

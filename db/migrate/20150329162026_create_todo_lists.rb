class CreateTodoLists < ActiveRecord::Migration
  def change
    create_table :todo_lists do |t|
      t.string :list_name
      t.datetime :list_due_date
      t.references :user

      t.timestamps
    end
    add_index :todo_lists, :user_id
  end
end

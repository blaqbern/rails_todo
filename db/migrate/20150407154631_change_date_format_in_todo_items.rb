class ChangeDateFormatInTodoItems < ActiveRecord::Migration
  def up
    change_column :todo_items, :due_date, :date
  end

  def down
    change_column :todo_items, :due_date, :datetime
  end
end

class ChangeDateFormatInTodoLists < ActiveRecord::Migration
  def up
    change_column :todo_lists, :list_due_date, :date
  end

  def down
    change_column :todo_lists, :list_due_date, :datetime
  end
end

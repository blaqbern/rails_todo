class CreateTagsTodoItems < ActiveRecord::Migration
  def change
    create_table :tags_todo_items, id: false do |t|
      t.references :tag
      t.references :todo_item
    end
    add_index :tags_todo_items, :tag_id
    add_index :tags_todo_items, :todo_item_id
  end
end

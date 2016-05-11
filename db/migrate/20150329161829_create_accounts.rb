class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :gender
      t.string :age
      t.string :first_name
      t.string :last_name
      t.references :user

      t.timestamps
    end
    add_index :accounts, :user_id
  end
end

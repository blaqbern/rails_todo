class User < ActiveRecord::Base
  has_secure_password

  has_one :account, dependent: :destroy
  has_many :todo_lists, dependent: :delete_all
  has_many :todo_items, through: :todo_lists
  attr_accessible :login, :password
end

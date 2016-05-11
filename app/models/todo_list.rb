class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items, dependent: :delete_all
  attr_accessible :list_due_date, :list_name
  default_scope order('list_due_date ASC')

  validates :list_name, presence: true
  validates :list_due_date, presence: true
end

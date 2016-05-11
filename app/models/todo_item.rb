class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_and_belongs_to_many :tags
  attr_accessible :description, :due_date, :task_title, :done
  default_scope order('due_date ASC')

  validates :task_title, presence: true
  validates :due_date, presence: true
  validate :not_due_after_list

  def not_due_after_list
    if todo_list
      errors.add(:due_date, 'The due date must be the same as or earlier than the todo list due date') if self.due_date > todo_list.list_due_date
    end
  end

end

class Tag < ActiveRecord::Base
  has_and_belongs_to_many :todo_items
  attr_accessible :tag_name
end

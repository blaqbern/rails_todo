class Account < ActiveRecord::Base
  belongs_to :user
  attr_accessible :age, :first_name, :gender, :last_name

  validates :first_name, presence: true, length: {maximum: 30}
  validates :last_name, presence: true, length: {maximum: 30}
  validates :gender, format: {
    with: /^(fe)?male$|^n\/a$/i,
    message: 'gender must be either "male", "female" or "N/A"'
  }
  validates :age, numericality: {
    greater_than_or_equal_to: 20,
    less_than_or_equal_to: 100
  }
end

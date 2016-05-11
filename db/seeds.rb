User.destroy_all
Account.destroy_all
TodoList.destroy_all
TodoItem.destroy_all
Tag.destroy_all

#create some users
user1 = User.create! login: 'atlantis', password: '@ctuallyOn'
user2 = User.create! login: 'conley11', password: 'grit&grind'
user3 = User.create! login: 'piggish', password: '_digit$'
matt = User.create! login: 'Matt', password: 'abc123'
tim = User.create! login: 'Tim', password: 'abc123'

#create account for each user
user1.account = Account.create! gender: 'female', age: 34, first_name: 'Erica', last_name: 'Trident'
user2.account = Account.create! gender: 'male', age: 27, first_name: 'Mike', last_name: 'Conley'
user3.account = Account.create! gender: 'male', age: 41, first_name: 'Porky', last_name: 'Maiale'
matt.account = Account.create! gender: 'male', age: 22, first_name: 'Matt', last_name: 'Davis'
tim.account = Account.create! gender: 'male', age: 23, first_name: 'Tim', last_name: 'Smith'

#create some lists and populate them
list1 = TodoList.create! list_name: 'grocery shopping', list_due_date: DateTime.new(2015, 5, 12)
list1.todo_items << TodoItem.create!(description: 'get thing', task_title: 'get apples', due_date: DateTime.new(2015, 5, 12))
list1.todo_items << TodoItem.create!(description: 'get thing', task_title: 'get peaches', due_date: DateTime.new(2015, 5, 12))
list1.todo_items << TodoItem.create!(description: 'get thing', task_title: 'get plums', due_date: DateTime.new(2015, 5, 12))

list2 = TodoList.create! list_name: 'clothes shopping', list_due_date: DateTime.new(2015, 5, 31)
list2.todo_items << TodoItem.create!(description: 'buy stuff', task_title: 'get pants', due_date: DateTime.new(2015, 5, 31))
list2.todo_items << TodoItem.create!(description: 'buy stuff', task_title: 'get t-shirts', due_date: DateTime.new(2015, 5, 31))
list2.todo_items << TodoItem.create!(description: 'buy stuff', task_title: 'get socks', due_date: DateTime.new(2015, 5, 31))

list3 = TodoList.create! list_name: 'christmas list', list_due_date: DateTime.new(2015, 5, 16)
list3.todo_items << TodoItem.create!(description: 'pick up item', task_title: 'get toys', due_date: DateTime.new(2015, 5, 16))
list3.todo_items << TodoItem.create!(description: 'pick up item', task_title: 'get gadgets', due_date: DateTime.new(2015, 5, 16))
list3.todo_items << TodoItem.create!(description: 'pick up item', task_title: 'get ties', due_date: DateTime.new(2015, 5, 16))

list4 = TodoList.create! list_name: 'hardware store', list_due_date: DateTime.new(2015, 4, 24)
list4.todo_items << TodoItem.create!(description: 'do the thing', task_title: 'get nails', due_date: DateTime.new(2015, 4, 24))
list4.todo_items << TodoItem.create!(description: 'do the thing', task_title: 'get tools', due_date: DateTime.new(2015, 4, 24))
list4.todo_items << TodoItem.create!(description: 'do the thing', task_title: 'get gum', due_date: DateTime.new(2015, 4, 24))

list5 = TodoList.create! list_name: 'eat dinner out', list_due_date: DateTime.new(2015, 6, 2)
list5.todo_items << TodoItem.create!(description: 'eat the thing', task_title: 'eat appetizer', due_date: DateTime.new(2015, 6, 2))
list5.todo_items << TodoItem.create!(description: 'eat the thing', task_title: 'eat entree', due_date: DateTime.new(2015, 6, 2))
list5.todo_items << TodoItem.create!(description: 'eat the thing', task_title: 'eat dessert', due_date: DateTime.new(2015, 6, 2))

# create a bunch of dummy lists...
lots_of_lists = []
40.times {|i| lots_of_lists << TodoList.create!(list_name: "dummy list #{i+1}", list_due_date: Date.new(2025, 1, 1))}

# ...and a list with a bunch of dummy items to demostrate pagination
list_with_lots_of_items = TodoList.create! list_name: "lots of todo items", list_due_date: Date.new(2015, 1, 1)
40.times do |i|
  list_with_lots_of_items.todo_items << TodoItem.create!(task_title: "item #{i+1}", description: 'fake', due_date: Date.new(2015, 1, 1))
end

# create a list item with a long description in one of Matt's lists
lots_of_lists.first.todo_items << TodoItem.create!(task_title: 'an item with a long description', due_date: DateTime.new(2025, 1, 1), description:
  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla varius accumsan mi, vitae tristique purus dictum a. Curabitur bibendum orci eu ullamcorper fermentum. Curabitur id odio urna. Aliquam vulputate, metus ut faucibus molestie, enim nibh gravida est, vitae ultricies ex purus vitae ante. Nullam porta augue id laoreet sollicitudin. Sed consectetur elit sed purus suscipit, pharetra malesuada augue finibus. Duis pharetra dolor pretium massa elementum scelerisque. Nam sapien risus, lacinia porta pretium in, posuere et neque. Vivamus posuere, diam et lacinia maximus, diam libero sagittis diam, et laoreet dolor augue et magna. Nulla laoreet dapibus metus.

  Cras lorem lacus, congue mollis malesuada sit amet, eleifend at est. In imperdiet magna nec ipsum efficitur, sed tincidunt erat scelerisque. Proin non posuere nunc, eu sodales ante. Integer sed sapien at libero aliquam convallis sit amet at ligula. Quisque sollicitudin arcu quam, sed congue elit tincidunt a. Sed vel ligula vitae orci pharetra pretium. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. In ex nisl, vestibulum vel rhoncus aliquet, suscipit vel purus. Morbi lectus orci, elementum iaculis dolor vel, pulvinar mattis erat. Nulla tincidunt ante nisi, non pharetra dolor varius at. Vivamus sodales ex laoreet nulla lacinia posuere.'
)

#create some tags
tag1 = Tag.create tag_name: 'urgent'
tag2 = Tag.create tag_name: 'fun times'
tag3 = Tag.create tag_name: 'food'

#add some tags to some items
list1.todo_items.each do |item|
  item.tags << tag1
  item.tags << tag3
end
list2.todo_items.each do |item|
  item.tags << tag2
end
list3.todo_items.each do |item|
  item.tags << tag1
  item.tags << tag2
end
list5.todo_items.each do |item|
  item.tags << tag1
  item.tags << tag2
  item.tags << tag3
end

#add some lists to some users
user1.todo_lists << list1
user1.todo_lists << list2

user2.todo_lists << list3

user3.todo_lists << list4
user3.todo_lists << list5

lots_of_lists.each {|list| matt.todo_lists << list}
tim.todo_lists << list_with_lots_of_items

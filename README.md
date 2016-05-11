#Todo List App - Model Structure

This document describes the database structure of our Todo List app. For the most part, we think it's easiest to describe the entities and relationships through examples, and so that's how we'll structure this document.

There are five entities that make up the model for our app:

- User
- Account
- TodoList
- TodoItem
- Tag

These entities have various associations as shown in the ER diagram below. Some of them also have other requirements like restrictions on allowable values for certain fields or default ordering. We'll describe all of these characteristics in more detail below.

![ER diagram](/erd.png)

## Associations

Note: The examples below assume the existence of some sample data in the database.

###Each user has exactly one account and each account belongs to exactly one user

```ruby
user = User.find 12

puts "user id: #{user.id}"
puts "has account id: #{user.account.id}"
puts "account id: #{account.id}"
puts "belongs to user id: #{account.user.id}"
```
Output:
```
user id: 12
has account id: 12
account id: 12
belongs to user id: 12
```

###Each user has many todo_lists and each todo_list belongs to one user

```ruby
user = User.find 27

user.todo_lists.each do |list|
  puts "list: '#{list.list_name}' belongs to user: #{list.user.id}"
end
```
Output:
```
list: 'grocery shopping' belongs to user: 27
list: 'clothes shopping' belongs to user: 27
list: 'hardware store' belongs to user: 27
```

###Each todo_list has many todo_items and each todo_item belongs to one todo_list

```ruby
list = TodoList.first

puts "list name: '#{list.list_name}'"
list.todo_items.each do |item|
  puts "todo_item: '#{item.task_title}' belongs to list: '#{item.todo_list.list_name}'"
end
```
Output:
```
list name: 'hardware store'
todo_item: 'get nails' belongs to list: 'hardware store'
todo_item: 'get tools' belongs to list: 'hardware store'
todo_item: 'get gum' belongs to list: 'hardware store'
```

###Tags and todo_items have a many-to-many association
```ruby
tag = Tag.first
item = TodoItem.last

puts "tag: '#{tag.tag_name}' belongs to (has) these items:"
tag.todo_items.each {|todo| puts "\t'#{todo.task_title}'"}
puts ''

puts "todo_item: '#{item.task_title}' has (belongs to) these tags:"
item.tags.each {|tag| puts "\t'#{tag.tag_name}'"}
```
Output:
```
tag: 'urgent' belongs to (has) these items:
	'get apples'
	'get peaches'
	'get plums'
	'get toys'
	'get gadgets'
	'get ties'
	'eat appetizer'
	'eat entree'
	'eat dessert'

todo_item: 'eat appetizer' has (belongs to) these tags:
	'urgent'
	'fun times'
	'food'
```

###Todo_items can be retrieved from user records directly without accessing todo_lists

```ruby
user = User.first

direct_access_todos = []
user.todo_items.each {|item| direct_access_todos << item}

todos_via_todo_lists = []
user.todo_lists.each do |list|
  list.todo_items.each {|item| todos_via_todo_lists << item}
end

puts 'user.todo_items:'
direct_access_todos.each {|todo| puts "\t'#{todo.task_title}'"}
puts ''

puts "todo_items accessed via user's todo_lists:"
todos_via_todo_lists.each {|todo| puts "\t'#{todo.task_title}'"}
```
Output:
```
user.todo_items:
	'get apples'
	'get peaches'
	'get plums'
	'get pants'
	'get t-shirts'
	'get socks'

todo_items accessed via user's todo_lists:
	'get apples'
	'get peaches'
	'get plums'
	'get pants'
	'get t-shirts'
	'get socks'
```

##Validations

###The Account field "gender" only accepts "female", "male" or "N/A"

```ruby
fake1 = Account.create gender: 'emale', age: 37, first_name: 'C.', last_name: 'Change'

begin
  fake1.save!
rescue ActiveRecord::RecordInvalid => invalid
  puts fake1.errors
end
```
Output:
```
=> #<ActiveModel::Errors:0x007fd728191548 @base=#<Account id: nil, gender: "emale", age: 37, first_name: "C.", last_name: "Change", user_id: nil, created_at: nil, updated_at: nil>,
@messages={:gender=>["gender must be either \"male\", \"female\" or \"N/A\""]}>
```

###The Account field "age" only accepts integers between 20 and 100

```ruby
fake2 = Account.create gender: 'MALE', age: 137, first_name: 'C.', last_name: 'Incertain'

begin
  fake2.save!
rescue ActiveRecord::RecordInvalid => invalid
  puts fake2.errors
end
```
Output:
```
=> #<ActiveModel::Errors:0x007fd728183560 @base=#<Account id: nil, gender: "MALE", age: 137, first_name: "C.", last_name: "Incertain", user_id: nil, created_at: nil, updated_at: nil>,
@messages={:age=>["must be less than or equal to 100"]}>
```
###TodoItems and TodoLists are returned in a soonest-first fashion

```ruby
lists = TodoList.all
puts 'todo_lists:'
lists.each do |list|
  puts "list: '#{list.list_name}', due: '#{list.list_due_date}'"
end
puts ''

items = TodoItem.all
puts 'todo_items:'
items.each do |item|
  puts "task: '#{item.task_title}', due: '#{item.due_date}'"
end
```
Output:
```
todo_lists:
list: 'hardware store', due: '2015-04-24 00:00:00 UTC'
list: 'grocery shopping', due: '2015-05-12 00:00:00 UTC'
list: 'christmas list', due: '2015-05-16 00:00:00 UTC'
list: 'clothes shopping', due: '2015-05-31 00:00:00 UTC'
list: 'eat dinner out', due: '2015-06-02 00:00:00 UTC'

todo_items:
task: 'get nails', due: '2015-04-24 00:00:00 UTC'
task: 'get tools', due: '2015-04-24 00:00:00 UTC'
task: 'get gum', due: '2015-04-24 00:00:00 UTC'
task: 'get apples', due: '2015-05-12 00:00:00 UTC'
task: 'get peaches', due: '2015-05-12 00:00:00 UTC'
task: 'get plums', due: '2015-05-12 00:00:00 UTC'
task: 'get toys', due: '2015-05-16 00:00:00 UTC'
task: 'get gadgets', due: '2015-05-16 00:00:00 UTC'
task: 'get ties', due: '2015-05-16 00:00:00 UTC'
task: 'get pants', due: '2015-05-31 00:00:00 UTC'
task: 'get t-shirts', due: '2015-05-31 00:00:00 UTC'
task: 'get socks', due: '2015-05-31 00:00:00 UTC'
task: 'eat appetizer', due: '2015-06-02 00:00:00 UTC'
task: 'eat entree', due: '2015-06-02 00:00:00 UTC'
task: 'eat dessert', due: '2015-06-02 00:00:00 UTC'
```

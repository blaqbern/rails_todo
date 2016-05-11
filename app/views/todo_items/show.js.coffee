detailsContainerId = '<%= "#details-container-#{@todo_list.id}-#{@todo_item.id}" %>'
detailsContainer = $(detailsContainerId)

detailsContainer.on 'click', '<%= "#close-desc-#{@todo_list.id}-#{@todo_item.id}" %>', (e) ->
  e.preventDefault()
  detailsContainer.slideUp 'fast'
  detailsContainer.html ''

if detailsContainer.html() is ''
  detailsContainer.html('<%= j render template: "todo_items/description.html.erb" %>').hide()
  detailsContainer.slideDown 'fast'
else
  $('<%= "#close-desc-#{@todo_list.id}-#{@todo_item.id}" %>').trigger 'click'

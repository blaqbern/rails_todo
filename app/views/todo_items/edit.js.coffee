formContainerId = '<%= "#form-container-#{@todo_list.id}-#{@todo_item.id}" %>'
formContainer = $(formContainerId)
listItemContents = formContainer.prev()

formContainer.on 'click', '<%= "#cancel-btn-#{@todo_list.id}-#{@todo_item.id}" %>', ->
  formContainer.slideUp 'slow', ->
    listItemContents.slideDown 'fast'
    formContainer.html ''

formContainer.html('<%= j render template: "todo_items/edit.html.erb" %>').hide()

listItemContents.slideUp 'fast', ->
  formContainer.removeClass 'hidden'
  formContainer.slideDown 'slow'

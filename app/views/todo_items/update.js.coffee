formContainerId = '<%= "#form-container-#{@todo_list.id}-#{@todo_item.id}" %>'
formContainer = $(formContainerId)
listItemContents = formContainer.prev()
listItem = formContainer.parent()

formContainer.slideUp 'slow', ->
  listItemContents.slideDown 'fast'
  listItem.fadeOut 400, ->
    updatedItem = $('<%= j render @todo_item %>').hide()
    listItem.replaceWith updatedItem
    $(formContainerId).parent().fadeIn 400

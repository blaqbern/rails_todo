formContainerId = '<%= "#form-container-#{@todo_list.id}" %>'
formContainer = $(formContainerId)
listItemContents = formContainer.prev()
listItem = formContainer.parent()

formContainer.slideUp 'slow', ->
  listItemContents.slideDown 'fast'
  listItem.fadeOut 400, ->
    updatedItem = $('<%= j render @todo_list %>').hide()
    listItem.replaceWith updatedItem
    $(formContainerId).parent().fadeIn 400

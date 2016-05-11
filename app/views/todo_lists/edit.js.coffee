formContainerId = '<%= "#form-container-#{@todo_list.id}" %>'
formContainer = $(formContainerId)
listItemContents = formContainer.prev()

formContainer.on 'click', '<%= "#cancel-btn-#{@todo_list.id}" %>', ->
  formContainer.slideUp 'slow', ->
    listItemContents.slideDown 'fast'
    formContainer.html ''

formContainer.html('<%= j render template: "todo_lists/inline_edit.html.erb" %>').hide()

listItemContents.slideUp 'fast', ->
  formContainer.removeClass 'hidden'
  formContainer.slideDown 'slow'

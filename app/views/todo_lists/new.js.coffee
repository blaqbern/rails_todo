formContainer = $('#form-container')
addNewListDiv = formContainer.prev()

$('.alt').on 'click', '#cancel-btn', ->
  formContainer.slideUp 'slow', ->
    addNewListDiv.slideDown 'fast'
    formContainer.html ''

formContainer.html('<%= j render template: "todo_lists/new.html.erb" %>').hide()

addNewListDiv.slideUp 'fast', ->
  formContainer.removeClass 'hidden'
  formContainer.slideDown 'slow'

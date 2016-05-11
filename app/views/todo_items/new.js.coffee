formContainer = $('#form-container')
addNewItemDiv = formContainer.prev()

$('.alt').on 'click', '#cancel-btn', ->
  formContainer.slideUp 'slow', ->
    addNewItemDiv.slideDown 'fast'
    formContainer.html ''

formContainer.html('<%= j render template: "todo_items/new.html.erb" %>').hide()

addNewItemDiv.slideUp 'fast', ->
  formContainer.removeClass 'hidden'
  formContainer.slideDown 'slow'

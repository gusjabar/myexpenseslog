window.CategoriesIndexController = ((categoriesServices)->
  Init = ->
    console.log "OnInit_CategoriesIndexController "
    $(document).on "click", ".js-delete-subcategory", onClick_DeleteSubcategory
    $(document).on "click", "#btnAddNewSubcategory", showNewSubcategory
    return

  onClick_DeleteSubcategory = (e)->
    e.preventDefault()
    subCategoryId = $(this).attr("data-id")
    confirm = $(this).attr("data-message")
    bootbox.confirm
      message: confirm
      buttons:
        confirm:
          label: 'Yes'
          className: 'btn-success'
        cancel:
          label: 'No'
          className: 'btn-danger'
      callback: (result) ->
        if result
          onDelete_Subcategory(subCategoryId)
          console.log 'This was logged in the callback: ' + result
        return

  onDelete_Subcategory = (id)->
    console.log "Call services: " + id
    categoriesServices.deleteSubcategory(id, doneDeleteSubcategory, failDeleteSubcategory)

  doneDeleteSubcategory = (data)->
    console.log "done: " + data
    return
  failDeleteSubcategory = (err)->
    console.log "fail: " + err
    return

#Show Modal Popup
  showNewSubcategory = ->
    console.log "btn click"
    categoriesServices.createNewSubcategory(doneNewSubcategoriesModal, failNewSubcategories)
    return

  doneNewSubcategoriesModal = (html)->
    dialog = bootbox.dialog(
      title: "New Subcategory"
      message: html
      closeButton: true)
    dialog.init ->
      $(".bootbox").removeAttr("tabindex") #fix not focus in input search
      $('select').select2 theme: 'bootstrap'
      $("span.select2.select2-container").removeAttr("style") #fix width
      $(".select2 .select2-container").css("width", "100%") #fix width
    return

  failNewSubcategories = (err)->
    console.log(err)
    return


  return {
    init: Init
  })(window.CategoriesServices)

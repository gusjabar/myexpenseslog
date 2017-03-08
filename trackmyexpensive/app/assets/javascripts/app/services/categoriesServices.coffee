window.CategoriesServices = (() ->
  console.log "Load Categories Services"
  #private methods
  deleteSubcategory = (subcategoryId, doneDeleteSubcategory, failDeleteSubcategory) ->
    $.ajax(
      method: 'DELETE'
      url: '/subcategories/' + subcategoryId
    )
      .done(doneDeleteSubcategory)
      .fail(failDeleteSubcategory)
    return

  createNewSubcategory = (doneNewSubcategoryModal, failNewSubcategoryModal) ->
    $.get("/subcategories/new")
      .done(doneNewSubcategoryModal)
      .fail(failNewSubcategoryModal)
    return

  #public methods
  return {
    deleteSubcategory: deleteSubcategory,
    createNewSubcategory: createNewSubcategory
  })()
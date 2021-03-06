###window.categorySelect = $("#expensive_category_id")
subCategorySelect = $("#expensive_subcategory_id")###

window.ExpensiveIndexController = ((expensiveServices)->
#container = $("#container-expensive")
  init = ->

    $(document).on "click", "#btnAddNewExpensive", showNewExpensive
    $(document).on 'change', "#expensive_category_id", loadSubcategories
    $('#container-expensive').on 'show', initLoadForFilters
    $(".container").on "click", ".js-reset-filter", resetFilters
    $(window).load initLoadForFilters
    return

  showNewExpensive = ->
    console.log "btn click"
    expensiveServices.createNewExpensive(doneLoadSubcategoriesModal, failLoadSubcategories)
    return

  doneLoadSubcategoriesModal = (html)->
    dialog = bootbox.dialog(
      title: "New Expense"
      message: html
      closeButton: true)
    dialog.init ->
      $('.datepicker').datepicker()
      $(".bootbox").removeAttr("tabindex") #fix not focus in input search
      $('select').select2 theme: 'bootstrap'
      $("span.select2.select2-container").removeAttr("style") #fix width
      $(".select2 .select2-container").css("width", "100%") #fix width
    return

  failLoadSubcategories = (err)->
    console.log(err)
    return

  loadSubcategories = ->
    $("#expensive_subcategory_id").empty()
    $("#expensive_subcategory_id").select2 placeholder: "Select a Subcategory"
    categoryId = $("#expensive_category_id").val()
    console.log categoryId
    expensiveServices.loadSubcategories(categoryId, doneLoadSubcategories, failLoadSubcategories)
    return

  doneLoadSubcategories = (data)->
    $("#expensive_subcategory_id").select2
      theme: "bootstrap"
      category = JSON.parse data
      subcategories = category["Subcategory"]
      if subcategories.length > 0
        $(".js-new-subcategory").hide()
        $("#expensive_subcategory_id").prop('disabled', false)

        $.each subcategories, (index)->
          $("#expensive_subcategory_id")
            .append("<option value=" + subcategories[index]["id"] + ">" + subcategories[index]["Name"] + "</option>");
      else
        $("#expensive_subcategory_id")
          .append("<option value='-1'> Subcategory is requierd</option>");
        $("#expensive_subcategory_id").prop('disabled', true)
        $(".js-new-subcategory").show()
    return

  initLoadForFilters = ->
    console.log 'initLoadForFilters'
    $('select').select2
    $('select').select2 theme: 'bootstrap'
    $("span.select2.select2-container").removeAttr("style") #fix width
    $(".select2 .select2-container").css("width", "100%") #fix width
    return

  resetFilters = ->
    console.log 'resetSelect2Values'
    $("#filterrific_filter")[0].reset()

    $('#filterrific_with_category_id').select2 'val', 0
    $('#filterrific_sorted_by').select2 'val', 'logdate_desc'
    $('#filterrific_sorted_by').val("logdate_desc").trigger("change");
    return

  failLoadSubcategories = (err)->
    console.log(err);
    ###$('body').append "AJAX Error: " + err###
    return

  return{
    init: init
  })(window.ExpensiveServices)
